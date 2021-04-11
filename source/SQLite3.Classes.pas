unit SQLite3.Classes;
{ *******************************************************

  SQLite 3 Dynamic Library wrapper for Delphi

  2012 Ángel Fernández Pineda. Madrid. Spain.

  This work is licensed under the Creative Commons
  Attribution-ShareAlike 3.0 Unported License. To
  view a copy of this license,
  visit http://creativecommons.org/licenses/by-sa/3.0/
  or send a letter to Creative Commons,
  444 Castro Street, Suite 900,
  Mountain View, California, 94041, USA.

  *******************************************************

  This file defines Delphi-friendly classes to SQLite3
  "objects" and their functions.
  It is not part of the SQLite3 definition and not
  strictly required.

  Blobs and Unicode are supported

  *******************************************************

  CHANGE LOG:

  - 2012-03-22: First implementation
  - 2019-09-19: Updated to SQLITE version 3.25.1
  - 2021-04-06: Updated to SQLITE version 3.35.
  - 2021-04-07: Added "SQLStr" function

  TO DO:

  - More class proxies to SQL functions, mutexes and the
  like

  ******************************************************* }

interface

uses
  SQLite3.Core.Objects, System.SysUtils, System.Classes, System.Variants;

type
  { ESQLiteError

    PURPOUSE: SQLite related exceptions
  }
  ESQLiteError = class(Exception)
  public
    class function SQLiteErrMsg(ErrCode: integer): string;
    class procedure Test(ErrCode: integer);
  end;

  { ESQLiteSytanxError

    PURPOUSE: SQL syntax related exceptions
  }
  ESQLiteSyntaxError = class(ESQLiteError);

{$SCOPEDENUMS ON}

type
  // types required by TSQLiteDatabase.Create
  TSQLiteThreadMode = (singleThread, multiThread, serialized);
  TSQLiteOpenMode = (createAsNeeded, readWrite, readOnly);
  TSQLiteCacheMode = (sharedCache, privateCache);

type
  { TSQLiteCursor

    PURPOUSE: Navigate through a result set

    GENERAL USAGE:

    1) Get an instance from TSQLiteStatement.Cursor

    2) Move through rows. There are two choices:

    a)
    statement.Cursor.First;
    while statement.Cursor.HasData do
    begin
    ...
    statement.Next
    end;

    b)
    while statement.Cursor.Next do ...

    3) Read column data by the means of ColumnAsXXX properties.
    For blob reading, there are two choices:
    a) ColumnToStream procedure (recommended for blob columns).
    b) ColumnSize and ColumnAsBlob properties

    REMARKS:

    - There is no sense in creating or destroying instances of TSQLiteCursor.
    They are managed by TSQLiteStatement.

    - Altering parameter bindings will reset its cursor.

    - If your query does not retrieve data (for example, INSERT INTO),
    ColumnCount property will be zero.

    - Column indexes are zero-based.

    - "ColumnType" will return "varArray" for blob data and "varDouble" for
    floating-point data.

    - "CurrentRowCount" property returns the number of times that "Next" has
    returned true. After first call to Next, if the query does
    not return any result set, this value will be 1.
    If the query returns a result set, but it is empty, this value
    will be 0.
  }
  TSQLiteCursor = class
  protected
    FHandle: Psqlite3_stmt;
    FHasData: boolean;
    FRowCount: int64;
    procedure TestColumnError(index: integer);
    function GetColumnName(index: integer): string;
    function GetColumnType(index: integer): TVarType;
    function GetIsNull(index: integer): boolean;
    function GetisBlob(index: integer): boolean;
    function GetAsInteger(index: integer): integer;
    function GetAsInt64(index: integer): int64;
    function GetAsString(index: integer): string;
    function GetAsDouble(index: integer): double;
    function GetAsBlob(index: integer): Pointer;
    function GetColumnSize(index: integer): integer;
    function GetColumnCount: integer;
    function GetSourceSchema(index: integer): string;
    function GetSourceTable(index: integer): string;
    function GetSourceColumn(index: integer): string;
  public
    constructor Create(Handle: Psqlite3_stmt);
    procedure Reset;
    procedure First;
    function Next: boolean;
    procedure ColumnToStream(index: integer; Stream: TStream);

    property CurrentRowCount: int64 read FRowCount;
    property ColumnCount: integer read GetColumnCount;
    property HasData: boolean read FHasData;
    property ColumnName[index: integer]: string read GetColumnName;
    property ColumnType[index: integer]: TVarType read GetColumnType;
    property ColumnIsNull[Index: integer]: boolean read GetIsNull;
    property ColumnIsBlob[Index: integer]: boolean read GetisBlob;
    property ColumnAsInteger[Index: integer]: integer read GetAsInteger;
    property ColumnAsInt64[Index: integer]: int64 read GetAsInt64;
    property ColumnAsDouble[Index: integer]: double read GetAsDouble;
    property ColumnAsString[Index: integer]: string read GetAsString;
    property ColumnAsBlob[Index: integer]: Pointer read GetAsBlob;
    property ColumnSize[Index: integer]: integer read GetColumnSize;
    property ColumnSchema[Index: integer]: string read GetSourceSchema;
    property ColumnTable[Index: integer]: string read GetSourceTable;
    property ColumnSource[Index: integer]: string read GetSourceColumn;
  end;

  { TSQLiteStatement

    PURPOUSE: Bind parameters to a query, and obtain a result set

    GENERAL USAGE:

    1) Get an instance by calling TSQLiteDatabase.Query

    2) Set parameters either by name or index. Indexes are 1-based and follows
    SQLite rules. Use SetParamBlob procedure to set blob data (see remarks
    below).

    3) Execute yor query. There are two options:

    a) Use the Cursor property (see TSQLiteCursor)
    b) If you are not interested in the result set, call "Execute".
    That is the case of CREATE TABLE, INSERT INTO and the like.
    It is also useful in order to know if a query contains data or not
    (see remarks).

    4) Call TSQLiteStatement.Free

    REMARKS:

    - TSQLiteStatement instances are not destroyed by TSQLiteDatabase.
    You must call "myStatement.Free". However,
    you must not call "myStatement.Cursor.Free".

    - Do not share TSQLiteStatement instances between threads, even
    if multi-threading is enabled at SQLite. Otherwise,
    you need to synchronize access to instances.
    See SQLite's documentation on multi-threading.

    - Note that parameter names will start with ":" or "@" and are
    case-sensitive.

    - Do not rely on ParamCount property if "?NNN" parameters are used.

    - "Execute" will return zero if the query does not contain a result set.
    In other case, it will return the number of rows in the result set.
    Check isReadOnly property to know the case.

    - There are three versions of SetParamBlob:
    a) The first uses data from a Buffer. That buffer should not be
    disposed until TSQLiteStatement instance is destroyed,
    unless "mayChange" is true. In that case, buffer contents are first
    copied to a private buffer. Use wisely.

    b) The second one copies an entire stream content into a private buffer,
    so it is safe to dispose that stream. However, it may consume a lot
    of memory. Use wisely.

    c) The third one creates a blob filled with zeroes of the given size.
    Actual blob contents should be writen later. TSQLiteBlobStream may help.
  }
  TSQLiteStatement = class
  protected
    FCursor: TSQLiteCursor;
    function GetParamCount: integer;
    function GetIsReadOnly: boolean;
    procedure SetParamByIndex(index: integer; const Value: variant);
    procedure SetParamByName(Name: string; const Value: variant);
  public
    constructor Create(db: PSQLite3; const SQL: string);
    destructor Destroy; override;
    function IndexOf(const ParamName: string): integer;
    function NameOf(index: integer): string;
    procedure SetParamBlob(index: integer; const Buffer: Pointer; size: integer;
      mayChange: boolean = false); overload;
    procedure SetParamBlob(index: integer; Stream: TStream); overload;
    procedure SetParamBlob(index: integer; zerosCount: integer); overload;
    function Execute: int64;
    property isReadOnly: boolean read GetIsReadOnly;

    property ParamCount: integer read GetParamCount;
    property Param[index: integer]: variant write SetParamByIndex;
    property ParamByName[Name: string]: variant write SetParamByName;
    property Cursor: TSQLiteCursor read FCursor;
  end;

  { TSQLiteDatabase

    PURPOUSE: Open a sqlite3 database

    GENERAL USAGE:

    1) Create an instance

    2) Execute queries. There are two options:

    a) Get a TSQLiteStatement by the means of "Query".
    b) Call "Execute", which behaves the same as TSQLiteStatement.Execute.
    However, no parameters may be provided. This is the prefered method
    for DDL statements, such as CREATE TABLE.

    3) Call TSQLiteStatement.Free;

    REMARKS:

    - If no parameters are provided to constructor,
    an in-memory database is created.

    - Several database files may be opened simultaneously by the
    means of an "ATTACH" query. See SQLite documentation.
  }
  TSQLiteDatabase = class
  protected
    FHandle: PSQLite3;
  public
    constructor Create(URI: string = ':memory:';
      OpenMode: TSQLiteOpenMode = TSQLiteOpenMode.createAsNeeded;
      ThreadMode: TSQLiteThreadMode = TSQLiteThreadMode.multiThread;
      CacheMode: TSQLiteCacheMode = TSQLiteCacheMode.privateCache);
    function GetLastInsertRowID: int64;
    function GetLastErrorMessage: string;
    function Query(const SQL: string): TSQLiteStatement;
    function Execute(const SQL: string): int64;
    destructor Destroy; override;
  end;

  { TSQLiteBlobStream

    PURPOUSE: Asynchronous I/O operation to blob fields

    GENERAL USAGE:

    1) First, you need to write a query to obtain a ROWID.
    For example: "SELECT rowid FROM TableWithBlobs"

    2) Create a TSQLiteBlobStream instance.

    3) Use

    4) Free

    REMARKS:

    - "Schema" parameter to Create is the internal alias given to a database
    file in an "ATTACH" query. Default schema is "main". The schema for
    temporary tables is "temp".

    - TSQLiteBlobStream is not strictly required, since there are other methods
    in TSQLiteCursor which do the job. However, they are not practical when
    dealing with large amounts of data. On the counterpart, it is really
    annoying to obtain a rowid. Ask SQLite's designers.

    - Trying to change stream size will raise an exception. This is a
    SQLite restriction.
  }
  TSQLiteBlobStream = class(TStream)
  protected
    FHandle: PSQLite3_blob;
    FCurrentOffset: Longint;
    FSize: Longint;
    procedure SetSize(NewSize: Longint); override;
  public
    constructor Create(db: TSQLiteDatabase; const Schema, Table, Column: string;
      RowID: int64; readOnly: boolean = true); overload;
    constructor Create(db: TSQLiteDatabase; const Table, Column: string;
      RowID: int64; readOnly: boolean = true); overload;
    destructor Destroy; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

  { TSQLiteEngine

    PURPOUSE: General SQLite functionality not
    related to databases

  }
  TSQLiteEngine = class
  protected
    class function GetCompileOptionName(index: integer): string; static;
    class function GetCompileOptionByName(const Name: string): boolean; static;
  public
    class function IsValidSQL(const SQL: string): boolean; static;
    class property CompileOption[index: integer]: string
      read GetCompileOptionName;
    class property hasCompileOption[const Name: string]: boolean
      read GetCompileOptionByName;
  end;

function SQLStr(const text: string): string;

implementation

uses System.StrUtils, SQLite3.Core.Constants, SQLite3.Core.Functions;

resourcestring
  WRONG_INDEX_MSG = 'Wrong parameter index to SQL statement';
  EMPTY_CURSOR_MSG = 'Cursor is empty';
  OPEN_ERROR_MSG = 'Unable to open database';
  TYPE_CONVERSION_ERROR = 'Unable to perform data type conversion';
  INVALID_OFFSET_MSG = 'Trying to read/write outside blob bounds';
  NO_SIZE_CHANGE_MSG = 'Size of Blob stream can not be changed';
  MSG_INVALID_QUERY = 'Invalid SQL query';
  MSG_UNEXPECTED_ERROR_CODE = 'Unexpected Error Code "';
  MSG_SQLITE_OK = 'No error';
  MSG_SQLITE_ERROR = 'SQL error or missing database';
  MSG_SQLITE_INTERNAL = 'Internal SQLite error';
  MSG_SQLITE_PERM = 'Permission denied';
  MSG_SQLITE_ABORT = 'Aborted by Callback routine';
  MSG_SQLITE_BUSY = 'Database is locked or there are pending operations';
  MSG_SQLITE_LOCKED = 'Table is locked';
  MSG_SQLITE_NOMEM = 'Not enought memory';
  MSG_SQLITE_READONLY = 'Attempt to write a readonly database';
  MSG_SQLITE_INTERRUPT = 'Operation terminated by sqlite3_interrupt()';
  MSG_SQLITE_IOERR = 'Failed I/O operation';
  MSG_SQLITE_CORRUPT = 'The database disk image is malformed';
  MSG_SQLITE_NOTFOUND = 'Table or record not found';
  MSG_SQLITE_FULL = 'Database is full';
  MSG_SQLITE_CANTOPEN = 'Unable to open database file';
  MSG_SQLITE_PROTOCOL = 'Database lock protocol error';
  MSG_SQLITE_EMPTY = 'Database is empty';
  MSG_SQLITE_SCHEMA = 'Database schema changed';
  MSG_SQLITE_TOOBIG = 'Too much data for one row of a table';
  MSG_SQLITE_CONSTRAINT = 'Constraint violation';
  MSG_SQLITE_MISMATCH = 'Data type mismatch';
  MSG_SQLITE_MISUSE = 'Library misused';
  MSG_SQLITE_NOLFS = 'Use of OS features not supported on host';
  MSG_SQLITE_AUTH = 'Authorization denied';
  MSG_SQLITE_FORMAT = 'Format error';
  MSG_SQLITE_RANGE = 'Parameter out of range';
  MSG_SQLITE_NOTADB = 'Not a database file';
  MSG_SQLITE_ROW = 'Row ready';
  MSG_SQLITE_DONE = 'No more rows';

  // -------------------------------------------------------------------------
  // Formatting
  // -------------------------------------------------------------------------

function SQLStr(const text: string): string;
begin
  Result := '''' + ReplaceText(text, '''', '''''') + '''';
end;

// -------------------------------------------------------------------------
// ESQLiteError
// -------------------------------------------------------------------------

class function ESQLiteError.SQLiteErrMsg(ErrCode: integer): String;
begin
  case ErrCode of
    SQLITE_OK:
      Result := MSG_SQLITE_OK;
    SQLITE_ERROR:
      Result := MSG_SQLITE_ERROR;
    SQLITE_INTERNAL:
      Result := MSG_SQLITE_INTERNAL;
    SQLITE_PERM:
      Result := MSG_SQLITE_PERM;
    SQLITE_ABORT:
      Result := MSG_SQLITE_ABORT;
    SQLITE_BUSY:
      Result := MSG_SQLITE_BUSY;
    SQLITE_LOCKED:
      Result := MSG_SQLITE_LOCKED;
    SQLITE_NOMEM:
      Result := MSG_SQLITE_NOMEM;
    SQLITE_READONLY:
      Result := MSG_SQLITE_READONLY;
    SQLITE_INTERRUPT:
      Result := MSG_SQLITE_INTERRUPT;
    SQLITE_IOERR:
      Result := MSG_SQLITE_IOERR;
    SQLITE_CORRUPT:
      Result := MSG_SQLITE_CORRUPT;
    SQLITE_NOTFOUND:
      Result := MSG_SQLITE_NOTFOUND;
    SQLITE_FULL:
      Result := MSG_SQLITE_FULL;
    SQLITE_CANTOPEN:
      Result := MSG_SQLITE_CANTOPEN;
    SQLITE_PROTOCOL:
      Result := MSG_SQLITE_PROTOCOL;
    SQLITE_EMPTY:
      Result := MSG_SQLITE_EMPTY;
    SQLITE_SCHEMA:
      Result := MSG_SQLITE_SCHEMA;
    SQLITE_TOOBIG:
      Result := MSG_SQLITE_TOOBIG;
    SQLITE_CONSTRAINT:
      Result := MSG_SQLITE_CONSTRAINT;
    SQLITE_MISMATCH:
      Result := MSG_SQLITE_MISMATCH;
    SQLITE_MISUSE:
      Result := MSG_SQLITE_MISUSE;
    SQLITE_NOLFS:
      Result := MSG_SQLITE_NOLFS;
    SQLITE_AUTH:
      Result := MSG_SQLITE_AUTH;
    SQLITE_FORMAT:
      Result := MSG_SQLITE_FORMAT;
    SQLITE_RANGE:
      Result := MSG_SQLITE_RANGE;
    SQLITE_NOTADB:
      Result := MSG_SQLITE_NOTADB;
    SQLITE_ROW:
      Result := MSG_SQLITE_ROW;
    SQLITE_DONE:
      Result := MSG_SQLITE_DONE;
  else
    Result := MSG_UNEXPECTED_ERROR_CODE + IntToStr(ErrCode) + '"';
  end;
end;

class procedure ESQLiteError.Test(ErrCode: integer);
begin
  if (ErrCode = SQLITE_RANGE) then
    raise ERangeError.Create(SQLiteErrMsg(ErrCode));
  if (ErrCode <> SQLITE_OK) and (ErrCode < SQLITE_ROW) then
    raise ESQLiteError.Create(SQLiteErrMsg(ErrCode));
end;

// -------------------------------------------------------------------------
// TSQLite3Database
// -------------------------------------------------------------------------

constructor TSQLiteDatabase.Create(URI: string = ':memory:';
  OpenMode: TSQLiteOpenMode = TSQLiteOpenMode.createAsNeeded;
  ThreadMode: TSQLiteThreadMode = TSQLiteThreadMode.multiThread;
  CacheMode: TSQLiteCacheMode = TSQLiteCacheMode.privateCache);
var
  ErrCode: integer;
  flags: integer;
begin
  case OpenMode of
    TSQLiteOpenMode.createAsNeeded:
      flags := SQLITE_OPEN_READWRITE or SQLITE_OPEN_CREATE;
    TSQLiteOpenMode.readWrite:
      flags := SQLITE_OPEN_READWRITE;
    TSQLiteOpenMode.readOnly:
      flags := SQLITE_OPEN_READONLY;
  else
    flags := 0;
  end;

  case ThreadMode of
    TSQLiteThreadMode.multiThread:
      flags := flags or SQLITE_OPEN_NOMUTEX;
    TSQLiteThreadMode.serialized:
      flags := flags or SQLITE_OPEN_FULLMUTEX;
  end;

  case CacheMode of
    TSQLiteCacheMode.sharedCache:
      flags := flags or SQLITE_OPEN_SHAREDCACHE;
    TSQLiteCacheMode.privateCache:
      flags := flags or SQLITE_OPEN_PRIVATECACHE;
  end;

  ErrCode := sqlite3_open_v2((URI), FHandle, flags, nil);
  ESQLiteError.Test(ErrCode);
  if (FHandle = nil) then
    raise ESQLiteError.Create(OPEN_ERROR_MSG);
end;

destructor TSQLiteDatabase.Destroy;
begin
  if (FHandle <> nil) then
    ESQLiteError.Test(sqlite3_close(FHandle));
end;

function TSQLiteDatabase.Query(const SQL: string): TSQLiteStatement;
begin
  Result := TSQLiteStatement.Create(FHandle, SQL);
end;

function rowCountCallback(UserData: Pointer; NumCols: integer;
  ColValues: PUTF8CharArray; ColNames: PUTF8CharArray): integer; cdecl;
begin
  inc(PInt64(UserData)^);
  Result := SQLITE_OK;
end;

function TSQLiteDatabase.Execute(const SQL: string): int64;
var
  ErrCode: integer;
  perrmsg: PUTF8Char;
  errmsg: string;
begin
  Result := 0;
  perrmsg := nil;
  ErrCode := sqlite3_exec(FHandle, (SQL), rowCountCallback, @Result, perrmsg);
  if (perrmsg <> nil) then
    errmsg := string(perrmsg)
  else
    errmsg := '';
  sqlite3_free(perrmsg);
  if (ErrCode = SQLITE_ERROR) then
    raise ESQLiteSyntaxError.Create(errmsg);
  ESQLiteError.Test(ErrCode);
end;

function TSQLiteDatabase.GetLastInsertRowID: int64;
begin
  Result := sqlite3_last_insert_rowid(FHandle);
end;

function TSQLiteDatabase.GetLastErrorMessage: string;
var
  perrmsg: PUTF8Char;
begin
  perrmsg := Sqlite3_errmsg(FHandle);
  if (perrmsg <> nil) then
    Result := string(perrmsg)
  else
    Result := '';
end;

// -------------------------------------------------------------------------
// TSQLite3ResultSet
// -------------------------------------------------------------------------

constructor TSQLiteStatement.Create(db: PSQLite3; const SQL: string);
var
  ErrCode: integer;
  dummy: PUnicodeString;
  Handle: Psqlite3_stmt;
begin
  dummy := nil;
  ErrCode := sqlite3_prepare16_v2(db, SQL, ByteLength(SQL), Handle, dummy);
  if (ErrCode = SQLITE_ERROR) then
    raise ESQLiteSyntaxError.Create(ESQLiteError.SQLiteErrMsg(ErrCode));
  ESQLiteError.Test(ErrCode);
  if (Handle = nil) then
    raise ESQLiteSyntaxError.Create(MSG_INVALID_QUERY);
  FCursor := TSQLiteCursor.Create(Handle);
end;

destructor TSQLiteStatement.Destroy;
begin
  inherited Destroy;
  if (FCursor <> nil) then
    ESQLiteError.Test(sqlite3_finalize(FCursor.FHandle));
  FCursor.Free;
end;

function TSQLiteStatement.IndexOf(const ParamName: string): integer;
begin
  Result := sqlite3_bind_parameter_index(FCursor.FHandle, (ParamName));
end;

function TSQLiteStatement.NameOf(index: integer): string;
var
  pname: PUTF8Char;
begin
  pname := sqlite3_bind_parameter_name(FCursor.FHandle, Index);
  if (pname <> nil) then
    Result := string(pname)
  else
    Result := '';
end;

function TSQLiteStatement.GetParamCount: integer;
begin
  Result := sqlite3_bind_parameter_count(FCursor.FHandle);
end;

function TSQLiteStatement.GetIsReadOnly: boolean;
begin
  Result := (sqlite3_stmt_readonly(FCursor.FHandle) > 0);
end;

function TSQLiteStatement.Execute: int64;
begin
  while FCursor.Next do;
  if (isReadOnly) then
    Result := 0
  else
    Result := FCursor.CurrentRowCount;
  FCursor.Reset;
end;

procedure TSQLiteStatement.SetParamByIndex(index: integer;
  const Value: variant);
var
  ErrCode: integer;
  auxstr: string;
begin
  FCursor.Reset;
  case VarType(Value) of
    varNull:
      ErrCode := sqlite3_bind_null(FCursor.FHandle, Index);
    varSmallint, varInteger, varBoolean, varShortInt, varByte, varWord,
      varLongWord:
      ErrCode := sqlite3_bind_int(FCursor.FHandle, Index, Value);
    varInt64:
      ErrCode := sqlite3_bind_int64(FCursor.FHandle, Index, Value);
    varSingle, varDouble, varCurrency:
      ErrCode := sqlite3_bind_double(FCursor.FHandle, Index, Value);
  else
    auxstr := Value;
    ErrCode := sqlite3_bind_text16(FCursor.FHandle, Index, auxstr,
      ByteLength(auxstr), nil);
  end;
  ESQLiteError.Test(ErrCode);
end;

procedure TSQLiteStatement.SetParamByName(Name: string; const Value: variant);
begin
  SetParamByIndex(IndexOf(Name), Value);
end;

procedure TSQLiteStatement.SetParamBlob(index: integer; const Buffer: Pointer;
  size: integer; mayChange: boolean = false);
var
  flag: Pointer;
begin
  FCursor.Reset;
  if mayChange then
    flag := SQLITE_TRANSIENT
  else
    flag := SQLITE_STATIC;
  ESQLiteError.Test(sqlite3_bind_blob(FCursor.FHandle, Index, Buffer,
    size, flag));
end;

procedure TSQLiteStatement.SetParamBlob(index: integer; zerosCount: integer);
begin
  ESQLiteError.Test(sqlite3_bind_zeroblob(FCursor.FHandle, index, zerosCount));
end;

procedure FreeMemoryDestructor(Buffer: Pointer); cdecl;
begin
  // Auxiliary memory destructor for sqlite3_bind_blob
  FreeMemory(Buffer);
end;

procedure TSQLiteStatement.SetParamBlob(index: integer; Stream: TStream);
var
  Buffer: Pointer;
  rc: int64;
begin
  if (Stream <> nil) then
  begin
    rc := Stream.size;
    Buffer := GetMemory(rc);
    try
      Stream.ReadBuffer(Pointer(Buffer)^, rc);
    except
      FreeMemory(Buffer);
      raise;
    end;
    ESQLiteError.Test(sqlite3_bind_blob(FCursor.FHandle, Index, Pointer(Buffer),
      rc, FreeMemoryDestructor));
  end
  else
    SetParamBlob(index, 0);
end;

// -------------------------------------------------------------------------
// TSQLiteCursor
// -------------------------------------------------------------------------

constructor TSQLiteCursor.Create(Handle: Psqlite3_stmt);
begin
  FHandle := Handle;
  FHasData := false;
  FRowCount := 0;
end;

procedure TSQLiteCursor.Reset;
begin
  ESQLiteError.Test(sqlite3_reset(FHandle));
  FHasData := false;
  FRowCount := 0;
end;

procedure TSQLiteCursor.First;
begin
  Reset;
  Next;
end;

function TSQLiteCursor.Next: boolean;
var
  code: integer;
begin
  code := sqlite3_step(FHandle);
  ESQLiteError.Test(code);
  inc(FRowCount);
  Result := (code = SQLITE_ROW);
  FHasData := Result;
end;

function TSQLiteCursor.GetColumnCount: integer;
begin
  Result := sqlite3_data_count(FHandle);
end;

procedure TSQLiteCursor.TestColumnError(index: integer);
begin
  if (not HasData) then
    raise ESQLiteError.Create(EMPTY_CURSOR_MSG)
  else if (index < 0) or (index >= GetColumnCount) then
    raise ERangeError.Create(WRONG_INDEX_MSG);
end;

function TSQLiteCursor.GetColumnName(index: integer): string;
var
  pname: PWideChar;
begin
  TestColumnError(index);
  pname := sqlite3_column_name16(FHandle, index);
  if (pname = nil) then
    Result := ''
  else
    Result := string(pname);
end;

function TSQLiteCursor.GetColumnType(index: integer): TVarType;
var
  sqlitetype: integer;
begin
  TestColumnError(index);
  sqlitetype := sqlite3_column_type(FHandle, index);
  case sqlitetype of
    SQLITE_INTEGER:
      Result := varInteger;
    SQLITE_FLOAT:
      Result := varDouble;
    SQLITE_TEXT:
      Result := varString;
    SQLITE_BLOB:
      Result := varArray;
    SQLITE_NULL:
      Result := Null;
  else
    Result := varUnknown;
  end;
end;

function TSQLiteCursor.GetIsNull(index: integer): boolean;
begin
  Result := (GetColumnType(Index) = Null);
end;

function TSQLiteCursor.GetisBlob(index: integer): boolean;
begin
  Result := (GetColumnType(Index) = varArray);
end;

function TSQLiteCursor.GetAsInteger(index: integer): integer;
begin
  TestColumnError(index);
  Result := sqlite3_column_int(FHandle, index);
end;

function TSQLiteCursor.GetAsInt64(index: integer): int64;
begin
  TestColumnError(index);
  Result := sqlite3_column_int64(FHandle, index);
end;

function TSQLiteCursor.GetAsDouble(index: integer): double;
begin
  TestColumnError(index);
  Result := sqlite3_column_double(FHandle, index);
end;

function TSQLiteCursor.GetAsString(index: integer): string;
var
  pvalue: PWideChar;
begin
  TestColumnError(index);
  pvalue := sqlite3_column_text16(FHandle, index);
  if (pvalue <> nil) then
    Result := string(pvalue)
  else
    Result := '';
end;

function TSQLiteCursor.GetAsBlob(index: integer): Pointer;
begin
  TestColumnError(index);
  Result := sqlite3_column_blob(FHandle, index);
end;

function TSQLiteCursor.GetColumnSize(index: integer): integer;
begin
  TestColumnError(index);
  Result := sqlite3_column_bytes16(FHandle, index);
end;

procedure TSQLiteCursor.ColumnToStream(index: integer; Stream: TStream);
var
  Buffer: Pointer;
  size: integer;
begin
  if (Stream <> nil) then
  begin
    Buffer := GetAsBlob(index);
    size := GetColumnSize(index);
    Stream.Write(Buffer^, size);
  end;
end;

function TSQLiteCursor.GetSourceSchema(index: integer): string;
var
  pname: PWideChar;
begin
  TestColumnError(index);
  pname := sqlite3_column_database_name16(FHandle, index);
  if (pname <> nil) then
    Result := string(pname)
  else
    Result := '';
end;

function TSQLiteCursor.GetSourceTable(index: integer): string;
var
  pname: PWideChar;
begin
  TestColumnError(index);
  pname := sqlite3_column_table_name16(FHandle, index);
  if (pname <> nil) then
    Result := string(pname)
  else
    Result := '';
end;

function TSQLiteCursor.GetSourceColumn(index: integer): string;
var
  pname: PWideChar;
begin
  TestColumnError(index);
  pname := sqlite3_column_origin_name16(FHandle, index);
  if (pname <> nil) then
    Result := string(pname)
  else
    Result := '';
end;

// -------------------------------------------------------------------------
// TSQLiteBlobStream
// -------------------------------------------------------------------------

constructor TSQLiteBlobStream.Create(db: TSQLiteDatabase;
  const Schema, Table, Column: string; RowID: int64; readOnly: boolean = true);
var
  flags: integer;
begin
  if readOnly then
    flags := 1
  else
    flags := 0;

  ESQLiteError.Test(sqlite3_blob_open(db.FHandle, (Schema), (Table), (Column),
    RowID, flags, FHandle));
  if (FHandle = nil) then
    raise ESQLiteError.Create(OPEN_ERROR_MSG);
  FSize := sqlite3_blob_bytes(FHandle);
  FCurrentOffset := 0;
end;

constructor TSQLiteBlobStream.Create(db: TSQLiteDatabase;
  const Table, Column: string; RowID: int64; readOnly: boolean = true);
begin
  Create(db, 'main', Table, Column, RowID, readOnly);
end;

destructor TSQLiteBlobStream.Destroy;
begin
  if (FHandle <> nil) then
    ESQLiteError.Test(sqlite3_blob_close(FHandle));
end;

procedure TSQLiteBlobStream.SetSize(NewSize: Longint);
begin
  raise ESQLiteError.Create(NO_SIZE_CHANGE_MSG);
end;

function TSQLiteBlobStream.Read(var Buffer; Count: Longint): Longint;
begin
  if (FCurrentOffset + Count > FSize) then
    Count := FSize - FCurrentOffset;
  ESQLiteError.Test(sqlite3_blob_read(FHandle, Pointer(@Buffer), Count,
    FCurrentOffset));
  Result := Count;
end;

function TSQLiteBlobStream.Write(const Buffer; Count: Longint): Longint;
begin
  if (FCurrentOffset + Count > FSize) then
    Count := size - FCurrentOffset;
  ESQLiteError.Test(sqlite3_blob_write(FHandle, Pointer(@Buffer), Count,
    FCurrentOffset));
  Result := Count;
end;

function TSQLiteBlobStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
{$WARNINGS OFF}
  if (Origin = ord(soCurrent)) then
    Offset := Offset + FCurrentOffset
  else if (Origin = ord(soEnd)) then
    Offset := FSize + Offset;
{$WARNINGS ON}
  if (Offset >= 0) and (Offset <= FSize) then
    FCurrentOffset := Offset
  else
    raise ERangeError.Create(INVALID_OFFSET_MSG);
  Result := FCurrentOffset;
end;


// -------------------------------------------------------------------------
// TSQLiteEngine
// -------------------------------------------------------------------------

class function TSQLiteEngine.GetCompileOptionName(index: integer): string;
var
  pname: PUTF8Char;
begin
  pname := sqlite3_compileoption_get(index);
  if (pname <> nil) then
    Result := string(pname)
  else
    Result := '';
end;

class function TSQLiteEngine.GetCompileOptionByName(const Name: string)
  : boolean;
begin
  Result := (sqlite3_compileoption_used(name) > 0);
end;

class function TSQLiteEngine.IsValidSQL(const SQL: string): boolean;
begin
  Result := (sqlite3_complete16(SQL) > 0);
end;

end.
