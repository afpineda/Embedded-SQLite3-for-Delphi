unit SQLite3.Core.Objects;
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

  CHANGE LOG:

  - 2019-09-19: Moved from SQLite3Lib and updated to
  SQLITE version 3.25.1 (2018)

  - 2021-04-06: Updated to SQLITE version 3.35.

  ******************************************************* }

interface

type
  // Core SQLite objects
  PSQLite3 = type Pointer;
  Psqlite3_api_routines = type Pointer;
  PSQLite3_backup = type Pointer;
  Psqlite3_blob = type Pointer;
  Psqlite3_context = type Pointer;
  Psqlite3_data_directory = type Pointer;
  Psqlite3_file = type Pointer;
  Psqlite3_io_methods = type Pointer;
  Psqlite3_io_mem_methods = type Pointer;
  Psqlite3_index_info = type Pointer;
  Psqlite3_int64 = type Pointer;
  Psqlite3_uint64 = type Pointer;
  Psqlite_int64 = type Pointer;
  Psqlite_uint64 = type Pointer;
  Psqlite3_mem_methods = type Pointer;
  Psqlite3_module = type Pointer;
  Psqlite3_mutex = type Pointer;
  Psqlite3_mutex_methods = type Pointer;
  Psqlite3_pcache = type Pointer;
  Psqlite3_pcache_methods2 = type Pointer;
  Psqlite3_pcache_page = type Pointer;
  Psqlite3_stmt = type Pointer;
  Psqlite3_str = type Pointer;
  Psqlite3_snapshot = type Pointer;
  Psqlite3_temp_directory = type Pointer;
  Psqlite3_value = type Pointer;
  Psqlite3_vfs = type Pointer;
  Psqlite3_vtab = type Pointer;
  Psqlite3_vtab_cursor = type Pointer;

type
  // Auxiliary types and callbacks
  PUTF8Char = PAnsiChar;
  PUTF8CharArray = array of PUTF8Char;
  TSQLite3Destructor = procedure(Data: Pointer); cdecl;
  TSQLiteExecCallback = function(UserData: Pointer; NumCols: integer;
    ColValues: PUTF8CharArray; ColNames: PUTF8CharArray): integer; cdecl;
  TSQLiteFunctionDef = procedure(context: Psqlite3_context; i: integer;
    var value: Psqlite3_value); cdecl;
  TSQLiteFunctionFinal = procedure(context: Psqlite3_context); cdecl;
  TxEntryPoint = function(db: PSQLite3; pzErrMsg: PUTF8String;
    pThunk: Psqlite3_api_routines): integer; cdecl;
  TBusyHandlerCallback = function(p: Pointer; nTimesCalled: integer)
    : integer; cdecl;
  TCollationNeededCallback = procedure(p: Pointer; db: PSQLite3;
    eTextRep: integer; names: UTF8String); cdecl;
  TCollationNeeded16Callback = procedure(p: Pointer; db: PSQLite3;
    eTextRep: integer; names: UnicodeString); cdecl;
  TCommitHookCallback = function(p: Pointer): integer; cdecl;
  TRollbackHookCallback = procedure(p: Pointer); cdecl;
  TCollationFunctionCallback = function(pArg: Pointer; int1: integer;
    data1: Pointer; int2: integer; data2: Pointer): integer; cdecl;
  TCollationDestroyCallback = procedure(pArg: Pointer); cdecl;
  TPreupdateHookCallback = procedure(pCtx: Pointer; db: PSQLite3; op: integer;
    const zDB, zName: UTF8String; iKey1, iKey2: int64); cdecl;
  TTraceCallback = procedure(UserData: Pointer; const sql: UTF8String); cdecl;
  TTraceV2Callback = procedure(trace: cardinal; C, p, X: Pointer); cdecl;
  TProfileCallback = procedure(UserData: Pointer; const sql: UTF8String;
    elapsedTime: int64); cdecl;
  TProgressCallback = function(UserData: Pointer): integer; cdecl;
  TAuthorizationCallback = function(UserData: Pointer; ActionCode: integer;
    const det1, det2, det3, det4: UTF8String): integer; cdecl;
  TNotifyCallback = procedure(var apArg: Pointer; nArg: integer); cdecl;
  TUpdateCallback = procedure(UserData: Pointer; op: integer;
    const database, table: UTF8String; rowid: int64); cdecl;
  TWALCallback = function(UserData: Pointer; db: PSQLite3;
    const dbName: UTF8String; pageCount: integer): integer; cdecl;

implementation

end.
