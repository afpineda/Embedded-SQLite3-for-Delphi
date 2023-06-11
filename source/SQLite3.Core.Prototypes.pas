unit SQLite3.Core.Prototypes;

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

  Note:
  Function prototypes were hand written and prone to
  error.

  *******************************************************

  CHANGE LOG:

  - 2019-09-19: Moved from SQLite3Lib and updated to
  SQLITE version 3.25.1 (2018)

  - 2021-04-06: Updated to SQLITE version 3.35.
  - 2023-06-03: Updated to SQLITE version 3.42.

  *******************************************************

  TO DO:

  - Some prototypes not translated due to C-like open parameters
  - Most prototypes were not tested and may be wrong.

  ******************************************************* }

interface

uses
  SQLite3.Core.Objects;

type
  // NOTE: write all prototypes in alphabetical order
  // for easy maintenance

  Tsqlite3_aggregate_context = function(context: Psqlite3_context;
    nBytes: integer): pointer; cdecl;
  TSqlite3_auto_extension = function(xEntryPoint: TxEntryPoint): integer; cdecl;
  TSqlite3_autovacuum_pages = function(db: PSQLite3;
    callback: TAutovacuumCallback; data: pointer;
    destructorCallback: TSQLite3Destructor): integer;
  TSqlite3_backup_init = function(pDest: PSQLite3; const zDestName: UTF8String;
    pSource: PSQLite3; const zSourceName: UTF8String): PSqlite3_backup; cdecl;
  TSqlite3_backup_step = function(p: PSqlite3_backup; nPage: integer)
    : integer; cdecl;
  TSqlite3_backup_finish = function(p: PSqlite3_backup): integer; cdecl;
  TSqlite3_backup_remaining = function(p: PSqlite3_backup): integer; cdecl;
  TSqlite3_backup_pagecount = function(p: PSqlite3_backup): integer; cdecl;
  TSqlite3_bind_blob = function(pStmt: Psqlite3_stmt; index: integer;
    value: pointer; nBytes: integer; pDestructor: TSQLite3Destructor)
    : integer; cdecl;
  TSqlite3_bind_blob64 = function(pStmt: Psqlite3_stmt; index: integer;
    value: pointer; nBytes: uint64; pDestructor: TSQLite3Destructor)
    : integer; cdecl;
  TSqlite3_bind_double = function(pStmt: Psqlite3_stmt; index: integer;
    value: double): integer; cdecl;
  TSqlite3_bind_int = function(pStmt: Psqlite3_stmt; index: integer;
    value: integer): integer; cdecl;
  TSqlite3_bind_int64 = function(pStmt: Psqlite3_stmt; index: integer;
    value: uint64): integer; cdecl;
  TSqlite3_bind_null = function(pStmt: Psqlite3_stmt; index: integer)
    : integer; cdecl;
  TSqlite3_bind_text = function(pStmt: Psqlite3_stmt; index: integer;
    const value: UTF8String; nBytes: integer; pDestructor: TSQLite3Destructor)
    : integer; cdecl;
  TSqlite3_bind_text16 = function(pStmt: Psqlite3_stmt; index: integer;
    const value: UnicodeString; nBytes: integer;
    pDestructor: TSQLite3Destructor): integer; cdecl;
  TSqlite3_bind_text64 = function(pStmt: Psqlite3_stmt; index: integer;
    const value: UnicodeString; nBytes: uint64; pDestructor: TSQLite3Destructor)
    : integer; cdecl;
  TSqlite3_bind_value = function(pStmt: Psqlite3_stmt; index: integer;
    value: Psqlite3_value): integer; cdecl;
  TSqlite3_bind_pointer = function(pStmt: Psqlite3_stmt; index: integer;
    value: pointer; const valueType: UTF8String;
    pDestructor: TSQLite3Destructor): integer; cdecl;
  TSqlite3_bind_zeroblob = function(spStmt: Psqlite3_stmt; index: integer;
    nBytes: integer): integer; cdecl;
  TSqlite3_bind_zeroblob64 = function(spStmt: Psqlite3_stmt; index: integer;
    nBytes: uint64): integer; cdecl;
  TSqlite3_bind_parameter_count = function(pStmt: Psqlite3_stmt)
    : integer; cdecl;
  TSqlite3_bind_parameter_index = function(pStmt: Psqlite3_stmt;
    const zName: UTF8String): integer; cdecl;
  TSqlite3_bind_parameter_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  TSqlite3_blob_bytes = function(pBlob: Psqlite3_blob): integer; cdecl;
  TSqlite3_blob_close = function(pBlob: Psqlite3_blob): integer; cdecl;
  TSqlite3_blob_open = function(db: PSQLite3; const zDb: UTF8String;
    const zTable: UTF8String; const zColumn: UTF8String; iRow: int64;
    flags: integer; out ppBlob: Psqlite3_blob): integer; cdecl;
  TSqlite3_blob_read = function(pBlob: Psqlite3_blob; buffer: pointer;
    nBytes: integer; iOffset: integer): integer; cdecl;
  TSqlite3_blob_reopen = function(pBlob: Psqlite3_blob; iRow: int64)
    : integer; cdecl;
  TSqlite3_blob_write = function(pBlob: Psqlite3_blob; buffer: pointer;
    nBytes: integer; iOffset: integer): integer; cdecl;
  TSqlite3_busy_handler = function(db: PSQLite3; callback: TBusyHandlerCallback;
    p: pointer): integer; cdecl;
  TSqlite3_busy_timeout = function(db: PSQLite3; ms: integer): integer; cdecl;
  TSqlite3_cancel_auto_extension = function(xEntryPoint: TxEntryPoint)
    : integer; cdecl;
  TSqlite3_changes = function(db: PSQLite3): integer; cdecl;
  TSqlite3_changes64 = function(db: PSQLite3): int64; cdecl;
  TSqlite3_clear_bindings = function(stmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_close = function(db: PSQLite3): integer; cdecl;
  TSqlite3_close_v2 = function(db: PSQLite3): integer; cdecl;
  TSqlite3_collation_needed = function(db: PSQLite3; p: pointer;
    callback: TCollationNeededCallback): integer; cdecl;
  TSqlite3_collation_needed16 = function(db: PSQLite3; p: pointer;
    callback: TCollationNeeded16Callback): integer; cdecl;
  TSqlite3_column_blob = function(stmt: Psqlite3_stmt; iCol: integer)
    : pointer; cdecl;
  TSqlite3_column_double = function(stmt: Psqlite3_stmt; iCol: integer)
    : double; cdecl;
  TSqlite3_column_int = function(stmt: Psqlite3_stmt; iCol: integer)
    : integer; cdecl;
  TSqlite3_column_int64 = function(stmt: Psqlite3_stmt; iCol: integer)
    : int64; cdecl;
  TSqlite3_column_text = function(stmt: Psqlite3_stmt; iCol: integer)
    : PUTF8Char; cdecl;
  TSqlite3_column_text16 = function(stmt: Psqlite3_stmt; iCol: integer)
    : PWideChar; cdecl;
  TSqlite3_column_value = function(stmt: Psqlite3_stmt; iCol: integer)
    : Psqlite3_value; cdecl;
  TSqlite3_column_bytes = function(stmt: Psqlite3_stmt; iCol: integer)
    : integer; cdecl;
  TSqlite3_column_bytes16 = function(stmt: Psqlite3_stmt; iCol: integer)
    : integer; cdecl;
  TSqlite3_column_type = function(stmt: Psqlite3_stmt; iCol: integer)
    : integer; cdecl;
  TSqlite3_column_count = function(pStmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_column_database_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  TSqlite3_column_database_name16 = function(pStmt: Psqlite3_stmt;
    index: integer): PWideChar; cdecl;
  TSqlite3_column_table_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  TSqlite3_column_table_name16 = function(pStmt: Psqlite3_stmt; index: integer)
    : PWideChar; cdecl;
  TSqlite3_column_origin_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  TSqlite3_column_origin_name16 = function(pStmt: Psqlite3_stmt; index: integer)
    : PWideChar;
  TSqlite3_column_decltype = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  TSqlite3_column_decltype16 = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  TSqlite3_column_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  TSqlite3_column_name16 = function(pStmt: Psqlite3_stmt; index: integer)
    : PWideChar; cdecl;
  TSqlite3_commit_hook = function(db: PSQLite3; callback: TCommitHookCallback)
    : pointer; cdecl;
  TSqlite3_rollback_hook = function(db: PSQLite3;
    callback: TRollbackHookCallback): pointer; cdecl;
  TSqlite3_compileoption_get = function(N: integer): PUTF8Char; cdecl;
  TSqlite3_compileoption_used = function(const zOptName: UTF8String)
    : integer; cdecl;
  TSqlite3_complete = function(const sql: UTF8String): integer; cdecl;
  TSqlite3_complete16 = function(const sql: UnicodeString): integer; cdecl;
  TSqlite3_context_db_handle = function(ctx: Psqlite3_context): PSQLite3; cdecl;
  TSqlite3_create_collation = function(db: PSQLite3; const name: UTF8String;
    eTextRep: integer; pArg: pointer; xCallback: TCollationFunctionCallback)
    : integer; cdecl;
  TSqlite3_create_collation_v2 = function(db: PSQLite3; const name: UTF8String;
    eTextRep: integer; pArg: pointer; xCallback: TCollationFunctionCallback;
    xDestroy: TCollationDestroyCallback): integer; cdecl;
  TSqlite3_create_collation16 = function(db: PSQLite3;
    const name: UnicodeString; eTextRep: integer; pArg: pointer;
    xCallback: TCollationFunctionCallback): integer; cdecl;
  TSqlite3_create_function = function(db: PSQLite3;
    const FunctionName: UTF8String; nArg, eTextRep: integer; pApp: pointer;
    xFunc, xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal)
    : integer; cdecl;
  TSqlite3_create_function16 = function(db: PSQLite3;
    FunctionName: UnicodeString; nArg, eTextRep: integer; pApp: pointer;
    xFunc, xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal)
    : integer; cdecl;
  TSqlite3_create_function_v2 = function(db: PSQLite3;
    const FunctionName: UTF8String; nArg, eTextRep: integer; pApp: pointer;
    xFunc, xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
    xDestroy: TSQLite3Destructor): integer; cdecl;
  TSqlite3_create_window_function = function(db: PSQLite3;
    const FunctionName: UTF8String; nArg, eTextRep: integer; pApp: pointer;
    xStep: TSQLiteFunctionDef; xFinal, xValue: TSQLiteFunctionFinal;
    xInverse: TSQLiteFunctionDef; xDestroy: TSQLite3Destructor): integer; cdecl;
  TSqlite3_create_module = function(db: PSQLite3; const zName: UTF8String;
    const p: Psqlite3_module; pClientData: pointer): integer; cdecl;
  TSqlite3_create_module_v2 = function(db: PSQLite3; const zName: UTF8String;
    const p: Psqlite3_module; pClientData: pointer;
    xDestroy: TSQLite3Destructor): integer; cdecl;
  TSqlite3_data_count = function(pStmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_database_file_object = function(const arg: UTF8String)
    : Psqlite3_file;
  TSqlite3_db_cacheflush = function(db: PSQLite3): integer; cdecl;
  TSqlite3_db_filename = function(db: PSQLite3; const zDbName: UTF8String)
    : PUTF8Char; cdecl;
  TSqlite3_db_handle = function(stmt: Psqlite3_stmt): PSQLite3; cdecl;
  TSqlite3_db_mutex = function(db: PSQLite3): PSqlite3_mutex; cdecl;
  TSqlite3_db_name = function(db: PSQLite3): UTF8String; cdecl;
  TSqlite3_db_readonly = function(db: PSQLite3; const zDbName: UTF8String)
    : integer; cdecl;
  TSqlite3_db_release_memory = function(db: PSQLite3): integer; cdecl;
  TSqlite3_db_status = function(db: PSQLite3; op: integer; out pCur: integer;
    out pHiwtr: integer; resetFlg: integer): integer; cdecl;
  TSqlite3_declare_vtab = function(db: PSQLite3; const zSQL: UTF8String)
    : integer; cdecl;
  TSqlite3_deserialize = function(db: PSQLite3; const zSchema: UTF8String;
    pData: PUTF8Char; szDb, szBuf: int64; mFlags: cardinal): integer; cdecl;
  TSqlite3_drop_modules = function(db: PSQLite3; const azKeep: PUTF8CharArray)
    : integer; cdecl;
  TSqlite3_enable_load_extension = function(db: PSQLite3; onoff: integer)
    : integer; cdecl;
  TSqlite3_enable_shared_cache = function(onoff: integer): integer; cdecl;
  TSqlite3_errcode = function(db: PSQLite3): integer; cdecl;
  TSqlite3_extended_errcode = function(db: PSQLite3): integer; cdecl;
  TSqlite3_errmsg = function(db: PSQLite3): PUTF8Char; cdecl;
  TSqlite3_errmsg16 = function(db: PSQLite3): PWideChar; cdecl;
  TSqlite3_error_offset = function(db: PSQLite3): integer; cdecl;
  TSqlite3_errstr = function(errcode: integer): PUTF8Char; cdecl;
  TSqlite3_exec = function(db: PSQLite3; const sql: UTF8String;
    callback: TSQLiteExecCallback; UserData: pointer; var errmsg: PUTF8Char)
    : integer; cdecl;
  TSqlite3_sql = function(pStmt: Psqlite3_stmt): PUTF8Char; cdecl;
  TSqlite3_expanded_sql = function(pStmt: Psqlite3_stmt): PUTF8Char; cdecl;
  TSqlite3_extended_result_codes = function(db: PSQLite3; onoff: integer)
    : integer; cdecl;
  TSqlite3_file_control = function(db: PSQLite3; const zDbName: UTF8String;
    op: integer; UserData: pointer): integer; cdecl;
  TSqlite3_create_filename = function(const zDatabase, zJournal,
    zWal: UTF8String; nParam: integer; var azParam: UTF8String): UTF8String;
  TSqlite3_filename_database = function(const fn: UTF8String): PUTF8Char;
  TSqlite3_filename_journal = function(const fn: UTF8String): PUTF8Char;
  TSqlite3_filename_wal = function(const fn: UTF8String): PUTF8Char;
  TSqlite3_free_filename = procedure(const fn: UTF8String);
  TSqlite3_finalize = function(pStmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_malloc = function(bytes: integer): pointer; cdecl;
  TSqlite3_malloc64 = function(bytes: uint64): pointer; cdecl;
  TSqlite3_realloc = function(data: pointer; bytes: integer): pointer; cdecl;
  TSqlite3_realloc64 = function(data: pointer; bytes: uint64): pointer; cdecl;
  TSqlite3_free = procedure(data: pointer); cdecl;
  TSqlite3_msize = function(data: pointer): uint64; cdecl;
  TSqlite3_mutex_held = function(mutex: PSqlite3_mutex): integer; cdecl;
  TSqlite3_mutex_notheld = function(mutex: PSqlite3_mutex): integer; cdecl;
  TSqlite3_get_table = function(db: PSQLite3; const zSQL: UTF8String;
    var pazResult: PUTF8CharArray; var pnRow, pnColumn: integer;
    var pzErrmsg: UTF8String): integer; cdecl;
  TSqlite3_free_table = procedure(var pazResult: PUTF8CharArray); cdecl;
  TSqlite3_get_autocommit = function(db: PSQLite3): integer; cdecl;
  TSqlite3_get_auxdata = function(ctx: Psqlite3_context; N: integer)
    : pointer; cdecl;
  TSqlite3_set_auxdata = procedure(ctx: Psqlite3_context; N: integer;
    metadata: pointer; xDestructor: TSQLite3Destructor); cdecl;
  TSqlite3_soft_heap_limit64 = function(N: TSqlite3_int64): TSqlite3_int64;
  TSqlite3_hard_heap_limit64 = function(N: TSqlite3_int64): TSqlite3_int64;
  TSqlite3_initialize = function: integer; cdecl;
  TSqlite3_shutdown = function: integer; cdecl;
  TSqlite3_os_init = function: integer; cdecl;
  TSqlite3_os_end = function: integer; cdecl;
  TSqlite3_interrupt = procedure(db: PSQLite3); cdecl;
  TSqlite3_is_interrupted = function(db: PSQLite3): integer; cdecl;
  TSqlite3_keyword_count = function: integer; cdecl;
  TSqlite3_keyword_name = function(N: integer; out name: UTF8String;
    out strlen: integer): integer; cdecl;
  TSqlite3_keyword_check = function(const str: UTF8String; strlen: integer)
    : integer; cdecl;
  TSqlite3_last_insert_rowid = function(db: PSQLite3): int64; cdecl;
  TSqlite3_libversion = function: PUTF8Char; cdecl;
  TSqlite3_sourceid = function: PUTF8Char; cdecl;
  TSqlite3_libversion_number = function: integer; cdecl;
  TSqlite3_limit = function(db: PSQLite3; id, newval: integer): integer; cdecl;
  TSqlite3_load_extension = function(db: PSQLite3;
    const zFile, zProc: UTF8String; out errmsg: UTF8String): integer; cdecl;
  TSqlite3_memory_used = function: int64; cdecl;
  TSqlite3_memory_highwater = function(resetFlag: integer): int64; cdecl;
  TSqlite3_mutex_alloc = function(mutexType: integer): PSqlite3_mutex; cdecl;
  TSqlite3_mutex_free = procedure(mutex: PSqlite3_mutex); cdecl;
  TSqlite3_mutex_enter = procedure(mutex: PSqlite3_mutex); cdecl;
  TSqlite3_mutex_try = function(mutex: PSqlite3_mutex): integer; cdecl;
  TSqlite3_mutex_leave = procedure(mutex: PSqlite3_mutex); cdecl;
  TSqlite3_next_stmt = function(db: PSQLite3; pStmt: Psqlite3_stmt)
    : Psqlite3_stmt; cdecl;
  TSqlite3_open = function(const filename: UTF8String; SQLite3: PSQLite3)
    : integer; cdecl;
  TSqlite3_open16 = function(const filename: UnicodeString;
    out SQLite3: PSQLite3): integer; cdecl;
  TSqlite3_open_v2 = function(const filename: UTF8String; out SQLite3: PSQLite3;
    flags: integer; const zVfs: PAnsiString): integer; cdecl;
  TSqlite3_overload_function = function(db: PSQLite3;
    const zFuncName: UTF8String; nArg: integer): integer; cdecl;
  TSqlite3_prepare = function(db: PSQLite3; const zSQL: UTF8String;
    nByte: integer; out ppStmt: Psqlite3_stmt; out pzTail: PUTF8Char)
    : integer; cdecl;
  TSqlite3_prepare_v2 = function(db: PSQLite3; const zSQL: UTF8String;
    nByte: integer; out ppStmt: Psqlite3_stmt; out pzTail: PUTF8Char)
    : integer; cdecl;
  TSqlite3_prepare_v3 = function(db: PSQLite3; const zSQL: UTF8String;
    nByte: integer; prepFlags: cardinal; out ppStmt: Psqlite3_stmt;
    out pzTail: PUTF8Char): integer; cdecl;
  TSqlite3_prepare16 = function(db: PSQLite3; const zSQL: UnicodeString;
    nByte: integer; out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString)
    : integer; cdecl;
  TSqlite3_prepare16_v2 = function(db: PSQLite3; const zSQL: UnicodeString;
    nByte: integer; out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString)
    : integer; cdecl;
  TSqlite3_prepare16_v3 = function(db: PSQLite3; const zSQL: UnicodeString;
    nByte: integer; prepFlags: cardinal; out ppStmt: Psqlite3_stmt;
    out pzTail: PUTF8Char): integer; cdecl;
  TSqlite3_preupdate_hook = function(db: PSQLite3;
    xPreUpdate: TPreupdateHookCallback; pCtx: pointer): pointer; cdecl;
  TSqlite3_preupdate_old = function(db: PSQLite3; col: integer;
    out value: Psqlite3_value): integer; cdecl;
  TSqlite3_preupdate_count = function(db: PSQLite3): integer; cdecl;
  TSqlite3_preupdate_depth = function(db: PSQLite3): integer; cdecl;
  TSqlite3_preupdate_new = function(db: PSQLite3; col: integer;
    out value: Psqlite3_value): integer; cdecl;
  TSqlite3_preupdate_blobwrite = function(db: PSQLite3): integer; cdecl;
  TSqlite3_trace = function(db: PSQLite3; xTrace: TTraceCallback;
    UserData: pointer): pointer; cdecl;
  TSqlite3_profile = function(db: PSQLite3; xProfile: TProfileCallback;
    UserData: pointer): pointer; cdecl;
  TSqlite3_progress_handler = procedure(db: PSQLite3;
    handler: TProgressCallback; UserData: pointer); cdecl;
  TSqlite3_randomness = procedure(length: integer; buffer: pointer); cdecl;
  TSqlite3_release_memory = function(bytes: integer): integer; cdecl;
  TSqlite3_reset = function(pStmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_reset_auto_extension = procedure; cdecl;
  TSqlite3_result_blob = procedure(ctx: Psqlite3_context; blobData: pointer;
    bytesLength: integer; xDestructor: TSQLite3Destructor); cdecl;
  TSqlite3_result_blob64 = procedure(ctx: Psqlite3_context; blobData: pointer;
    bytesLength: uint64; xDestructor: TSQLite3Destructor); cdecl;
  TSqlite3_result_double = procedure(ctx: Psqlite3_context;
    data: double); cdecl;
  TSqlite3_result_error = procedure(ctx: Psqlite3_context;
    const msg: UTF8String; msgLength: integer); cdecl;
  TSqlite3_result_error16 = procedure(ctx: Psqlite3_context;
    const msg: UnicodeString; msgLength: integer); cdecl;
  TSqlite3_result_error_toobig = procedure(ctx: PSQLite3); cdecl;
  TSqlite3_result_error_nomem = procedure(ctx: PSQLite3); cdecl;
  TSqlite3_result_error_code = procedure(ctx: PSQLite3;
    errcode: integer); cdecl;
  TSqlite3_result_int = procedure(ctx: PSQLite3; data: integer); cdecl;
  TSqlite3_result_int64 = procedure(ctx: PSQLite3; data: int64); cdecl;
  TSqlite3_result_null = procedure(ctx: PSQLite3); cdecl;
  TSqlite3_result_text = procedure(ctx: Psqlite3_context;
    const data: UTF8String; msgLength: integer;
    xDestructor: TSQLite3Destructor); cdecl;
  TSqlite3_result_text64 = procedure(ctx: Psqlite3_context; text: PUTF8Char;
    txtLength: uint64; xDestructor: TSQLite3Destructor; encoding: char); cdecl;
  TSqlite3_result_text16 = procedure(ctx: Psqlite3_context;
    const text: UnicodeString; txtLength: integer;
    xDestructor: TSQLite3Destructor); cdecl;
  TSqlite3_result_text16le = procedure(ctx: Psqlite3_context;
    const text: UnicodeString; txtLength: integer;
    xDestructor: TSQLite3Destructor); cdecl;
  TSqlite3_result_text16be = procedure(ctx: Psqlite3_context;
    const text: UnicodeString; txtLength: integer;
    xDestructor: TSQLite3Destructor); cdecl;
  TSqlite3_result_value = procedure(ctx: Psqlite3_context;
    value: Psqlite3_value); cdecl;
  TSqlite3_result_pointer = procedure(ctx: Psqlite3_context; data: pointer;
    const datatype: UTF8String; xDestructor: TSQLite3Destructor); cdecl;
  TSqlite3_result_zeroblob = procedure(ctx: Psqlite3_context;
    length: integer); cdecl;
  TSqlite3_result_zeroblob64 = procedure(ctx: Psqlite3_context;
    length: uint64); cdecl;
  TSqlite3_result_subtype = procedure(ctx: Psqlite3_context;
    subtype: cardinal); cdecl;
  TSqlite3_serialize = function(db: PSQLite3; const zSchema: UTF8String;
    out size: int64; flags: cardinal): PUTF8Char; cdecl;
  TSqlite3_set_authorizer = function(db: PSQLite3;
    xAuth: TAuthorizationCallback; UserData: pointer): integer; cdecl;
  TSqlite3_set_last_insert_rowid = procedure(db: PSQLite3; rowid: int64); cdecl;
  TSqlite3_sleep = function(ms: integer): integer; cdecl;
  TSqlite3_snapshot_cmp = function(p1, p2: Psqlite3_snapshot): integer; cdecl;
  TSqlite3_snapshot_free = procedure(snapshot: Psqlite3_snapshot); cdecl;
  TSqlite3_snapshot_get = function(db: PSQLite3; const zSchema: UTF8String;
    out snapshot: Psqlite3_snapshot): integer; cdecl;
  TSqlite3_snapshot_open = function(db: PSQLite3; const zSchema: UTF8String;
    snapshot: Psqlite3_snapshot): integer; cdecl;
  TSqlite3_snapshot_recover = function(db: PSQLite3; const zDb: UTF8String)
    : integer; cdecl;
  TSqlite3_status = function(op: integer; out pCurrent: integer;
    resetFlag: integer): integer; cdecl;
  TSqlite3_status64 = function(op: integer; out pCurrent, pHighwater: int64;
    resetFlag: integer): integer; cdecl;
  TSqlite3_step = function(stmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_stmt_busy = function(stmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_stmt_isexplain = function(stmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_stmt_readonly = function(stmt: Psqlite3_stmt): integer; cdecl;
  TSqlite3_stmt_scanstatus = function(stmt: Psqlite3_stmt;
    idx, iScanStatusOp: integer; pOut: pointer): integer; cdecl;
  TSqlite3_stmt_scanstatus_v2 = function(stmt: Psqlite3_stmt;
    idx, iScanStatusOp, flags: integer; pOut: pointer): integer; cdecl;
  TSqlite3_stmt_scanstatus_reset = procedure(stmt: Psqlite3_stmt); cdecl;
  TSqlite3_stmt_status = function(stmt: Psqlite3_stmt; op: integer;
    resetFlag: integer): integer; cdecl;
  Tsqlite3_str_append = procedure(str: Psqlite3_str; zIn: UTF8String;
    N: integer); cdecl;
  Tsqlite3_str_appendall = procedure(str: Psqlite3_str; zIn: UTF8String); cdecl;
  Tsqlite3_str_appendchar = procedure(str: Psqlite3_str; N: integer;
    C: UTF8Char); cdecl;
  Tsqlite3_str_errcode = function(str: Psqlite3_str): integer; cdecl;
  Tsqlite3_str_finish = function(str: Psqlite3_str): PUTF8Char; cdecl;
  Tsqlite3_str_length = function(str: Psqlite3_str): integer; cdecl;
  Tsqlite3_str_new = function(db: PSQLite3): Psqlite3_str; cdecl;
  Tsqlite3_str_reset = procedure(db: PSQLite3); cdecl;
  Tsqlite3_str_value = function(str: Psqlite3_str): PUTF8Char; cdecl;
  TSqlite3_strglob = function(const zGlob, zStr: UTF8String): integer; cdecl;
  TSqlite3_stricmp = function(const str1, str2: UTF8String): integer; cdecl;
  TSqlite3_strnicmp = function(const str1, str2: UTF8String; length: integer)
    : integer; cdecl;
  TSqlite3_strlike = function(const zGlob, zStr: UTF8String; cEsc: cardinal)
    : integer; cdecl;
  TSqlite3_system_errno = function(db: PSQLite3): integer; cdecl;
  TSqlite3_table_column_metadata = function(db: PSQLite3;
    const zDbName: UTF8String; const zTableName: UTF8String;
    const zColumnName: UTF8String; out pzDataType: PUTF8Char;
    out pzCollSeq: PUTF8Char; out pNotNull: integer; out pPrimaryKey: integer;
    out pAutoinc: integer): integer; cdecl;
  TSqlite3_threadsafe = function: integer; cdecl;
  TSqlite3_total_changes = function(db: PSQLite3): integer; cdecl;
  TSqlite3_total_changes64 = function(db: PSQLite3): TSqlite3_int64; cdecl;
  TSqlite3_trace_v2 = function(db: PSQLite3; uMask: cardinal;
    xCallback: TTraceV2Callback; pCtx: pointer): integer; cdecl;
  TSqlite3_unlock_notify = function(pBlocked: PSQLite3;
    xNotify: TNotifyCallback; pNotifyArg: pointer): integer; cdecl;
  TSqlite3_update_hook = function(db: PSQLite3; updateCallback: TUpdateCallback;
    UserData: pointer): pointer; cdecl;
  TSqlite3_uri_parameter = function(const zFilename, zParam: UTF8String)
    : PUTF8Char; cdecl;
  TSqlite3_uri_boolean = function(const zFilename, zParam: UTF8String;
    bDefault: integer): integer; cdecl;
  TSqlite3_uri_int64 = function(const zFilename, zParam: UTF8String;
    bDefault: int64): int64; cdecl;
  TSqlite3_uri_key = function(const zFilename: UTF8String; N: integer)
    : PUTF8Char; cdecl;
  TSqlite3_user_data = function(ctx: Psqlite3_context): pointer; cdecl;
  TSqlite3_value_blob = function(value: Psqlite3_value): pointer; cdecl;
  TSqlite3_value_double = function(value: Psqlite3_value): double; cdecl;
  TSqlite3_value_int = function(value: Psqlite3_value): integer; cdecl;
  TSqlite3_value_int64 = function(value: Psqlite3_value): int64; cdecl;
  TSqlite3_value_pointer = function(value: Psqlite3_value;
    const name: UTF8String): pointer; cdecl;
  TSqlite3_value_text = function(value: Psqlite3_value): PUTF8Char; cdecl;
  TSqlite3_value_text16 = function(value: Psqlite3_value): PWideChar; cdecl;
  TSqlite3_value_text16le = function(value: Psqlite3_value): PWideChar; cdecl;
  TSqlite3_value_text16be = function(value: Psqlite3_value): PWideChar; cdecl;
  TSqlite3_value_bytes = function(value: Psqlite3_value): integer; cdecl;
  TSqlite3_value_bytes16 = function(value: Psqlite3_value): integer; cdecl;
  TSqlite3_value_type = function(value: Psqlite3_value): integer; cdecl;
  TSqlite3_value_numeric_type = function(value: Psqlite3_value): integer; cdecl;
  TSqlite3_value_nochange = function(value: Psqlite3_value): integer; cdecl;
  TSqlite3_value_frombind = function(value: Psqlite3_value): integer; cdecl;
  TSqlite3_value_dup = function(const value: Psqlite3_value)
    : Psqlite3_value; cdecl;
  TSqlite3_value_free = procedure(value: Psqlite3_value); cdecl;
  TSqlite3_value_encoding = function(db: PSQLite3): integer; cdecl;
  TSqlite3_value_subtype = function(value: Psqlite3_value): integer; cdecl;
  TSqlite3_vfs_find = function(const zVfsName: UTF8String): Psqlite3_vfs; cdecl;
  TSqlite3_vfs_register = function(const zVfsName: UTF8String;
    makeDflt: integer): integer; cdecl;
  TSqlite3_vfs_unregister = function(const zVfsName: UTF8String)
    : integer; cdecl;
  TSqlite3_vtab_collation = function(info: Psqlite3_index_info; index: integer)
    : PUTF8Char; cdecl;
  TSqlite3_vtab_distinct = function(info: Psqlite3_index_info): integer; cdecl;
  Tsqlite3_vtab_in = function(info: Psqlite3_index_info; iCons: integer;
    bHandle: integer): integer; cdecl;
  Tsqlite3_vtab_in_first = function(pVal: Psqlite3_value;
    var ppOut: Psqlite3_value): integer; cdecl;
  Tsqlite3_vtab_in_next = function(pVal: Psqlite3_value;
    var ppOut: Psqlite3_value): integer; cdecl;
  TSqlite3_vtab_nochange = function(ctx: Psqlite3_context): integer; cdecl;
  TSqlite3_vtab_on_conflict = function(db: PSQLite3): integer; cdecl;
  Tsqlite3_vtab_rhs_value = function(info: Psqlite3_index_info; j: integer;
    var ppVal: Psqlite3_value): integer; cdecl;
  TSqlite3_wal_autocheckpoint = function(db: PSQLite3; N: integer)
    : integer; cdecl;
  TSqlite3_wal_checkpoint = function(db: PSQLite3; const zDb: UTF8String)
    : integer; cdecl;
  TSqlite3_wal_checkpoint_v2 = function(db: PSQLite3; const zDb: UTF8String;
    eMode: integer; out pnLog, pnCkpt: integer): integer; cdecl;
  TSqlite3_wal_hook = function(db: PSQLite3; callback: TWALCallback;
    UserData: pointer): pointer; cdecl;
  TSqlite3_win32_set_directory = function(dirType: LongInt; zValue: pointer)
    : integer; cdecl;
  TSqlite3_win32_set_directory8 = function(dirType: LongInt;
    const zValue: UTF8String): integer; cdecl;
  TSqlite3_win32_set_directory16 = function(dirType: LongInt;
    const zValue: UnicodeString): integer; cdecl;
  TSqlite3_txn_state = function(db: PSQLite3; const zSchema: UTF8String)
    : integer; cdecl;

implementation

end.
