unit SQLite3.Core.Functions;
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

  This wrapper should include sqlite3.dll as a Windows
  Resource. If sqlite3.dll is not found, it will
  be extracted to a temporary folder, then loaded.
  So there is no need to distribute that DLL along
  with an aplication.  As a result, it may be used
  as a statically linked library.

  *******************************************************

  CHANGE LOG:

  - 2012-03-22: First implementation
  - 2019-09-19: Updated to SQLITE version 3.25.1
  - 2021-05-10: Fixed minor bug at "ENotImplemented"
  exception raising
  - 2023-06-11: Updated to SQLITE version 3.42.0

  ******************************************************* }

interface

uses SQLite3.Core.Objects;

function isAvailable: boolean;

// machine-generated code for interface section

function sqlite3_aggregate_context(context: Psqlite3_context;
  nBytes: Integer): Pointer;
function Sqlite3_auto_extension(xEntryPoint: TxEntryPoint): Integer;
function Sqlite3_autovacuum_pages(db: Psqlite3; callback: TAutovacuumCallback;
  data: Pointer; destructorCallback: TSQLite3Destructor): Integer;
function Sqlite3_backup_finish(p: Psqlite3_backup): Integer;
function Sqlite3_backup_init(pDest: Psqlite3; const zDestName: string;
  pSource: Psqlite3; const zSourceName: string): Psqlite3_backup;
function Sqlite3_backup_pagecount(p: Psqlite3_backup): Integer;
function Sqlite3_backup_remaining(p: Psqlite3_backup): Integer;
function Sqlite3_backup_step(p: Psqlite3_backup; nPage: Integer): Integer;
function Sqlite3_bind_blob(pStmt: Psqlite3_stmt; index: Integer; value: Pointer;
  nBytes: Integer; pDestructor: TSQLite3Destructor): Integer;
function Sqlite3_bind_blob64(pStmt: Psqlite3_stmt; index: Integer;
  value: Pointer; nBytes: UInt64; pDestructor: TSQLite3Destructor): Integer;
function Sqlite3_bind_double(pStmt: Psqlite3_stmt; index: Integer;
  value: Double): Integer;
function Sqlite3_bind_int(pStmt: Psqlite3_stmt; index: Integer;
  value: Integer): Integer;
function Sqlite3_bind_int64(pStmt: Psqlite3_stmt; index: Integer;
  value: UInt64): Integer;
function Sqlite3_bind_null(pStmt: Psqlite3_stmt; index: Integer): Integer;
function Sqlite3_bind_parameter_count(pStmt: Psqlite3_stmt): Integer;
function Sqlite3_bind_parameter_index(pStmt: Psqlite3_stmt;
  const zName: string): Integer;
function Sqlite3_bind_parameter_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function Sqlite3_bind_pointer(pStmt: Psqlite3_stmt; index: Integer;
  value: Pointer; const valueType: string;
  pDestructor: TSQLite3Destructor): Integer;
function Sqlite3_bind_text(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: Integer;
  pDestructor: TSQLite3Destructor): Integer;
function Sqlite3_bind_text16(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: Integer;
  pDestructor: TSQLite3Destructor): Integer;
function Sqlite3_bind_text64(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: UInt64; pDestructor: TSQLite3Destructor)
  : Integer;
function Sqlite3_bind_value(pStmt: Psqlite3_stmt; index: Integer;
  value: Psqlite3_value): Integer;
function Sqlite3_bind_zeroblob(spStmt: Psqlite3_stmt; index: Integer;
  nBytes: Integer): Integer;
function Sqlite3_bind_zeroblob64(spStmt: Psqlite3_stmt; index: Integer;
  nBytes: UInt64): Integer;
function Sqlite3_blob_bytes(pBlob: Psqlite3_blob): Integer;
function Sqlite3_blob_close(pBlob: Psqlite3_blob): Integer;
function Sqlite3_blob_open(db: Psqlite3; const zDb: string;
  const zTable: string; const zColumn: string; iRow: Int64; flags: Integer;
  out ppBlob: Psqlite3_blob): Integer;
function Sqlite3_blob_read(pBlob: Psqlite3_blob; buffer: Pointer;
  nBytes: Integer; iOffset: Integer): Integer;
function Sqlite3_blob_reopen(pBlob: Psqlite3_blob; iRow: Int64): Integer;
function Sqlite3_blob_write(pBlob: Psqlite3_blob; buffer: Pointer;
  nBytes: Integer; iOffset: Integer): Integer;
function Sqlite3_busy_handler(db: Psqlite3; callback: TBusyHandlerCallback;
  p: Pointer): Integer;
function Sqlite3_busy_timeout(db: Psqlite3; ms: Integer): Integer;
function Sqlite3_cancel_auto_extension(xEntryPoint: TxEntryPoint): Integer;
function Sqlite3_changes(db: Psqlite3): Integer;
function Sqlite3_changes64(db: Psqlite3): Int64;
function Sqlite3_clear_bindings(stmt: Psqlite3_stmt): Integer;
function Sqlite3_close(db: Psqlite3): Integer;
function Sqlite3_close_v2(db: Psqlite3): Integer;
function Sqlite3_collation_needed(db: Psqlite3; p: Pointer;
  callback: TCollationNeededCallback): Integer;
function Sqlite3_collation_needed16(db: Psqlite3; p: Pointer;
  callback: TCollationNeeded16Callback): Integer;
function Sqlite3_column_blob(stmt: Psqlite3_stmt; iCol: Integer): Pointer;
function Sqlite3_column_bytes(stmt: Psqlite3_stmt; iCol: Integer): Integer;
function Sqlite3_column_bytes16(stmt: Psqlite3_stmt; iCol: Integer): Integer;
function Sqlite3_column_count(pStmt: Psqlite3_stmt): Integer;
function Sqlite3_column_database_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function Sqlite3_column_database_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
function Sqlite3_column_decltype(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function Sqlite3_column_decltype16(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function Sqlite3_column_double(stmt: Psqlite3_stmt; iCol: Integer): Double;
function Sqlite3_column_int(stmt: Psqlite3_stmt; iCol: Integer): Integer;
function Sqlite3_column_int64(stmt: Psqlite3_stmt; iCol: Integer): Int64;
function Sqlite3_column_name(pStmt: Psqlite3_stmt; index: Integer): PAnsiChar;
function Sqlite3_column_name16(pStmt: Psqlite3_stmt; index: Integer): PWideChar;
function Sqlite3_column_origin_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function Sqlite3_column_origin_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
function Sqlite3_column_table_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function Sqlite3_column_table_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
function Sqlite3_column_text(stmt: Psqlite3_stmt; iCol: Integer): PAnsiChar;
function Sqlite3_column_text16(stmt: Psqlite3_stmt; iCol: Integer): PWideChar;
function Sqlite3_column_type(stmt: Psqlite3_stmt; iCol: Integer): Integer;
function Sqlite3_column_value(stmt: Psqlite3_stmt; iCol: Integer)
  : Psqlite3_value;
function Sqlite3_commit_hook(db: Psqlite3;
  callback: TCommitHookCallback): Pointer;
function Sqlite3_compileoption_get(N: Integer): PAnsiChar;
function Sqlite3_compileoption_used(const zOptName: string): Integer;
function Sqlite3_complete(const sql: string): Integer;
function Sqlite3_complete16(const sql: string): Integer;
function Sqlite3_context_db_handle(ctx: Psqlite3_context): Psqlite3;
function Sqlite3_create_collation(db: Psqlite3; const name: string;
  eTextRep: Integer; pArg: Pointer;
  xCallback: TCollationFunctionCallback): Integer;
function Sqlite3_create_collation16(db: Psqlite3; const name: string;
  eTextRep: Integer; pArg: Pointer;
  xCallback: TCollationFunctionCallback): Integer;
function Sqlite3_create_collation_v2(db: Psqlite3; const name: string;
  eTextRep: Integer; pArg: Pointer; xCallback: TCollationFunctionCallback;
  xDestroy: TCollationDestroyCallback): Integer;
function Sqlite3_create_filename(const zDatabase: string;
  const zJournal: string; const zWal: string; nParam: Integer;
  var azParam: UTF8String): UTF8String;
function Sqlite3_create_function(db: Psqlite3; const FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal): Integer;
function Sqlite3_create_function16(db: Psqlite3; FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal): Integer;
function Sqlite3_create_function_v2(db: Psqlite3; const FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
  xDestroy: TSQLite3Destructor): Integer;
function Sqlite3_create_module(db: Psqlite3; const zName: string;
  const p: Psqlite3_module; pClientData: Pointer): Integer;
function Sqlite3_create_module_v2(db: Psqlite3; const zName: string;
  const p: Psqlite3_module; pClientData: Pointer;
  xDestroy: TSQLite3Destructor): Integer;
function Sqlite3_create_window_function(db: Psqlite3;
  const FunctionName: string; nArg: Integer; eTextRep: Integer; pApp: Pointer;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
  xValue: TSQLiteFunctionFinal; xInverse: TSQLiteFunctionDef;
  xDestroy: TSQLite3Destructor): Integer;
function Sqlite3_data_count(pStmt: Psqlite3_stmt): Integer;
function Sqlite3_database_file_object(const arg: string): Psqlite3_file;
function Sqlite3_db_cacheflush(db: Psqlite3): Integer;
function Sqlite3_db_filename(db: Psqlite3; const zDbName: string): PAnsiChar;
function Sqlite3_db_handle(stmt: Psqlite3_stmt): Psqlite3;
function Sqlite3_db_mutex(db: Psqlite3): Psqlite3_mutex;
function Sqlite3_db_name(db: Psqlite3): UTF8String;
function Sqlite3_db_readonly(db: Psqlite3; const zDbName: string): Integer;
function Sqlite3_db_release_memory(db: Psqlite3): Integer;
function Sqlite3_db_status(db: Psqlite3; op: Integer; out pCur: Integer;
  out pHiwtr: Integer; resetFlg: Integer): Integer;
function Sqlite3_declare_vtab(db: Psqlite3; const zSQL: string): Integer;
function Sqlite3_deserialize(db: Psqlite3; const zSchema: string;
  pData: PAnsiChar; szDb: Int64; szBuf: Int64; mFlags: Cardinal): Integer;
function Sqlite3_drop_modules(db: Psqlite3;
  const azKeep: PUTF8CharArray): Integer;
function Sqlite3_enable_load_extension(db: Psqlite3; onoff: Integer): Integer;
function Sqlite3_enable_shared_cache(onoff: Integer): Integer;
function Sqlite3_errcode(db: Psqlite3): Integer;
function Sqlite3_errmsg(db: Psqlite3): PAnsiChar;
function Sqlite3_errmsg16(db: Psqlite3): PWideChar;
function Sqlite3_error_offset(db: Psqlite3): Integer;
function Sqlite3_errstr(errcode: Integer): PAnsiChar;
function Sqlite3_exec(db: Psqlite3; const sql: string;
  callback: TSQLiteExecCallback; UserData: Pointer;
  var errmsg: PAnsiChar): Integer;
function Sqlite3_expanded_sql(pStmt: Psqlite3_stmt): PAnsiChar;
function Sqlite3_extended_errcode(db: Psqlite3): Integer;
function Sqlite3_extended_result_codes(db: Psqlite3; onoff: Integer): Integer;
function Sqlite3_file_control(db: Psqlite3; const zDbName: string; op: Integer;
  UserData: Pointer): Integer;
function Sqlite3_filename_database(const fn: string): PAnsiChar;
function Sqlite3_filename_journal(const fn: string): PAnsiChar;
function Sqlite3_filename_wal(const fn: string): PAnsiChar;
function Sqlite3_finalize(pStmt: Psqlite3_stmt): Integer;
procedure Sqlite3_free(data: Pointer);
procedure Sqlite3_free_filename(const fn: string);
procedure Sqlite3_free_table(var pazResult: PUTF8CharArray);
function Sqlite3_get_autocommit(db: Psqlite3): Integer;
function Sqlite3_get_auxdata(ctx: Psqlite3_context; N: Integer): Pointer;
function Sqlite3_get_table(db: Psqlite3; const zSQL: string;
  var pazResult: PUTF8CharArray; var pnRow: Integer; var pnColumn: Integer;
  var pzErrmsg: UTF8String): Integer;
function Sqlite3_hard_heap_limit64(N: Int64): Int64;
function Sqlite3_initialize: Integer;
procedure Sqlite3_interrupt(db: Psqlite3);
function Sqlite3_is_interrupted(db: Psqlite3): Integer;
function Sqlite3_keyword_check(const str: string; strlen: Integer): Integer;
function Sqlite3_keyword_count: Integer;
function Sqlite3_keyword_name(N: Integer; out name: UTF8String;
  out strlen: Integer): Integer;
function Sqlite3_last_insert_rowid(db: Psqlite3): Int64;
function Sqlite3_libversion: PAnsiChar;
function Sqlite3_libversion_number: Integer;
function Sqlite3_limit(db: Psqlite3; id: Integer; newval: Integer): Integer;
function Sqlite3_load_extension(db: Psqlite3; const zFile: string;
  const zProc: string; out errmsg: UTF8String): Integer;
function Sqlite3_malloc(bytes: Integer): Pointer;
function Sqlite3_malloc64(bytes: UInt64): Pointer;
function Sqlite3_memory_highwater(resetFlag: Integer): Int64;
function Sqlite3_memory_used: Int64;
function Sqlite3_msize(data: Pointer): UInt64;
function Sqlite3_mutex_alloc(mutexType: Integer): Psqlite3_mutex;
procedure Sqlite3_mutex_enter(mutex: Psqlite3_mutex);
procedure Sqlite3_mutex_free(mutex: Psqlite3_mutex);
function Sqlite3_mutex_held(mutex: Psqlite3_mutex): Integer;
procedure Sqlite3_mutex_leave(mutex: Psqlite3_mutex);
function Sqlite3_mutex_notheld(mutex: Psqlite3_mutex): Integer;
function Sqlite3_mutex_try(mutex: Psqlite3_mutex): Integer;
function Sqlite3_next_stmt(db: Psqlite3; pStmt: Psqlite3_stmt): Psqlite3_stmt;
function Sqlite3_open(const filename: string; SQLite3: Psqlite3): Integer;
function Sqlite3_open16(const filename: string; out SQLite3: Psqlite3): Integer;
function Sqlite3_open_v2(const filename: string; out SQLite3: Psqlite3;
  flags: Integer; const zVfs: PAnsiString): Integer;
function Sqlite3_os_end: Integer;
function Sqlite3_os_init: Integer;
function Sqlite3_overload_function(db: Psqlite3; const zFuncName: string;
  nArg: Integer): Integer;
function Sqlite3_prepare(db: Psqlite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PAnsiChar): Integer;
function Sqlite3_prepare16(db: Psqlite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString): Integer;
function Sqlite3_prepare16_v2(db: Psqlite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString): Integer;
function Sqlite3_prepare16_v3(db: Psqlite3; const zSQL: string; nByte: Integer;
  prepFlags: Cardinal; out ppStmt: Psqlite3_stmt;
  out pzTail: PAnsiChar): Integer;
function Sqlite3_prepare_v2(db: Psqlite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PAnsiChar): Integer;
function Sqlite3_prepare_v3(db: Psqlite3; const zSQL: string; nByte: Integer;
  prepFlags: Cardinal; out ppStmt: Psqlite3_stmt;
  out pzTail: PAnsiChar): Integer;
function Sqlite3_preupdate_blobwrite(db: Psqlite3): Integer;
function Sqlite3_preupdate_count(db: Psqlite3): Integer;
function Sqlite3_preupdate_depth(db: Psqlite3): Integer;
function Sqlite3_preupdate_hook(db: Psqlite3;
  xPreUpdate: TPreupdateHookCallback; pCtx: Pointer): Pointer;
function Sqlite3_preupdate_new(db: Psqlite3; col: Integer;
  out value: Psqlite3_value): Integer;
function Sqlite3_preupdate_old(db: Psqlite3; col: Integer;
  out value: Psqlite3_value): Integer;
function Sqlite3_profile(db: Psqlite3; xProfile: TProfileCallback;
  UserData: Pointer): Pointer;
procedure Sqlite3_progress_handler(db: Psqlite3; handler: TProgressCallback;
  UserData: Pointer);
procedure Sqlite3_randomness(length: Integer; buffer: Pointer);
function Sqlite3_realloc(data: Pointer; bytes: Integer): Pointer;
function Sqlite3_realloc64(data: Pointer; bytes: UInt64): Pointer;
function Sqlite3_release_memory(bytes: Integer): Integer;
function Sqlite3_reset(pStmt: Psqlite3_stmt): Integer;
procedure Sqlite3_reset_auto_extension;
procedure Sqlite3_result_blob(ctx: Psqlite3_context; blobData: Pointer;
  bytesLength: Integer; xDestructor: TSQLite3Destructor);
procedure Sqlite3_result_blob64(ctx: Psqlite3_context; blobData: Pointer;
  bytesLength: UInt64; xDestructor: TSQLite3Destructor);
procedure Sqlite3_result_double(ctx: Psqlite3_context; data: Double);
procedure Sqlite3_result_error(ctx: Psqlite3_context; const msg: string;
  msgLength: Integer);
procedure Sqlite3_result_error16(ctx: Psqlite3_context; const msg: string;
  msgLength: Integer);
procedure Sqlite3_result_error_code(ctx: Psqlite3; errcode: Integer);
procedure Sqlite3_result_error_nomem(ctx: Psqlite3);
procedure Sqlite3_result_error_toobig(ctx: Psqlite3);
procedure Sqlite3_result_int(ctx: Psqlite3; data: Integer);
procedure Sqlite3_result_int64(ctx: Psqlite3; data: Int64);
procedure Sqlite3_result_null(ctx: Psqlite3);
procedure Sqlite3_result_pointer(ctx: Psqlite3_context; data: Pointer;
  const datatype: string; xDestructor: TSQLite3Destructor);
procedure Sqlite3_result_subtype(ctx: Psqlite3_context; subtype: Cardinal);
procedure Sqlite3_result_text(ctx: Psqlite3_context; const data: string;
  msgLength: Integer; xDestructor: TSQLite3Destructor);
procedure Sqlite3_result_text16(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
procedure Sqlite3_result_text16be(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
procedure Sqlite3_result_text16le(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
procedure Sqlite3_result_text64(ctx: Psqlite3_context; text: PAnsiChar;
  txtLength: UInt64; xDestructor: TSQLite3Destructor; encoding: Char);
procedure Sqlite3_result_value(ctx: Psqlite3_context; value: Psqlite3_value);
procedure Sqlite3_result_zeroblob(ctx: Psqlite3_context; length: Integer);
procedure Sqlite3_result_zeroblob64(ctx: Psqlite3_context; length: UInt64);
function Sqlite3_rollback_hook(db: Psqlite3;
  callback: TRollbackHookCallback): Pointer;
function Sqlite3_serialize(db: Psqlite3; const zSchema: string; out size: Int64;
  flags: Cardinal): PAnsiChar;
function Sqlite3_set_authorizer(db: Psqlite3; xAuth: TAuthorizationCallback;
  UserData: Pointer): Integer;
procedure Sqlite3_set_auxdata(ctx: Psqlite3_context; N: Integer;
  metadata: Pointer; xDestructor: TSQLite3Destructor);
procedure Sqlite3_set_last_insert_rowid(db: Psqlite3; rowid: Int64);
function Sqlite3_shutdown: Integer;
function Sqlite3_sleep(ms: Integer): Integer;
function Sqlite3_snapshot_cmp(p1: Psqlite3_snapshot;
  p2: Psqlite3_snapshot): Integer;
procedure Sqlite3_snapshot_free(snapshot: Psqlite3_snapshot);
function Sqlite3_snapshot_get(db: Psqlite3; const zSchema: string;
  out snapshot: Psqlite3_snapshot): Integer;
function Sqlite3_snapshot_open(db: Psqlite3; const zSchema: string;
  snapshot: Psqlite3_snapshot): Integer;
function Sqlite3_snapshot_recover(db: Psqlite3; const zDb: string): Integer;
function Sqlite3_soft_heap_limit64(N: Int64): Int64;
function Sqlite3_sourceid: PAnsiChar;
function Sqlite3_sql(pStmt: Psqlite3_stmt): PAnsiChar;
function Sqlite3_status(op: Integer; out pCurrent: Integer;
  resetFlag: Integer): Integer;
function Sqlite3_status64(op: Integer; out pCurrent: Int64;
  out pHighwater: Int64; resetFlag: Integer): Integer;
function Sqlite3_step(stmt: Psqlite3_stmt): Integer;
function Sqlite3_stmt_busy(stmt: Psqlite3_stmt): Integer;
function Sqlite3_stmt_isexplain(stmt: Psqlite3_stmt): Integer;
function Sqlite3_stmt_readonly(stmt: Psqlite3_stmt): Integer;
function Sqlite3_stmt_scanstatus(stmt: Psqlite3_stmt; idx: Integer;
  iScanStatusOp: Integer; pOut: Pointer): Integer;
procedure Sqlite3_stmt_scanstatus_reset(stmt: Psqlite3_stmt);
function Sqlite3_stmt_scanstatus_v2(stmt: Psqlite3_stmt; idx: Integer;
  iScanStatusOp: Integer; flags: Integer; pOut: Pointer): Integer;
function Sqlite3_stmt_status(stmt: Psqlite3_stmt; op: Integer;
  resetFlag: Integer): Integer;
procedure sqlite3_str_append(str: Psqlite3_str; zIn: string; N: Integer);
procedure sqlite3_str_appendall(str: Psqlite3_str; zIn: string);
procedure sqlite3_str_appendchar(str: Psqlite3_str; N: Integer; C: AnsiChar);
function sqlite3_str_errcode(str: Psqlite3_str): Integer;
function sqlite3_str_finish(str: Psqlite3_str): PAnsiChar;
function sqlite3_str_length(str: Psqlite3_str): Integer;
function sqlite3_str_new(db: Psqlite3): Psqlite3_str;
procedure sqlite3_str_reset(db: Psqlite3);
function sqlite3_str_value(str: Psqlite3_str): PAnsiChar;
function Sqlite3_strglob(const zGlob: string; const zStr: string): Integer;
function Sqlite3_stricmp(const str1: string; const str2: string): Integer;
function Sqlite3_strlike(const zGlob: string; const zStr: string;
  cEsc: Cardinal): Integer;
function Sqlite3_strnicmp(const str1: string; const str2: string;
  length: Integer): Integer;
function Sqlite3_system_errno(db: Psqlite3): Integer;
function Sqlite3_table_column_metadata(db: Psqlite3; const zDbName: string;
  const zTableName: string; const zColumnName: string;
  out pzDataType: PAnsiChar; out pzCollSeq: PAnsiChar; out pNotNull: Integer;
  out pPrimaryKey: Integer; out pAutoinc: Integer): Integer;
function Sqlite3_threadsafe: Integer;
function Sqlite3_total_changes(db: Psqlite3): Integer;
function Sqlite3_total_changes64(db: Psqlite3): Int64;
function Sqlite3_trace(db: Psqlite3; xTrace: TTraceCallback;
  UserData: Pointer): Pointer;
function Sqlite3_trace_v2(db: Psqlite3; uMask: Cardinal;
  xCallback: TTraceV2Callback; pCtx: Pointer): Integer;
function Sqlite3_txn_state(db: Psqlite3; const zSchema: string): Integer;
function Sqlite3_unlock_notify(pBlocked: Psqlite3; xNotify: TNotifyCallback;
  pNotifyArg: Pointer): Integer;
function Sqlite3_update_hook(db: Psqlite3; updateCallback: TUpdateCallback;
  UserData: Pointer): Pointer;
function Sqlite3_uri_boolean(const zFilename: string; const zParam: string;
  bDefault: Integer): Integer;
function Sqlite3_uri_int64(const zFilename: string; const zParam: string;
  bDefault: Int64): Int64;
function Sqlite3_uri_key(const zFilename: string; N: Integer): PAnsiChar;
function Sqlite3_uri_parameter(const zFilename: string; const zParam: string)
  : PAnsiChar;
function Sqlite3_user_data(ctx: Psqlite3_context): Pointer;
function Sqlite3_value_blob(value: Psqlite3_value): Pointer;
function Sqlite3_value_bytes(value: Psqlite3_value): Integer;
function Sqlite3_value_bytes16(value: Psqlite3_value): Integer;
function Sqlite3_value_double(value: Psqlite3_value): Double;
function Sqlite3_value_dup(const value: Psqlite3_value): Psqlite3_value;
function Sqlite3_value_encoding(db: Psqlite3): Integer;
procedure Sqlite3_value_free(value: Psqlite3_value);
function Sqlite3_value_frombind(value: Psqlite3_value): Integer;
function Sqlite3_value_int(value: Psqlite3_value): Integer;
function Sqlite3_value_int64(value: Psqlite3_value): Int64;
function Sqlite3_value_nochange(value: Psqlite3_value): Integer;
function Sqlite3_value_numeric_type(value: Psqlite3_value): Integer;
function Sqlite3_value_pointer(value: Psqlite3_value;
  const name: string): Pointer;
function Sqlite3_value_subtype(value: Psqlite3_value): Integer;
function Sqlite3_value_text(value: Psqlite3_value): PAnsiChar;
function Sqlite3_value_text16(value: Psqlite3_value): PWideChar;
function Sqlite3_value_text16be(value: Psqlite3_value): PWideChar;
function Sqlite3_value_text16le(value: Psqlite3_value): PWideChar;
function Sqlite3_value_type(value: Psqlite3_value): Integer;
function Sqlite3_vfs_find(const zVfsName: string): Psqlite3_vfs;
function Sqlite3_vfs_register(const zVfsName: string;
  makeDflt: Integer): Integer;
function Sqlite3_vfs_unregister(const zVfsName: string): Integer;
function Sqlite3_vtab_collation(info: Psqlite3_index_info; index: Integer)
  : PAnsiChar;
function Sqlite3_vtab_distinct(info: Psqlite3_index_info): Integer;
function sqlite3_vtab_in(info: Psqlite3_index_info; iCons: Integer;
  bHandle: Integer): Integer;
function sqlite3_vtab_in_first(pVal: Psqlite3_value;
  var ppOut: Psqlite3_value): Integer;
function sqlite3_vtab_in_next(pVal: Psqlite3_value;
  var ppOut: Psqlite3_value): Integer;
function Sqlite3_vtab_nochange(ctx: Psqlite3_context): Integer;
function Sqlite3_vtab_on_conflict(db: Psqlite3): Integer;
function sqlite3_vtab_rhs_value(info: Psqlite3_index_info; j: Integer;
  var ppVal: Psqlite3_value): Integer;
function Sqlite3_wal_autocheckpoint(db: Psqlite3; N: Integer): Integer;
function Sqlite3_wal_checkpoint(db: Psqlite3; const zDb: string): Integer;
function Sqlite3_wal_checkpoint_v2(db: Psqlite3; const zDb: string;
  eMode: Integer; out pnLog: Integer; out pnCkpt: Integer): Integer;
function Sqlite3_wal_hook(db: Psqlite3; callback: TWALCallback;
  UserData: Pointer): Pointer;
function Sqlite3_win32_set_directory(dirType: Integer; zValue: Pointer)
  : Integer;
function Sqlite3_win32_set_directory16(dirType: Integer;
  const zValue: string): Integer;
function Sqlite3_win32_set_directory8(dirType: Integer;
  const zValue: string): Integer;

// TypeInfo(Tsqlite3_aggregate_count) not translated (deprecated)
// TypeInfo(Tsqlite3_config) not translated (open parameters)
// TypeInfo(Tsqlite3_db_config) not translated (open parameters)
// TypeInfo(Tsqlite3_expired) not translated (deprecated)
// TypeInfo(Tsqlite3_global_recover) not translated (deprecated)
// TypeInfo(Tsqlite3_log) not translated (deprecated)
// TypeInfo(Tsqlite3_memory_alarm) not translated (deprecated)
// TypeInfo(Tsqlite3_mprintf) not translated (open parameters)
// TypeInfo(Tsqlite3_normalized_sql) not translated (compile-time optional)
// TypeInfo(Tsqlite3_snprintf) not translated (open parameters)
// TypeInfo(Tsqlite3_soft_heap_limit) not translated (deprecated)
// TypeInfo(Tsqlite3_str_appendf) not translated (open parameters)
// TypeInfo(Tsqlite3_str_vappendf) not translated (open parameters)
// TypeInfo(Tsqlite3_test_control) not translated (open parameters)
// TypeInfo(Tsqlite3_thread_cleanup) not translated (deprecated)
// TypeInfo(Tsqlite3_transfer_bindings) not translated (deprecated)
// TypeInfo(Tsqlite3_version) not translated (not callable)
// TypeInfo(Tsqlite3_vmprintf) not translated (open parameters)
// TypeInfo(Tsqlite3_vsnprintf) not translated (open parameters)
// TypeInfo(Tsqlite3_vtab_config) not translated (open parameters)

{ **************************************************************************** }
implementation

{ **************************************************************************** }

{$IFDEF WIN64}
{$R SQLite3Dll64.RES}
{$ELSE}
{$R SQLite3Dll32.RES}
{$ENDIF}

uses
  SQLite3.Core.Prototypes,
  WinApi.Windows,
  Classes,
  System.SysUtils,
  IOUtils;

const
  SQLITERESID = 'SQLITE3DLL';
  SQLITE3_MAXINDEX = 273;

resourcestring
  EXCPT_MSG = 'SQLite3 function not implemented';

var
  // Global library variables
  TempDLLFile: string = '';
  dllHandler: THandle = 0;
  psqlite3_function: array [0 .. SQLITE3_MAXINDEX] of FARPROC;

  // machine-generated
const
  sqlite3_fname: array [0 .. SQLITE3_MAXINDEX] of UnicodeString =
    ('sqlite3_aggregate_context', 'Sqlite3_auto_extension',
    'Sqlite3_autovacuum_pages', 'Sqlite3_backup_finish', 'Sqlite3_backup_init',
    'Sqlite3_backup_pagecount', 'Sqlite3_backup_remaining',
    'Sqlite3_backup_step', 'Sqlite3_bind_blob', 'Sqlite3_bind_blob64',
    'Sqlite3_bind_double', 'Sqlite3_bind_int', 'Sqlite3_bind_int64',
    'Sqlite3_bind_null', 'Sqlite3_bind_parameter_count',
    'Sqlite3_bind_parameter_index', 'Sqlite3_bind_parameter_name',
    'Sqlite3_bind_pointer', 'Sqlite3_bind_text', 'Sqlite3_bind_text16',
    'Sqlite3_bind_text64', 'Sqlite3_bind_value', 'Sqlite3_bind_zeroblob',
    'Sqlite3_bind_zeroblob64', 'Sqlite3_blob_bytes', 'Sqlite3_blob_close',
    'Sqlite3_blob_open', 'Sqlite3_blob_read', 'Sqlite3_blob_reopen',
    'Sqlite3_blob_write', 'Sqlite3_busy_handler', 'Sqlite3_busy_timeout',
    'Sqlite3_cancel_auto_extension', 'Sqlite3_changes', 'Sqlite3_changes64',
    'Sqlite3_clear_bindings', 'Sqlite3_close', 'Sqlite3_close_v2',
    'Sqlite3_collation_needed', 'Sqlite3_collation_needed16',
    'Sqlite3_column_blob', 'Sqlite3_column_bytes', 'Sqlite3_column_bytes16',
    'Sqlite3_column_count', 'Sqlite3_column_database_name',
    'Sqlite3_column_database_name16', 'Sqlite3_column_decltype',
    'Sqlite3_column_decltype16', 'Sqlite3_column_double', 'Sqlite3_column_int',
    'Sqlite3_column_int64', 'Sqlite3_column_name', 'Sqlite3_column_name16',
    'Sqlite3_column_origin_name', 'Sqlite3_column_origin_name16',
    'Sqlite3_column_table_name', 'Sqlite3_column_table_name16',
    'Sqlite3_column_text', 'Sqlite3_column_text16', 'Sqlite3_column_type',
    'Sqlite3_column_value', 'Sqlite3_commit_hook', 'Sqlite3_compileoption_get',
    'Sqlite3_compileoption_used', 'Sqlite3_complete', 'Sqlite3_complete16',
    'Sqlite3_context_db_handle', 'Sqlite3_create_collation',
    'Sqlite3_create_collation16', 'Sqlite3_create_collation_v2',
    'Sqlite3_create_filename', 'Sqlite3_create_function',
    'Sqlite3_create_function16', 'Sqlite3_create_function_v2',
    'Sqlite3_create_module', 'Sqlite3_create_module_v2',
    'Sqlite3_create_window_function', 'Sqlite3_data_count',
    'Sqlite3_database_file_object', 'Sqlite3_db_cacheflush',
    'Sqlite3_db_filename', 'Sqlite3_db_handle', 'Sqlite3_db_mutex',
    'Sqlite3_db_name', 'Sqlite3_db_readonly', 'Sqlite3_db_release_memory',
    'Sqlite3_db_status', 'Sqlite3_declare_vtab', 'Sqlite3_deserialize',
    'Sqlite3_drop_modules', 'Sqlite3_enable_load_extension',
    'Sqlite3_enable_shared_cache', 'Sqlite3_errcode', 'Sqlite3_errmsg',
    'Sqlite3_errmsg16', 'Sqlite3_error_offset', 'Sqlite3_errstr',
    'Sqlite3_exec', 'Sqlite3_expanded_sql', 'Sqlite3_extended_errcode',
    'Sqlite3_extended_result_codes', 'Sqlite3_file_control',
    'Sqlite3_filename_database', 'Sqlite3_filename_journal',
    'Sqlite3_filename_wal', 'Sqlite3_finalize', 'Sqlite3_free',
    'Sqlite3_free_filename', 'Sqlite3_free_table', 'Sqlite3_get_autocommit',
    'Sqlite3_get_auxdata', 'Sqlite3_get_table', 'Sqlite3_hard_heap_limit64',
    'Sqlite3_initialize', 'Sqlite3_interrupt', 'Sqlite3_is_interrupted',
    'Sqlite3_keyword_check', 'Sqlite3_keyword_count', 'Sqlite3_keyword_name',
    'Sqlite3_last_insert_rowid', 'Sqlite3_libversion',
    'Sqlite3_libversion_number', 'Sqlite3_limit', 'Sqlite3_load_extension',
    'Sqlite3_malloc', 'Sqlite3_malloc64', 'Sqlite3_memory_highwater',
    'Sqlite3_memory_used', 'Sqlite3_msize', 'Sqlite3_mutex_alloc',
    'Sqlite3_mutex_enter', 'Sqlite3_mutex_free', 'Sqlite3_mutex_held',
    'Sqlite3_mutex_leave', 'Sqlite3_mutex_notheld', 'Sqlite3_mutex_try',
    'Sqlite3_next_stmt', 'Sqlite3_open', 'Sqlite3_open16', 'Sqlite3_open_v2',
    'Sqlite3_os_end', 'Sqlite3_os_init', 'Sqlite3_overload_function',
    'Sqlite3_prepare', 'Sqlite3_prepare16', 'Sqlite3_prepare16_v2',
    'Sqlite3_prepare16_v3', 'Sqlite3_prepare_v2', 'Sqlite3_prepare_v3',
    'Sqlite3_preupdate_blobwrite', 'Sqlite3_preupdate_count',
    'Sqlite3_preupdate_depth', 'Sqlite3_preupdate_hook',
    'Sqlite3_preupdate_new', 'Sqlite3_preupdate_old', 'Sqlite3_profile',
    'Sqlite3_progress_handler', 'Sqlite3_randomness', 'Sqlite3_realloc',
    'Sqlite3_realloc64', 'Sqlite3_release_memory', 'Sqlite3_reset',
    'Sqlite3_reset_auto_extension', 'Sqlite3_result_blob',
    'Sqlite3_result_blob64', 'Sqlite3_result_double', 'Sqlite3_result_error',
    'Sqlite3_result_error16', 'Sqlite3_result_error_code',
    'Sqlite3_result_error_nomem', 'Sqlite3_result_error_toobig',
    'Sqlite3_result_int', 'Sqlite3_result_int64', 'Sqlite3_result_null',
    'Sqlite3_result_pointer', 'Sqlite3_result_subtype', 'Sqlite3_result_text',
    'Sqlite3_result_text16', 'Sqlite3_result_text16be',
    'Sqlite3_result_text16le', 'Sqlite3_result_text64', 'Sqlite3_result_value',
    'Sqlite3_result_zeroblob', 'Sqlite3_result_zeroblob64',
    'Sqlite3_rollback_hook', 'Sqlite3_serialize', 'Sqlite3_set_authorizer',
    'Sqlite3_set_auxdata', 'Sqlite3_set_last_insert_rowid', 'Sqlite3_shutdown',
    'Sqlite3_sleep', 'Sqlite3_snapshot_cmp', 'Sqlite3_snapshot_free',
    'Sqlite3_snapshot_get', 'Sqlite3_snapshot_open', 'Sqlite3_snapshot_recover',
    'Sqlite3_soft_heap_limit64', 'Sqlite3_sourceid', 'Sqlite3_sql',
    'Sqlite3_status', 'Sqlite3_status64', 'Sqlite3_step', 'Sqlite3_stmt_busy',
    'Sqlite3_stmt_isexplain', 'Sqlite3_stmt_readonly',
    'Sqlite3_stmt_scanstatus', 'Sqlite3_stmt_scanstatus_reset',
    'Sqlite3_stmt_scanstatus_v2', 'Sqlite3_stmt_status', 'sqlite3_str_append',
    'sqlite3_str_appendall', 'sqlite3_str_appendchar', 'sqlite3_str_errcode',
    'sqlite3_str_finish', 'sqlite3_str_length', 'sqlite3_str_new',
    'sqlite3_str_reset', 'sqlite3_str_value', 'Sqlite3_strglob',
    'Sqlite3_stricmp', 'Sqlite3_strlike', 'Sqlite3_strnicmp',
    'Sqlite3_system_errno', 'Sqlite3_table_column_metadata',
    'Sqlite3_threadsafe', 'Sqlite3_total_changes', 'Sqlite3_total_changes64',
    'Sqlite3_trace', 'Sqlite3_trace_v2', 'Sqlite3_txn_state',
    'Sqlite3_unlock_notify', 'Sqlite3_update_hook', 'Sqlite3_uri_boolean',
    'Sqlite3_uri_int64', 'Sqlite3_uri_key', 'Sqlite3_uri_parameter',
    'Sqlite3_user_data', 'Sqlite3_value_blob', 'Sqlite3_value_bytes',
    'Sqlite3_value_bytes16', 'Sqlite3_value_double', 'Sqlite3_value_dup',
    'Sqlite3_value_encoding', 'Sqlite3_value_free', 'Sqlite3_value_frombind',
    'Sqlite3_value_int', 'Sqlite3_value_int64', 'Sqlite3_value_nochange',
    'Sqlite3_value_numeric_type', 'Sqlite3_value_pointer',
    'Sqlite3_value_subtype', 'Sqlite3_value_text', 'Sqlite3_value_text16',
    'Sqlite3_value_text16be', 'Sqlite3_value_text16le', 'Sqlite3_value_type',
    'Sqlite3_vfs_find', 'Sqlite3_vfs_register', 'Sqlite3_vfs_unregister',
    'Sqlite3_vtab_collation', 'Sqlite3_vtab_distinct', 'sqlite3_vtab_in',
    'sqlite3_vtab_in_first', 'sqlite3_vtab_in_next', 'Sqlite3_vtab_nochange',
    'Sqlite3_vtab_on_conflict', 'sqlite3_vtab_rhs_value',
    'Sqlite3_wal_autocheckpoint', 'Sqlite3_wal_checkpoint',
    'Sqlite3_wal_checkpoint_v2', 'Sqlite3_wal_hook',
    'Sqlite3_win32_set_directory', 'Sqlite3_win32_set_directory16',
    'Sqlite3_win32_set_directory8');

  { **************************************************************************
    Library loading, initialization and finalization
    ************************************************************************** }

function isAvailable: boolean;
begin
  Result := (dllHandler <> 0);
end;

procedure DoLink;
var
  i: Integer;
begin
  for i := low(sqlite3_fname) to high(sqlite3_fname) do
    psqlite3_function[i] := GetProcAddress(dllHandler,
      PWideChar(sqlite3_fname[i]));
end;

procedure DoInitialize;
var
  rs: TResourceStream;
  errmode: Cardinal;
begin
  // Note: no exceptions are raised.
  // In case of error, isAvailable will return false
  // so applications have a chance to deal with it
  try
    // Try to extract DLL to a temporary file.
    // First, get a temporary file name
    TempDLLFile := TPath.GetTempFileName;
  except
    // no access to temporary folder,
    // try current folder
    TempDLLFile := TPath.GetGUIDFileName + '.TMP';
  end;
  try
    // Extract DLL from raw resource
    rs := TResourceStream.Create(GetModuleHandle(nil), SQLITERESID, RT_RCDATA);
    try
      // Copy DLL to temporary file
      rs.SaveToFile(TempDLLFile);
    finally
      rs.Free;
    end;
  except
    TempDLLFile := '';
  end;
  // Load DLL from temporary file
  errmode := SetErrorMode(SEM_FAILCRITICALERRORS or SEM_NOOPENFILEERRORBOX);
  if (TempDLLFile <> '') then
    dllHandler := LoadLibrary(PCHAR(TempDLLFile));
  if (dllHandler = 0) then
    // Try to load from default path
    dllHandler := LoadLibrary('sqlite3.dll');
  if (dllHandler <> 0) then
    DoLink;
  SetErrorMode(errmode);
end;

procedure DoFinalize;
begin
  // Unload sqlite3 DLL
  if (dllHandler <> 0) then
    FreeLibrary(dllHandler);
  // Delete temporary file
  if (TempDLLFile <> '') then
    try
      TFile.Delete(TempDLLFile);
    except
    end;
end;

{ **************************************************************************
  DELPHI IMPLEMENTATION of core SQLITE3 functions

  machine-generated code
  ************************************************************************** }

function sqlite3_aggregate_context(context: Psqlite3_context;
  nBytes: Integer): Pointer;
begin
  if assigned(psqlite3_function[0]) then
    Result := Tsqlite3_aggregate_context(psqlite3_function[0])(context, nBytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_auto_extension(xEntryPoint: TxEntryPoint): Integer;
begin
  if assigned(psqlite3_function[1]) then
    Result := TSqlite3_auto_extension(psqlite3_function[1])(xEntryPoint)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_autovacuum_pages(db: Psqlite3; callback: TAutovacuumCallback;
  data: Pointer; destructorCallback: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[2]) then
    Result := TSqlite3_autovacuum_pages(psqlite3_function[2])
      (db, callback, data, destructorCallback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_backup_finish(p: Psqlite3_backup): Integer;
begin
  if assigned(psqlite3_function[3]) then
    Result := TSqlite3_backup_finish(psqlite3_function[3])(p)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_backup_init(pDest: Psqlite3; const zDestName: string;
  pSource: Psqlite3; const zSourceName: string): Psqlite3_backup;
begin
  if assigned(psqlite3_function[4]) then
    Result := TSqlite3_backup_init(psqlite3_function[4])
      (pDest, UTF8String(zDestName), pSource, UTF8String(zSourceName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_backup_pagecount(p: Psqlite3_backup): Integer;
begin
  if assigned(psqlite3_function[5]) then
    Result := TSqlite3_backup_pagecount(psqlite3_function[5])(p)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_backup_remaining(p: Psqlite3_backup): Integer;
begin
  if assigned(psqlite3_function[6]) then
    Result := TSqlite3_backup_remaining(psqlite3_function[6])(p)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_backup_step(p: Psqlite3_backup; nPage: Integer): Integer;
begin
  if assigned(psqlite3_function[7]) then
    Result := TSqlite3_backup_step(psqlite3_function[7])(p, nPage)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_blob(pStmt: Psqlite3_stmt; index: Integer; value: Pointer;
  nBytes: Integer; pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[8]) then
    Result := TSqlite3_bind_blob(psqlite3_function[8])
      (pStmt, index, value, nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_blob64(pStmt: Psqlite3_stmt; index: Integer;
  value: Pointer; nBytes: UInt64; pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[9]) then
    Result := TSqlite3_bind_blob64(psqlite3_function[9])
      (pStmt, index, value, nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_double(pStmt: Psqlite3_stmt; index: Integer;
  value: Double): Integer;
begin
  if assigned(psqlite3_function[10]) then
    Result := TSqlite3_bind_double(psqlite3_function[10])(pStmt, index, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_int(pStmt: Psqlite3_stmt; index: Integer;
  value: Integer): Integer;
begin
  if assigned(psqlite3_function[11]) then
    Result := TSqlite3_bind_int(psqlite3_function[11])(pStmt, index, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_int64(pStmt: Psqlite3_stmt; index: Integer;
  value: UInt64): Integer;
begin
  if assigned(psqlite3_function[12]) then
    Result := TSqlite3_bind_int64(psqlite3_function[12])(pStmt, index, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_null(pStmt: Psqlite3_stmt; index: Integer): Integer;
begin
  if assigned(psqlite3_function[13]) then
    Result := TSqlite3_bind_null(psqlite3_function[13])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_parameter_count(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[14]) then
    Result := TSqlite3_bind_parameter_count(psqlite3_function[14])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_parameter_index(pStmt: Psqlite3_stmt;
  const zName: string): Integer;
begin
  if assigned(psqlite3_function[15]) then
    Result := TSqlite3_bind_parameter_index(psqlite3_function[15])
      (pStmt, UTF8String(zName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_parameter_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[16]) then
    Result := TSqlite3_bind_parameter_name(psqlite3_function[16])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_pointer(pStmt: Psqlite3_stmt; index: Integer;
  value: Pointer; const valueType: string;
  pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[17]) then
    Result := TSqlite3_bind_pointer(psqlite3_function[17])
      (pStmt, index, value, UTF8String(valueType), pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_text(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: Integer;
  pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[18]) then
    Result := TSqlite3_bind_text(psqlite3_function[18])
      (pStmt, index, UTF8String(value), nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_text16(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: Integer;
  pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[19]) then
    Result := TSqlite3_bind_text16(psqlite3_function[19])
      (pStmt, index, value, nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_text64(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: UInt64; pDestructor: TSQLite3Destructor)
  : Integer;
begin
  if assigned(psqlite3_function[20]) then
    Result := TSqlite3_bind_text64(psqlite3_function[20])
      (pStmt, index, value, nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_value(pStmt: Psqlite3_stmt; index: Integer;
  value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[21]) then
    Result := TSqlite3_bind_value(psqlite3_function[21])(pStmt, index, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_zeroblob(spStmt: Psqlite3_stmt; index: Integer;
  nBytes: Integer): Integer;
begin
  if assigned(psqlite3_function[22]) then
    Result := TSqlite3_bind_zeroblob(psqlite3_function[22])
      (spStmt, index, nBytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_bind_zeroblob64(spStmt: Psqlite3_stmt; index: Integer;
  nBytes: UInt64): Integer;
begin
  if assigned(psqlite3_function[23]) then
    Result := TSqlite3_bind_zeroblob64(psqlite3_function[23])
      (spStmt, index, nBytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_blob_bytes(pBlob: Psqlite3_blob): Integer;
begin
  if assigned(psqlite3_function[24]) then
    Result := TSqlite3_blob_bytes(psqlite3_function[24])(pBlob)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_blob_close(pBlob: Psqlite3_blob): Integer;
begin
  if assigned(psqlite3_function[25]) then
    Result := TSqlite3_blob_close(psqlite3_function[25])(pBlob)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_blob_open(db: Psqlite3; const zDb: string;
  const zTable: string; const zColumn: string; iRow: Int64; flags: Integer;
  out ppBlob: Psqlite3_blob): Integer;
begin
  if assigned(psqlite3_function[26]) then
    Result := TSqlite3_blob_open(psqlite3_function[26])
      (db, UTF8String(zDb), UTF8String(zTable), UTF8String(zColumn), iRow,
      flags, ppBlob)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_blob_read(pBlob: Psqlite3_blob; buffer: Pointer;
  nBytes: Integer; iOffset: Integer): Integer;
begin
  if assigned(psqlite3_function[27]) then
    Result := TSqlite3_blob_read(psqlite3_function[27])
      (pBlob, buffer, nBytes, iOffset)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_blob_reopen(pBlob: Psqlite3_blob; iRow: Int64): Integer;
begin
  if assigned(psqlite3_function[28]) then
    Result := TSqlite3_blob_reopen(psqlite3_function[28])(pBlob, iRow)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_blob_write(pBlob: Psqlite3_blob; buffer: Pointer;
  nBytes: Integer; iOffset: Integer): Integer;
begin
  if assigned(psqlite3_function[29]) then
    Result := TSqlite3_blob_write(psqlite3_function[29])
      (pBlob, buffer, nBytes, iOffset)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_busy_handler(db: Psqlite3; callback: TBusyHandlerCallback;
  p: Pointer): Integer;
begin
  if assigned(psqlite3_function[30]) then
    Result := TSqlite3_busy_handler(psqlite3_function[30])(db, callback, p)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_busy_timeout(db: Psqlite3; ms: Integer): Integer;
begin
  if assigned(psqlite3_function[31]) then
    Result := TSqlite3_busy_timeout(psqlite3_function[31])(db, ms)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_cancel_auto_extension(xEntryPoint: TxEntryPoint): Integer;
begin
  if assigned(psqlite3_function[32]) then
    Result := TSqlite3_cancel_auto_extension(psqlite3_function[32])(xEntryPoint)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_changes(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[33]) then
    Result := TSqlite3_changes(psqlite3_function[33])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_changes64(db: Psqlite3): Int64;
begin
  if assigned(psqlite3_function[34]) then
    Result := TSqlite3_changes64(psqlite3_function[34])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_clear_bindings(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[35]) then
    Result := TSqlite3_clear_bindings(psqlite3_function[35])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_close(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[36]) then
    Result := TSqlite3_close(psqlite3_function[36])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_close_v2(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[37]) then
    Result := TSqlite3_close_v2(psqlite3_function[37])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_collation_needed(db: Psqlite3; p: Pointer;
  callback: TCollationNeededCallback): Integer;
begin
  if assigned(psqlite3_function[38]) then
    Result := TSqlite3_collation_needed(psqlite3_function[38])(db, p, callback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_collation_needed16(db: Psqlite3; p: Pointer;
  callback: TCollationNeeded16Callback): Integer;
begin
  if assigned(psqlite3_function[39]) then
    Result := TSqlite3_collation_needed16(psqlite3_function[39])
      (db, p, callback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_blob(stmt: Psqlite3_stmt; iCol: Integer): Pointer;
begin
  if assigned(psqlite3_function[40]) then
    Result := TSqlite3_column_blob(psqlite3_function[40])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_bytes(stmt: Psqlite3_stmt; iCol: Integer): Integer;
begin
  if assigned(psqlite3_function[41]) then
    Result := TSqlite3_column_bytes(psqlite3_function[41])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_bytes16(stmt: Psqlite3_stmt; iCol: Integer): Integer;
begin
  if assigned(psqlite3_function[42]) then
    Result := TSqlite3_column_bytes16(psqlite3_function[42])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_count(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[43]) then
    Result := TSqlite3_column_count(psqlite3_function[43])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_database_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[44]) then
    Result := TSqlite3_column_database_name(psqlite3_function[44])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_database_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
begin
  if assigned(psqlite3_function[45]) then
    Result := TSqlite3_column_database_name16(psqlite3_function[45])
      (pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_decltype(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[46]) then
    Result := TSqlite3_column_decltype(psqlite3_function[46])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_decltype16(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[47]) then
    Result := TSqlite3_column_decltype16(psqlite3_function[47])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_double(stmt: Psqlite3_stmt; iCol: Integer): Double;
begin
  if assigned(psqlite3_function[48]) then
    Result := TSqlite3_column_double(psqlite3_function[48])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_int(stmt: Psqlite3_stmt; iCol: Integer): Integer;
begin
  if assigned(psqlite3_function[49]) then
    Result := TSqlite3_column_int(psqlite3_function[49])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_int64(stmt: Psqlite3_stmt; iCol: Integer): Int64;
begin
  if assigned(psqlite3_function[50]) then
    Result := TSqlite3_column_int64(psqlite3_function[50])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_name(pStmt: Psqlite3_stmt; index: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[51]) then
    Result := TSqlite3_column_name(psqlite3_function[51])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_name16(pStmt: Psqlite3_stmt; index: Integer): PWideChar;
begin
  if assigned(psqlite3_function[52]) then
    Result := TSqlite3_column_name16(psqlite3_function[52])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_origin_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[53]) then
    Result := TSqlite3_column_origin_name(psqlite3_function[53])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_origin_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
begin
  if assigned(psqlite3_function[54]) then
    Result := TSqlite3_column_origin_name16(psqlite3_function[54])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_table_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[55]) then
    Result := TSqlite3_column_table_name(psqlite3_function[55])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_table_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
begin
  if assigned(psqlite3_function[56]) then
    Result := TSqlite3_column_table_name16(psqlite3_function[56])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_text(stmt: Psqlite3_stmt; iCol: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[57]) then
    Result := TSqlite3_column_text(psqlite3_function[57])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_text16(stmt: Psqlite3_stmt; iCol: Integer): PWideChar;
begin
  if assigned(psqlite3_function[58]) then
    Result := TSqlite3_column_text16(psqlite3_function[58])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_type(stmt: Psqlite3_stmt; iCol: Integer): Integer;
begin
  if assigned(psqlite3_function[59]) then
    Result := TSqlite3_column_type(psqlite3_function[59])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_column_value(stmt: Psqlite3_stmt; iCol: Integer)
  : Psqlite3_value;
begin
  if assigned(psqlite3_function[60]) then
    Result := TSqlite3_column_value(psqlite3_function[60])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_commit_hook(db: Psqlite3;
  callback: TCommitHookCallback): Pointer;
begin
  if assigned(psqlite3_function[61]) then
    Result := TSqlite3_commit_hook(psqlite3_function[61])(db, callback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_compileoption_get(N: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[62]) then
    Result := TSqlite3_compileoption_get(psqlite3_function[62])(N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_compileoption_used(const zOptName: string): Integer;
begin
  if assigned(psqlite3_function[63]) then
    Result := TSqlite3_compileoption_used(psqlite3_function[63])
      (UTF8String(zOptName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_complete(const sql: string): Integer;
begin
  if assigned(psqlite3_function[64]) then
    Result := TSqlite3_complete(psqlite3_function[64])(UTF8String(sql))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_complete16(const sql: string): Integer;
begin
  if assigned(psqlite3_function[65]) then
    Result := TSqlite3_complete16(psqlite3_function[65])(sql)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_context_db_handle(ctx: Psqlite3_context): Psqlite3;
begin
  if assigned(psqlite3_function[66]) then
    Result := TSqlite3_context_db_handle(psqlite3_function[66])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_collation(db: Psqlite3; const name: string;
  eTextRep: Integer; pArg: Pointer;
  xCallback: TCollationFunctionCallback): Integer;
begin
  if assigned(psqlite3_function[67]) then
    Result := TSqlite3_create_collation(psqlite3_function[67])
      (db, UTF8String(name), eTextRep, pArg, xCallback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_collation16(db: Psqlite3; const name: string;
  eTextRep: Integer; pArg: Pointer;
  xCallback: TCollationFunctionCallback): Integer;
begin
  if assigned(psqlite3_function[68]) then
    Result := TSqlite3_create_collation16(psqlite3_function[68])
      (db, name, eTextRep, pArg, xCallback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_collation_v2(db: Psqlite3; const name: string;
  eTextRep: Integer; pArg: Pointer; xCallback: TCollationFunctionCallback;
  xDestroy: TCollationDestroyCallback): Integer;
begin
  if assigned(psqlite3_function[69]) then
    Result := TSqlite3_create_collation_v2(psqlite3_function[69])
      (db, UTF8String(name), eTextRep, pArg, xCallback, xDestroy)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_filename(const zDatabase: string;
  const zJournal: string; const zWal: string; nParam: Integer;
  var azParam: UTF8String): UTF8String;
begin
  if assigned(psqlite3_function[70]) then
    Result := TSqlite3_create_filename(psqlite3_function[70])
      (UTF8String(zDatabase), UTF8String(zJournal), UTF8String(zWal),
      nParam, azParam)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_function(db: Psqlite3; const FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal): Integer;
begin
  if assigned(psqlite3_function[71]) then
    Result := TSqlite3_create_function(psqlite3_function[71])
      (db, UTF8String(FunctionName), nArg, eTextRep, pApp, xFunc, xStep, xFinal)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_function16(db: Psqlite3; FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal): Integer;
begin
  if assigned(psqlite3_function[72]) then
    Result := TSqlite3_create_function16(psqlite3_function[72])
      (db, FunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_function_v2(db: Psqlite3; const FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
  xDestroy: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[73]) then
    Result := TSqlite3_create_function_v2(psqlite3_function[73])
      (db, UTF8String(FunctionName), nArg, eTextRep, pApp, xFunc, xStep, xFinal,
      xDestroy)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_module(db: Psqlite3; const zName: string;
  const p: Psqlite3_module; pClientData: Pointer): Integer;
begin
  if assigned(psqlite3_function[74]) then
    Result := TSqlite3_create_module(psqlite3_function[74])
      (db, UTF8String(zName), p, pClientData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_module_v2(db: Psqlite3; const zName: string;
  const p: Psqlite3_module; pClientData: Pointer;
  xDestroy: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[75]) then
    Result := TSqlite3_create_module_v2(psqlite3_function[75])
      (db, UTF8String(zName), p, pClientData, xDestroy)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_create_window_function(db: Psqlite3;
  const FunctionName: string; nArg: Integer; eTextRep: Integer; pApp: Pointer;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
  xValue: TSQLiteFunctionFinal; xInverse: TSQLiteFunctionDef;
  xDestroy: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[76]) then
    Result := TSqlite3_create_window_function(psqlite3_function[76])
      (db, UTF8String(FunctionName), nArg, eTextRep, pApp, xStep, xFinal,
      xValue, xInverse, xDestroy)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_data_count(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[77]) then
    Result := TSqlite3_data_count(psqlite3_function[77])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_database_file_object(const arg: string): Psqlite3_file;
begin
  if assigned(psqlite3_function[78]) then
    Result := TSqlite3_database_file_object(psqlite3_function[78])
      (UTF8String(arg))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_db_cacheflush(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[79]) then
    Result := TSqlite3_db_cacheflush(psqlite3_function[79])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_db_filename(db: Psqlite3; const zDbName: string): PAnsiChar;
begin
  if assigned(psqlite3_function[80]) then
    Result := TSqlite3_db_filename(psqlite3_function[80])
      (db, UTF8String(zDbName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_db_handle(stmt: Psqlite3_stmt): Psqlite3;
begin
  if assigned(psqlite3_function[81]) then
    Result := TSqlite3_db_handle(psqlite3_function[81])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_db_mutex(db: Psqlite3): Psqlite3_mutex;
begin
  if assigned(psqlite3_function[82]) then
    Result := TSqlite3_db_mutex(psqlite3_function[82])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_db_name(db: Psqlite3): UTF8String;
begin
  if assigned(psqlite3_function[83]) then
    Result := TSqlite3_db_name(psqlite3_function[83])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_db_readonly(db: Psqlite3; const zDbName: string): Integer;
begin
  if assigned(psqlite3_function[84]) then
    Result := TSqlite3_db_readonly(psqlite3_function[84])
      (db, UTF8String(zDbName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_db_release_memory(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[85]) then
    Result := TSqlite3_db_release_memory(psqlite3_function[85])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_db_status(db: Psqlite3; op: Integer; out pCur: Integer;
  out pHiwtr: Integer; resetFlg: Integer): Integer;
begin
  if assigned(psqlite3_function[86]) then
    Result := TSqlite3_db_status(psqlite3_function[86])(db, op, pCur, pHiwtr,
      resetFlg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_declare_vtab(db: Psqlite3; const zSQL: string): Integer;
begin
  if assigned(psqlite3_function[87]) then
    Result := TSqlite3_declare_vtab(psqlite3_function[87])(db, UTF8String(zSQL))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_deserialize(db: Psqlite3; const zSchema: string;
  pData: PAnsiChar; szDb: Int64; szBuf: Int64; mFlags: Cardinal): Integer;
begin
  if assigned(psqlite3_function[88]) then
    Result := TSqlite3_deserialize(psqlite3_function[88])
      (db, UTF8String(zSchema), pData, szDb, szBuf, mFlags)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_drop_modules(db: Psqlite3;
  const azKeep: PUTF8CharArray): Integer;
begin
  if assigned(psqlite3_function[89]) then
    Result := TSqlite3_drop_modules(psqlite3_function[89])(db, azKeep)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_enable_load_extension(db: Psqlite3; onoff: Integer): Integer;
begin
  if assigned(psqlite3_function[90]) then
    Result := TSqlite3_enable_load_extension(psqlite3_function[90])(db, onoff)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_enable_shared_cache(onoff: Integer): Integer;
begin
  if assigned(psqlite3_function[91]) then
    Result := TSqlite3_enable_shared_cache(psqlite3_function[91])(onoff)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_errcode(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[92]) then
    Result := TSqlite3_errcode(psqlite3_function[92])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_errmsg(db: Psqlite3): PAnsiChar;
begin
  if assigned(psqlite3_function[93]) then
    Result := TSqlite3_errmsg(psqlite3_function[93])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_errmsg16(db: Psqlite3): PWideChar;
begin
  if assigned(psqlite3_function[94]) then
    Result := TSqlite3_errmsg16(psqlite3_function[94])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_error_offset(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[95]) then
    Result := TSqlite3_error_offset(psqlite3_function[95])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_errstr(errcode: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[96]) then
    Result := TSqlite3_errstr(psqlite3_function[96])(errcode)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_exec(db: Psqlite3; const sql: string;
  callback: TSQLiteExecCallback; UserData: Pointer;
  var errmsg: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[97]) then
    Result := TSqlite3_exec(psqlite3_function[97])(db, UTF8String(sql),
      callback, UserData, errmsg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_expanded_sql(pStmt: Psqlite3_stmt): PAnsiChar;
begin
  if assigned(psqlite3_function[98]) then
    Result := TSqlite3_expanded_sql(psqlite3_function[98])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_extended_errcode(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[99]) then
    Result := TSqlite3_extended_errcode(psqlite3_function[99])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_extended_result_codes(db: Psqlite3; onoff: Integer): Integer;
begin
  if assigned(psqlite3_function[100]) then
    Result := TSqlite3_extended_result_codes(psqlite3_function[100])(db, onoff)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_file_control(db: Psqlite3; const zDbName: string; op: Integer;
  UserData: Pointer): Integer;
begin
  if assigned(psqlite3_function[101]) then
    Result := TSqlite3_file_control(psqlite3_function[101])
      (db, UTF8String(zDbName), op, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_filename_database(const fn: string): PAnsiChar;
begin
  if assigned(psqlite3_function[102]) then
    Result := TSqlite3_filename_database(psqlite3_function[102])(UTF8String(fn))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_filename_journal(const fn: string): PAnsiChar;
begin
  if assigned(psqlite3_function[103]) then
    Result := TSqlite3_filename_journal(psqlite3_function[103])(UTF8String(fn))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_filename_wal(const fn: string): PAnsiChar;
begin
  if assigned(psqlite3_function[104]) then
    Result := TSqlite3_filename_wal(psqlite3_function[104])(UTF8String(fn))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_finalize(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[105]) then
    Result := TSqlite3_finalize(psqlite3_function[105])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_free(data: Pointer);
begin
  if assigned(psqlite3_function[106]) then
    TSqlite3_free(psqlite3_function[106])(data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_free_filename(const fn: string);
begin
  if assigned(psqlite3_function[107]) then
    TSqlite3_free_filename(psqlite3_function[107])(UTF8String(fn))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_free_table(var pazResult: PUTF8CharArray);
begin
  if assigned(psqlite3_function[108]) then
    TSqlite3_free_table(psqlite3_function[108])(pazResult)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_get_autocommit(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[109]) then
    Result := TSqlite3_get_autocommit(psqlite3_function[109])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_get_auxdata(ctx: Psqlite3_context; N: Integer): Pointer;
begin
  if assigned(psqlite3_function[110]) then
    Result := TSqlite3_get_auxdata(psqlite3_function[110])(ctx, N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_get_table(db: Psqlite3; const zSQL: string;
  var pazResult: PUTF8CharArray; var pnRow: Integer; var pnColumn: Integer;
  var pzErrmsg: UTF8String): Integer;
begin
  if assigned(psqlite3_function[111]) then
    Result := TSqlite3_get_table(psqlite3_function[111])
      (db, UTF8String(zSQL), pazResult, pnRow, pnColumn, pzErrmsg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_hard_heap_limit64(N: Int64): Int64;
begin
  if assigned(psqlite3_function[112]) then
    Result := TSqlite3_hard_heap_limit64(psqlite3_function[112])(N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_initialize: Integer;
begin
  if assigned(psqlite3_function[113]) then
    Result := TSqlite3_initialize(psqlite3_function[113])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_interrupt(db: Psqlite3);
begin
  if assigned(psqlite3_function[114]) then
    TSqlite3_interrupt(psqlite3_function[114])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_is_interrupted(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[115]) then
    Result := TSqlite3_is_interrupted(psqlite3_function[115])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_keyword_check(const str: string; strlen: Integer): Integer;
begin
  if assigned(psqlite3_function[116]) then
    Result := TSqlite3_keyword_check(psqlite3_function[116])
      (UTF8String(str), strlen)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_keyword_count: Integer;
begin
  if assigned(psqlite3_function[117]) then
    Result := TSqlite3_keyword_count(psqlite3_function[117])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_keyword_name(N: Integer; out name: UTF8String;
  out strlen: Integer): Integer;
begin
  if assigned(psqlite3_function[118]) then
    Result := TSqlite3_keyword_name(psqlite3_function[118])(N, name, strlen)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_last_insert_rowid(db: Psqlite3): Int64;
begin
  if assigned(psqlite3_function[119]) then
    Result := TSqlite3_last_insert_rowid(psqlite3_function[119])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_libversion: PAnsiChar;
begin
  if assigned(psqlite3_function[120]) then
    Result := TSqlite3_libversion(psqlite3_function[120])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_libversion_number: Integer;
begin
  if assigned(psqlite3_function[121]) then
    Result := TSqlite3_libversion_number(psqlite3_function[121])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_limit(db: Psqlite3; id: Integer; newval: Integer): Integer;
begin
  if assigned(psqlite3_function[122]) then
    Result := TSqlite3_limit(psqlite3_function[122])(db, id, newval)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_load_extension(db: Psqlite3; const zFile: string;
  const zProc: string; out errmsg: UTF8String): Integer;
begin
  if assigned(psqlite3_function[123]) then
    Result := TSqlite3_load_extension(psqlite3_function[123])
      (db, UTF8String(zFile), UTF8String(zProc), errmsg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_malloc(bytes: Integer): Pointer;
begin
  if assigned(psqlite3_function[124]) then
    Result := TSqlite3_malloc(psqlite3_function[124])(bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_malloc64(bytes: UInt64): Pointer;
begin
  if assigned(psqlite3_function[125]) then
    Result := TSqlite3_malloc64(psqlite3_function[125])(bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_memory_highwater(resetFlag: Integer): Int64;
begin
  if assigned(psqlite3_function[126]) then
    Result := TSqlite3_memory_highwater(psqlite3_function[126])(resetFlag)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_memory_used: Int64;
begin
  if assigned(psqlite3_function[127]) then
    Result := TSqlite3_memory_used(psqlite3_function[127])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_msize(data: Pointer): UInt64;
begin
  if assigned(psqlite3_function[128]) then
    Result := TSqlite3_msize(psqlite3_function[128])(data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_mutex_alloc(mutexType: Integer): Psqlite3_mutex;
begin
  if assigned(psqlite3_function[129]) then
    Result := TSqlite3_mutex_alloc(psqlite3_function[129])(mutexType)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_mutex_enter(mutex: Psqlite3_mutex);
begin
  if assigned(psqlite3_function[130]) then
    TSqlite3_mutex_enter(psqlite3_function[130])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_mutex_free(mutex: Psqlite3_mutex);
begin
  if assigned(psqlite3_function[131]) then
    TSqlite3_mutex_free(psqlite3_function[131])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_mutex_held(mutex: Psqlite3_mutex): Integer;
begin
  if assigned(psqlite3_function[132]) then
    Result := TSqlite3_mutex_held(psqlite3_function[132])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_mutex_leave(mutex: Psqlite3_mutex);
begin
  if assigned(psqlite3_function[133]) then
    TSqlite3_mutex_leave(psqlite3_function[133])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_mutex_notheld(mutex: Psqlite3_mutex): Integer;
begin
  if assigned(psqlite3_function[134]) then
    Result := TSqlite3_mutex_notheld(psqlite3_function[134])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_mutex_try(mutex: Psqlite3_mutex): Integer;
begin
  if assigned(psqlite3_function[135]) then
    Result := TSqlite3_mutex_try(psqlite3_function[135])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_next_stmt(db: Psqlite3; pStmt: Psqlite3_stmt): Psqlite3_stmt;
begin
  if assigned(psqlite3_function[136]) then
    Result := TSqlite3_next_stmt(psqlite3_function[136])(db, pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_open(const filename: string; SQLite3: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[137]) then
    Result := TSqlite3_open(psqlite3_function[137])
      (UTF8String(filename), SQLite3)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_open16(const filename: string; out SQLite3: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[138]) then
    Result := TSqlite3_open16(psqlite3_function[138])(filename, SQLite3)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_open_v2(const filename: string; out SQLite3: Psqlite3;
  flags: Integer; const zVfs: PAnsiString): Integer;
begin
  if assigned(psqlite3_function[139]) then
    Result := TSqlite3_open_v2(psqlite3_function[139])(UTF8String(filename),
      SQLite3, flags, zVfs)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_os_end: Integer;
begin
  if assigned(psqlite3_function[140]) then
    Result := TSqlite3_os_end(psqlite3_function[140])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_os_init: Integer;
begin
  if assigned(psqlite3_function[141]) then
    Result := TSqlite3_os_init(psqlite3_function[141])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_overload_function(db: Psqlite3; const zFuncName: string;
  nArg: Integer): Integer;
begin
  if assigned(psqlite3_function[142]) then
    Result := TSqlite3_overload_function(psqlite3_function[142])
      (db, UTF8String(zFuncName), nArg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_prepare(db: Psqlite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[143]) then
    Result := TSqlite3_prepare(psqlite3_function[143])(db, UTF8String(zSQL),
      nByte, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_prepare16(db: Psqlite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString): Integer;
begin
  if assigned(psqlite3_function[144]) then
    Result := TSqlite3_prepare16(psqlite3_function[144])
      (db, zSQL, nByte, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_prepare16_v2(db: Psqlite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString): Integer;
begin
  if assigned(psqlite3_function[145]) then
    Result := TSqlite3_prepare16_v2(psqlite3_function[145])
      (db, zSQL, nByte, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_prepare16_v3(db: Psqlite3; const zSQL: string; nByte: Integer;
  prepFlags: Cardinal; out ppStmt: Psqlite3_stmt;
  out pzTail: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[146]) then
    Result := TSqlite3_prepare16_v3(psqlite3_function[146])
      (db, zSQL, nByte, prepFlags, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_prepare_v2(db: Psqlite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[147]) then
    Result := TSqlite3_prepare_v2(psqlite3_function[147])
      (db, UTF8String(zSQL), nByte, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_prepare_v3(db: Psqlite3; const zSQL: string; nByte: Integer;
  prepFlags: Cardinal; out ppStmt: Psqlite3_stmt;
  out pzTail: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[148]) then
    Result := TSqlite3_prepare_v3(psqlite3_function[148])
      (db, UTF8String(zSQL), nByte, prepFlags, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_preupdate_blobwrite(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[149]) then
    Result := TSqlite3_preupdate_blobwrite(psqlite3_function[149])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_preupdate_count(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[150]) then
    Result := TSqlite3_preupdate_count(psqlite3_function[150])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_preupdate_depth(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[151]) then
    Result := TSqlite3_preupdate_depth(psqlite3_function[151])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_preupdate_hook(db: Psqlite3;
  xPreUpdate: TPreupdateHookCallback; pCtx: Pointer): Pointer;
begin
  if assigned(psqlite3_function[152]) then
    Result := TSqlite3_preupdate_hook(psqlite3_function[152])
      (db, xPreUpdate, pCtx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_preupdate_new(db: Psqlite3; col: Integer;
  out value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[153]) then
    Result := TSqlite3_preupdate_new(psqlite3_function[153])(db, col, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_preupdate_old(db: Psqlite3; col: Integer;
  out value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[154]) then
    Result := TSqlite3_preupdate_old(psqlite3_function[154])(db, col, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_profile(db: Psqlite3; xProfile: TProfileCallback;
  UserData: Pointer): Pointer;
begin
  if assigned(psqlite3_function[155]) then
    Result := TSqlite3_profile(psqlite3_function[155])(db, xProfile, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_progress_handler(db: Psqlite3; handler: TProgressCallback;
  UserData: Pointer);
begin
  if assigned(psqlite3_function[156]) then
    TSqlite3_progress_handler(psqlite3_function[156])(db, handler, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_randomness(length: Integer; buffer: Pointer);
begin
  if assigned(psqlite3_function[157]) then
    TSqlite3_randomness(psqlite3_function[157])(length, buffer)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_realloc(data: Pointer; bytes: Integer): Pointer;
begin
  if assigned(psqlite3_function[158]) then
    Result := TSqlite3_realloc(psqlite3_function[158])(data, bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_realloc64(data: Pointer; bytes: UInt64): Pointer;
begin
  if assigned(psqlite3_function[159]) then
    Result := TSqlite3_realloc64(psqlite3_function[159])(data, bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_release_memory(bytes: Integer): Integer;
begin
  if assigned(psqlite3_function[160]) then
    Result := TSqlite3_release_memory(psqlite3_function[160])(bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_reset(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[161]) then
    Result := TSqlite3_reset(psqlite3_function[161])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_reset_auto_extension;
begin
  if assigned(psqlite3_function[162]) then
    TSqlite3_reset_auto_extension(psqlite3_function[162])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_blob(ctx: Psqlite3_context; blobData: Pointer;
  bytesLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[163]) then
    TSqlite3_result_blob(psqlite3_function[163])(ctx, blobData, bytesLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_blob64(ctx: Psqlite3_context; blobData: Pointer;
  bytesLength: UInt64; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[164]) then
    TSqlite3_result_blob64(psqlite3_function[164])(ctx, blobData, bytesLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_double(ctx: Psqlite3_context; data: Double);
begin
  if assigned(psqlite3_function[165]) then
    TSqlite3_result_double(psqlite3_function[165])(ctx, data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_error(ctx: Psqlite3_context; const msg: string;
  msgLength: Integer);
begin
  if assigned(psqlite3_function[166]) then
    TSqlite3_result_error(psqlite3_function[166])(ctx, UTF8String(msg),
      msgLength)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_error16(ctx: Psqlite3_context; const msg: string;
  msgLength: Integer);
begin
  if assigned(psqlite3_function[167]) then
    TSqlite3_result_error16(psqlite3_function[167])(ctx, msg, msgLength)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_error_code(ctx: Psqlite3; errcode: Integer);
begin
  if assigned(psqlite3_function[168]) then
    TSqlite3_result_error_code(psqlite3_function[168])(ctx, errcode)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_error_nomem(ctx: Psqlite3);
begin
  if assigned(psqlite3_function[169]) then
    TSqlite3_result_error_nomem(psqlite3_function[169])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_error_toobig(ctx: Psqlite3);
begin
  if assigned(psqlite3_function[170]) then
    TSqlite3_result_error_toobig(psqlite3_function[170])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_int(ctx: Psqlite3; data: Integer);
begin
  if assigned(psqlite3_function[171]) then
    TSqlite3_result_int(psqlite3_function[171])(ctx, data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_int64(ctx: Psqlite3; data: Int64);
begin
  if assigned(psqlite3_function[172]) then
    TSqlite3_result_int64(psqlite3_function[172])(ctx, data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_null(ctx: Psqlite3);
begin
  if assigned(psqlite3_function[173]) then
    TSqlite3_result_null(psqlite3_function[173])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_pointer(ctx: Psqlite3_context; data: Pointer;
  const datatype: string; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[174]) then
    TSqlite3_result_pointer(psqlite3_function[174])
      (ctx, data, UTF8String(datatype), xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_subtype(ctx: Psqlite3_context; subtype: Cardinal);
begin
  if assigned(psqlite3_function[175]) then
    TSqlite3_result_subtype(psqlite3_function[175])(ctx, subtype)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_text(ctx: Psqlite3_context; const data: string;
  msgLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[176]) then
    TSqlite3_result_text(psqlite3_function[176])(ctx, UTF8String(data),
      msgLength, xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_text16(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[177]) then
    TSqlite3_result_text16(psqlite3_function[177])(ctx, text, txtLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_text16be(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[178]) then
    TSqlite3_result_text16be(psqlite3_function[178])(ctx, text, txtLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_text16le(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[179]) then
    TSqlite3_result_text16le(psqlite3_function[179])(ctx, text, txtLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_text64(ctx: Psqlite3_context; text: PAnsiChar;
  txtLength: UInt64; xDestructor: TSQLite3Destructor; encoding: Char);
begin
  if assigned(psqlite3_function[180]) then
    TSqlite3_result_text64(psqlite3_function[180])(ctx, text, txtLength,
      xDestructor, encoding)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_value(ctx: Psqlite3_context; value: Psqlite3_value);
begin
  if assigned(psqlite3_function[181]) then
    TSqlite3_result_value(psqlite3_function[181])(ctx, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_zeroblob(ctx: Psqlite3_context; length: Integer);
begin
  if assigned(psqlite3_function[182]) then
    TSqlite3_result_zeroblob(psqlite3_function[182])(ctx, length)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_result_zeroblob64(ctx: Psqlite3_context; length: UInt64);
begin
  if assigned(psqlite3_function[183]) then
    TSqlite3_result_zeroblob64(psqlite3_function[183])(ctx, length)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_rollback_hook(db: Psqlite3;
  callback: TRollbackHookCallback): Pointer;
begin
  if assigned(psqlite3_function[184]) then
    Result := TSqlite3_rollback_hook(psqlite3_function[184])(db, callback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_serialize(db: Psqlite3; const zSchema: string; out size: Int64;
  flags: Cardinal): PAnsiChar;
begin
  if assigned(psqlite3_function[185]) then
    Result := TSqlite3_serialize(psqlite3_function[185])
      (db, UTF8String(zSchema), size, flags)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_set_authorizer(db: Psqlite3; xAuth: TAuthorizationCallback;
  UserData: Pointer): Integer;
begin
  if assigned(psqlite3_function[186]) then
    Result := TSqlite3_set_authorizer(psqlite3_function[186])
      (db, xAuth, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_set_auxdata(ctx: Psqlite3_context; N: Integer;
  metadata: Pointer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[187]) then
    TSqlite3_set_auxdata(psqlite3_function[187])(ctx, N, metadata, xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_set_last_insert_rowid(db: Psqlite3; rowid: Int64);
begin
  if assigned(psqlite3_function[188]) then
    TSqlite3_set_last_insert_rowid(psqlite3_function[188])(db, rowid)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_shutdown: Integer;
begin
  if assigned(psqlite3_function[189]) then
    Result := TSqlite3_shutdown(psqlite3_function[189])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_sleep(ms: Integer): Integer;
begin
  if assigned(psqlite3_function[190]) then
    Result := TSqlite3_sleep(psqlite3_function[190])(ms)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_snapshot_cmp(p1: Psqlite3_snapshot;
  p2: Psqlite3_snapshot): Integer;
begin
  if assigned(psqlite3_function[191]) then
    Result := TSqlite3_snapshot_cmp(psqlite3_function[191])(p1, p2)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_snapshot_free(snapshot: Psqlite3_snapshot);
begin
  if assigned(psqlite3_function[192]) then
    TSqlite3_snapshot_free(psqlite3_function[192])(snapshot)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_snapshot_get(db: Psqlite3; const zSchema: string;
  out snapshot: Psqlite3_snapshot): Integer;
begin
  if assigned(psqlite3_function[193]) then
    Result := TSqlite3_snapshot_get(psqlite3_function[193])
      (db, UTF8String(zSchema), snapshot)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_snapshot_open(db: Psqlite3; const zSchema: string;
  snapshot: Psqlite3_snapshot): Integer;
begin
  if assigned(psqlite3_function[194]) then
    Result := TSqlite3_snapshot_open(psqlite3_function[194])
      (db, UTF8String(zSchema), snapshot)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_snapshot_recover(db: Psqlite3; const zDb: string): Integer;
begin
  if assigned(psqlite3_function[195]) then
    Result := TSqlite3_snapshot_recover(psqlite3_function[195])
      (db, UTF8String(zDb))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_soft_heap_limit64(N: Int64): Int64;
begin
  if assigned(psqlite3_function[196]) then
    Result := TSqlite3_soft_heap_limit64(psqlite3_function[196])(N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_sourceid: PAnsiChar;
begin
  if assigned(psqlite3_function[197]) then
    Result := TSqlite3_sourceid(psqlite3_function[197])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_sql(pStmt: Psqlite3_stmt): PAnsiChar;
begin
  if assigned(psqlite3_function[198]) then
    Result := TSqlite3_sql(psqlite3_function[198])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_status(op: Integer; out pCurrent: Integer;
  resetFlag: Integer): Integer;
begin
  if assigned(psqlite3_function[199]) then
    Result := TSqlite3_status(psqlite3_function[199])(op, pCurrent, resetFlag)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_status64(op: Integer; out pCurrent: Int64;
  out pHighwater: Int64; resetFlag: Integer): Integer;
begin
  if assigned(psqlite3_function[200]) then
    Result := TSqlite3_status64(psqlite3_function[200])
      (op, pCurrent, pHighwater, resetFlag)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_step(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[201]) then
    Result := TSqlite3_step(psqlite3_function[201])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_stmt_busy(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[202]) then
    Result := TSqlite3_stmt_busy(psqlite3_function[202])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_stmt_isexplain(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[203]) then
    Result := TSqlite3_stmt_isexplain(psqlite3_function[203])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_stmt_readonly(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[204]) then
    Result := TSqlite3_stmt_readonly(psqlite3_function[204])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_stmt_scanstatus(stmt: Psqlite3_stmt; idx: Integer;
  iScanStatusOp: Integer; pOut: Pointer): Integer;
begin
  if assigned(psqlite3_function[205]) then
    Result := TSqlite3_stmt_scanstatus(psqlite3_function[205])
      (stmt, idx, iScanStatusOp, pOut)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_stmt_scanstatus_reset(stmt: Psqlite3_stmt);
begin
  if assigned(psqlite3_function[206]) then
    TSqlite3_stmt_scanstatus_reset(psqlite3_function[206])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_stmt_scanstatus_v2(stmt: Psqlite3_stmt; idx: Integer;
  iScanStatusOp: Integer; flags: Integer; pOut: Pointer): Integer;
begin
  if assigned(psqlite3_function[207]) then
    Result := TSqlite3_stmt_scanstatus_v2(psqlite3_function[207])
      (stmt, idx, iScanStatusOp, flags, pOut)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_stmt_status(stmt: Psqlite3_stmt; op: Integer;
  resetFlag: Integer): Integer;
begin
  if assigned(psqlite3_function[208]) then
    Result := TSqlite3_stmt_status(psqlite3_function[208])(stmt, op, resetFlag)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_str_append(str: Psqlite3_str; zIn: string; N: Integer);
begin
  if assigned(psqlite3_function[209]) then
    Tsqlite3_str_append(psqlite3_function[209])(str, UTF8String(zIn), N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_str_appendall(str: Psqlite3_str; zIn: string);
begin
  if assigned(psqlite3_function[210]) then
    Tsqlite3_str_appendall(psqlite3_function[210])(str, UTF8String(zIn))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_str_appendchar(str: Psqlite3_str; N: Integer; C: AnsiChar);
begin
  if assigned(psqlite3_function[211]) then
    Tsqlite3_str_appendchar(psqlite3_function[211])(str, N, C)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_str_errcode(str: Psqlite3_str): Integer;
begin
  if assigned(psqlite3_function[212]) then
    Result := Tsqlite3_str_errcode(psqlite3_function[212])(str)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_str_finish(str: Psqlite3_str): PAnsiChar;
begin
  if assigned(psqlite3_function[213]) then
    Result := Tsqlite3_str_finish(psqlite3_function[213])(str)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_str_length(str: Psqlite3_str): Integer;
begin
  if assigned(psqlite3_function[214]) then
    Result := Tsqlite3_str_length(psqlite3_function[214])(str)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_str_new(db: Psqlite3): Psqlite3_str;
begin
  if assigned(psqlite3_function[215]) then
    Result := Tsqlite3_str_new(psqlite3_function[215])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_str_reset(db: Psqlite3);
begin
  if assigned(psqlite3_function[216]) then
    Tsqlite3_str_reset(psqlite3_function[216])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_str_value(str: Psqlite3_str): PAnsiChar;
begin
  if assigned(psqlite3_function[217]) then
    Result := Tsqlite3_str_value(psqlite3_function[217])(str)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_strglob(const zGlob: string; const zStr: string): Integer;
begin
  if assigned(psqlite3_function[218]) then
    Result := TSqlite3_strglob(psqlite3_function[218])
      (UTF8String(zGlob), UTF8String(zStr))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_stricmp(const str1: string; const str2: string): Integer;
begin
  if assigned(psqlite3_function[219]) then
    Result := TSqlite3_stricmp(psqlite3_function[219])
      (UTF8String(str1), UTF8String(str2))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_strlike(const zGlob: string; const zStr: string;
  cEsc: Cardinal): Integer;
begin
  if assigned(psqlite3_function[220]) then
    Result := TSqlite3_strlike(psqlite3_function[220])
      (UTF8String(zGlob), UTF8String(zStr), cEsc)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_strnicmp(const str1: string; const str2: string;
  length: Integer): Integer;
begin
  if assigned(psqlite3_function[221]) then
    Result := TSqlite3_strnicmp(psqlite3_function[221])
      (UTF8String(str1), UTF8String(str2), length)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_system_errno(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[222]) then
    Result := TSqlite3_system_errno(psqlite3_function[222])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_table_column_metadata(db: Psqlite3; const zDbName: string;
  const zTableName: string; const zColumnName: string;
  out pzDataType: PAnsiChar; out pzCollSeq: PAnsiChar; out pNotNull: Integer;
  out pPrimaryKey: Integer; out pAutoinc: Integer): Integer;
begin
  if assigned(psqlite3_function[223]) then
    Result := TSqlite3_table_column_metadata(psqlite3_function[223])
      (db, UTF8String(zDbName), UTF8String(zTableName), UTF8String(zColumnName),
      pzDataType, pzCollSeq, pNotNull, pPrimaryKey, pAutoinc)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_threadsafe: Integer;
begin
  if assigned(psqlite3_function[224]) then
    Result := TSqlite3_threadsafe(psqlite3_function[224])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_total_changes(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[225]) then
    Result := TSqlite3_total_changes(psqlite3_function[225])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_total_changes64(db: Psqlite3): Int64;
begin
  if assigned(psqlite3_function[226]) then
    Result := TSqlite3_total_changes64(psqlite3_function[226])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_trace(db: Psqlite3; xTrace: TTraceCallback;
  UserData: Pointer): Pointer;
begin
  if assigned(psqlite3_function[227]) then
    Result := TSqlite3_trace(psqlite3_function[227])(db, xTrace, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_trace_v2(db: Psqlite3; uMask: Cardinal;
  xCallback: TTraceV2Callback; pCtx: Pointer): Integer;
begin
  if assigned(psqlite3_function[228]) then
    Result := TSqlite3_trace_v2(psqlite3_function[228])
      (db, uMask, xCallback, pCtx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_txn_state(db: Psqlite3; const zSchema: string): Integer;
begin
  if assigned(psqlite3_function[229]) then
    Result := TSqlite3_txn_state(psqlite3_function[229])
      (db, UTF8String(zSchema))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_unlock_notify(pBlocked: Psqlite3; xNotify: TNotifyCallback;
  pNotifyArg: Pointer): Integer;
begin
  if assigned(psqlite3_function[230]) then
    Result := TSqlite3_unlock_notify(psqlite3_function[230])
      (pBlocked, xNotify, pNotifyArg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_update_hook(db: Psqlite3; updateCallback: TUpdateCallback;
  UserData: Pointer): Pointer;
begin
  if assigned(psqlite3_function[231]) then
    Result := TSqlite3_update_hook(psqlite3_function[231])
      (db, updateCallback, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_uri_boolean(const zFilename: string; const zParam: string;
  bDefault: Integer): Integer;
begin
  if assigned(psqlite3_function[232]) then
    Result := TSqlite3_uri_boolean(psqlite3_function[232])
      (UTF8String(zFilename), UTF8String(zParam), bDefault)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_uri_int64(const zFilename: string; const zParam: string;
  bDefault: Int64): Int64;
begin
  if assigned(psqlite3_function[233]) then
    Result := TSqlite3_uri_int64(psqlite3_function[233])(UTF8String(zFilename),
      UTF8String(zParam), bDefault)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_uri_key(const zFilename: string; N: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[234]) then
    Result := TSqlite3_uri_key(psqlite3_function[234])(UTF8String(zFilename), N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_uri_parameter(const zFilename: string; const zParam: string)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[235]) then
    Result := TSqlite3_uri_parameter(psqlite3_function[235])
      (UTF8String(zFilename), UTF8String(zParam))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_user_data(ctx: Psqlite3_context): Pointer;
begin
  if assigned(psqlite3_function[236]) then
    Result := TSqlite3_user_data(psqlite3_function[236])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_blob(value: Psqlite3_value): Pointer;
begin
  if assigned(psqlite3_function[237]) then
    Result := TSqlite3_value_blob(psqlite3_function[237])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_bytes(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[238]) then
    Result := TSqlite3_value_bytes(psqlite3_function[238])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_bytes16(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[239]) then
    Result := TSqlite3_value_bytes16(psqlite3_function[239])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_double(value: Psqlite3_value): Double;
begin
  if assigned(psqlite3_function[240]) then
    Result := TSqlite3_value_double(psqlite3_function[240])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_dup(const value: Psqlite3_value): Psqlite3_value;
begin
  if assigned(psqlite3_function[241]) then
    Result := TSqlite3_value_dup(psqlite3_function[241])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_encoding(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[242]) then
    Result := TSqlite3_value_encoding(psqlite3_function[242])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure Sqlite3_value_free(value: Psqlite3_value);
begin
  if assigned(psqlite3_function[243]) then
    TSqlite3_value_free(psqlite3_function[243])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_frombind(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[244]) then
    Result := TSqlite3_value_frombind(psqlite3_function[244])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_int(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[245]) then
    Result := TSqlite3_value_int(psqlite3_function[245])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_int64(value: Psqlite3_value): Int64;
begin
  if assigned(psqlite3_function[246]) then
    Result := TSqlite3_value_int64(psqlite3_function[246])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_nochange(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[247]) then
    Result := TSqlite3_value_nochange(psqlite3_function[247])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_numeric_type(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[248]) then
    Result := TSqlite3_value_numeric_type(psqlite3_function[248])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_pointer(value: Psqlite3_value;
  const name: string): Pointer;
begin
  if assigned(psqlite3_function[249]) then
    Result := TSqlite3_value_pointer(psqlite3_function[249])
      (value, UTF8String(name))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_subtype(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[250]) then
    Result := TSqlite3_value_subtype(psqlite3_function[250])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_text(value: Psqlite3_value): PAnsiChar;
begin
  if assigned(psqlite3_function[251]) then
    Result := TSqlite3_value_text(psqlite3_function[251])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_text16(value: Psqlite3_value): PWideChar;
begin
  if assigned(psqlite3_function[252]) then
    Result := TSqlite3_value_text16(psqlite3_function[252])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_text16be(value: Psqlite3_value): PWideChar;
begin
  if assigned(psqlite3_function[253]) then
    Result := TSqlite3_value_text16be(psqlite3_function[253])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_text16le(value: Psqlite3_value): PWideChar;
begin
  if assigned(psqlite3_function[254]) then
    Result := TSqlite3_value_text16le(psqlite3_function[254])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_value_type(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[255]) then
    Result := TSqlite3_value_type(psqlite3_function[255])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_vfs_find(const zVfsName: string): Psqlite3_vfs;
begin
  if assigned(psqlite3_function[256]) then
    Result := TSqlite3_vfs_find(psqlite3_function[256])(UTF8String(zVfsName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_vfs_register(const zVfsName: string;
  makeDflt: Integer): Integer;
begin
  if assigned(psqlite3_function[257]) then
    Result := TSqlite3_vfs_register(psqlite3_function[257])
      (UTF8String(zVfsName), makeDflt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_vfs_unregister(const zVfsName: string): Integer;
begin
  if assigned(psqlite3_function[258]) then
    Result := TSqlite3_vfs_unregister(psqlite3_function[258])
      (UTF8String(zVfsName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_vtab_collation(info: Psqlite3_index_info; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[259]) then
    Result := TSqlite3_vtab_collation(psqlite3_function[259])(info, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_vtab_distinct(info: Psqlite3_index_info): Integer;
begin
  if assigned(psqlite3_function[260]) then
    Result := TSqlite3_vtab_distinct(psqlite3_function[260])(info)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vtab_in(info: Psqlite3_index_info; iCons: Integer;
  bHandle: Integer): Integer;
begin
  if assigned(psqlite3_function[261]) then
    Result := Tsqlite3_vtab_in(psqlite3_function[261])(info, iCons, bHandle)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vtab_in_first(pVal: Psqlite3_value;
  var ppOut: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[262]) then
    Result := Tsqlite3_vtab_in_first(psqlite3_function[262])(pVal, ppOut)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vtab_in_next(pVal: Psqlite3_value;
  var ppOut: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[263]) then
    Result := Tsqlite3_vtab_in_next(psqlite3_function[263])(pVal, ppOut)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_vtab_nochange(ctx: Psqlite3_context): Integer;
begin
  if assigned(psqlite3_function[264]) then
    Result := TSqlite3_vtab_nochange(psqlite3_function[264])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_vtab_on_conflict(db: Psqlite3): Integer;
begin
  if assigned(psqlite3_function[265]) then
    Result := TSqlite3_vtab_on_conflict(psqlite3_function[265])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vtab_rhs_value(info: Psqlite3_index_info; j: Integer;
  var ppVal: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[266]) then
    Result := Tsqlite3_vtab_rhs_value(psqlite3_function[266])(info, j, ppVal)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_wal_autocheckpoint(db: Psqlite3; N: Integer): Integer;
begin
  if assigned(psqlite3_function[267]) then
    Result := TSqlite3_wal_autocheckpoint(psqlite3_function[267])(db, N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_wal_checkpoint(db: Psqlite3; const zDb: string): Integer;
begin
  if assigned(psqlite3_function[268]) then
    Result := TSqlite3_wal_checkpoint(psqlite3_function[268])
      (db, UTF8String(zDb))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_wal_checkpoint_v2(db: Psqlite3; const zDb: string;
  eMode: Integer; out pnLog: Integer; out pnCkpt: Integer): Integer;
begin
  if assigned(psqlite3_function[269]) then
    Result := TSqlite3_wal_checkpoint_v2(psqlite3_function[269])
      (db, UTF8String(zDb), eMode, pnLog, pnCkpt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_wal_hook(db: Psqlite3; callback: TWALCallback;
  UserData: Pointer): Pointer;
begin
  if assigned(psqlite3_function[270]) then
    Result := TSqlite3_wal_hook(psqlite3_function[270])(db, callback, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_win32_set_directory(dirType: Integer; zValue: Pointer)
  : Integer;
begin
  if assigned(psqlite3_function[271]) then
    Result := TSqlite3_win32_set_directory(psqlite3_function[271])
      (dirType, zValue)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_win32_set_directory16(dirType: Integer;
  const zValue: string): Integer;
begin
  if assigned(psqlite3_function[272]) then
    Result := TSqlite3_win32_set_directory16(psqlite3_function[272])
      (dirType, zValue)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function Sqlite3_win32_set_directory8(dirType: Integer;
  const zValue: string): Integer;
begin
  if assigned(psqlite3_function[273]) then
    Result := TSqlite3_win32_set_directory8(psqlite3_function[273])
      (dirType, UTF8String(zValue))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

{ ************************************************************************** }

initialization

DoInitialize;

finalization

DoFinalize;

end.
