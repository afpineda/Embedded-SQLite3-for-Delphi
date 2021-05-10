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

  TO DO:

  - Some procedures are linked but not exported
  - 64bit implementation not tested

  ******************************************************* }

interface

uses SQLite3.Core.Objects;

function isAvailable: boolean;

// machine-generated code for interface section

function sqlite3_auto_extension(xEntryPoint: TxEntryPoint): Integer;
function sqlite3_backup_finish(p: PSQLite3_backup): Integer;
function sqlite3_aggregate_context(context: Psqlite3_context;
  nBytes: Integer): Pointer;
function sqlite3_backup_init(pDest: PSQLite3; const zDestName: string;
  pSource: PSQLite3; const zSourceName: string): PSQLite3_backup;
function sqlite3_backup_pagecount(p: PSQLite3_backup): Integer;
function sqlite3_backup_remaining(p: PSQLite3_backup): Integer;
function sqlite3_backup_step(p: PSQLite3_backup; nPage: Integer): Integer;
function sqlite3_bind_blob(pStmt: Psqlite3_stmt; index: Integer; value: Pointer;
  nBytes: Integer; pDestructor: TSQLite3Destructor): Integer;
function sqlite3_bind_blob64(pStmt: Psqlite3_stmt; index: Integer;
  value: Pointer; nBytes: UInt64; pDestructor: TSQLite3Destructor): Integer;
function sqlite3_bind_double(pStmt: Psqlite3_stmt; index: Integer;
  value: Double): Integer;
function sqlite3_bind_int(pStmt: Psqlite3_stmt; index: Integer;
  value: Integer): Integer;
function sqlite3_bind_int64(pStmt: Psqlite3_stmt; index: Integer;
  value: UInt64): Integer;
function sqlite3_bind_null(pStmt: Psqlite3_stmt; index: Integer): Integer;
function sqlite3_bind_parameter_count(pStmt: Psqlite3_stmt): Integer;
function sqlite3_bind_parameter_index(pStmt: Psqlite3_stmt;
  const zName: string): Integer;
function sqlite3_bind_parameter_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function sqlite3_bind_pointer(pStmt: Psqlite3_stmt; index: Integer;
  value: Pointer; const valueType: string;
  pDestructor: TSQLite3Destructor): Integer;
function sqlite3_bind_text(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: Integer;
  pDestructor: TSQLite3Destructor): Integer;
function sqlite3_bind_text16(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: Integer;
  pDestructor: TSQLite3Destructor): Integer;
function sqlite3_bind_text64(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: UInt64; pDestructor: TSQLite3Destructor)
  : Integer;
function sqlite3_bind_value(pStmt: Psqlite3_stmt; index: Integer;
  value: Psqlite3_value): Integer;
function sqlite3_bind_zeroblob(spStmt: Psqlite3_stmt; index: Integer;
  nBytes: Integer): Integer;
function sqlite3_bind_zeroblob64(spStmt: Psqlite3_stmt; index: Integer;
  nBytes: UInt64): Integer;
function sqlite3_blob_bytes(pBlob: Psqlite3_blob): Integer;
function sqlite3_blob_close(pBlob: Psqlite3_blob): Integer;
function sqlite3_blob_open(db: PSQLite3; const zDb: string;
  const zTable: string; const zColumn: string; iRow: Int64; flags: Integer;
  out ppBlob: Psqlite3_blob): Integer;
function sqlite3_blob_read(pBlob: Psqlite3_blob; buffer: Pointer;
  nBytes: Integer; iOffset: Integer): Integer;
function sqlite3_blob_reopen(pBlob: Psqlite3_blob; iRow: Int64): Integer;
function sqlite3_blob_write(pBlob: Psqlite3_blob; buffer: Pointer;
  nBytes: Integer; iOffset: Integer): Integer;
function sqlite3_busy_handler(db: PSQLite3; callback: TBusyHandlerCallback;
  p: Pointer): Integer;
function sqlite3_busy_timeout(db: PSQLite3; ms: Integer): Integer;
function sqlite3_cancel_auto_extension(xEntryPoint: TxEntryPoint): Integer;
function sqlite3_changes(db: PSQLite3): Integer;
function sqlite3_clear_bindings(stmt: Psqlite3_stmt): Integer;
function sqlite3_close(db: PSQLite3): Integer;
function sqlite3_close_v2(db: PSQLite3): Integer;
function sqlite3_collation_needed(db: PSQLite3; p: Pointer;
  callback: TCollationNeededCallback): Integer;
function sqlite3_collation_needed16(db: PSQLite3; p: Pointer;
  callback: TCollationNeeded16Callback): Integer;
function sqlite3_column_blob(stmt: Psqlite3_stmt; iCol: Integer): Pointer;
function sqlite3_column_bytes(stmt: Psqlite3_stmt; iCol: Integer): Integer;
function sqlite3_column_bytes16(stmt: Psqlite3_stmt; iCol: Integer): Integer;
function sqlite3_column_count(pStmt: Psqlite3_stmt): Integer;
function sqlite3_column_database_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function sqlite3_column_database_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
function sqlite3_column_decltype(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function sqlite3_column_decltype16(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function sqlite3_column_double(stmt: Psqlite3_stmt; iCol: Integer): Double;
function sqlite3_column_int(stmt: Psqlite3_stmt; iCol: Integer): Integer;
function sqlite3_column_int64(stmt: Psqlite3_stmt; iCol: Integer): Int64;
function sqlite3_column_name(pStmt: Psqlite3_stmt; index: Integer): PAnsiChar;
function sqlite3_column_name16(pStmt: Psqlite3_stmt; index: Integer): PWideChar;
function sqlite3_column_origin_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function sqlite3_column_origin_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
function sqlite3_column_table_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
function sqlite3_column_table_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
function sqlite3_column_text(stmt: Psqlite3_stmt; iCol: Integer): PAnsiChar;
function sqlite3_column_text16(stmt: Psqlite3_stmt; iCol: Integer): PWideChar;
function sqlite3_column_type(stmt: Psqlite3_stmt; iCol: Integer): Integer;
function sqlite3_column_value(stmt: Psqlite3_stmt; iCol: Integer)
  : Psqlite3_value;
function sqlite3_commit_hook(db: PSQLite3;
  callback: TCommitHookCallback): Pointer;
function sqlite3_compileoption_get(N: Integer): PAnsiChar;
function sqlite3_compileoption_used(const zOptName: string): Integer;
function sqlite3_complete(const sql: string): Integer;
function sqlite3_complete16(const sql: string): Integer;
function sqlite3_context_db_handle(ctx: Psqlite3_context): PSQLite3;
function sqlite3_create_collation(db: PSQLite3; const name: string;
  eTextRep: Integer; pArg: Pointer;
  xCallback: TCollationFunctionCallback): Integer;
function sqlite3_create_collation16(db: PSQLite3; const name: string;
  eTextRep: Integer; pArg: Pointer;
  xCallback: TCollationFunctionCallback): Integer;
function sqlite3_create_collation_v2(db: PSQLite3; const name: string;
  eTextRep: Integer; pArg: Pointer; xCallback: TCollationFunctionCallback;
  xDestroy: TCollationDestroyCallback): Integer;
function sqlite3_create_function(db: PSQLite3; const FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal): Integer;
function sqlite3_create_function16(db: PSQLite3; FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal): Integer;
function sqlite3_create_function_v2(db: PSQLite3; const FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
  xDestroy: TSQLite3Destructor): Integer;
function sqlite3_create_module(db: PSQLite3; const zName: string;
  const p: Psqlite3_module; pClientData: Pointer): Integer;
function sqlite3_create_module_v2(db: PSQLite3; const zName: string;
  const p: Psqlite3_module; pClientData: Pointer;
  xDestroy: TSQLite3Destructor): Integer;
function sqlite3_create_window_function(db: PSQLite3;
  const FunctionName: string; nArg: Integer; eTextRep: Integer; pApp: Pointer;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
  xValue: TSQLiteFunctionFinal; xInverse: TSQLiteFunctionDef;
  xDestroy: TSQLite3Destructor): Integer;
function sqlite3_data_count(pStmt: Psqlite3_stmt): Integer;
function sqlite3_db_cacheflush(db: PSQLite3): Integer;
function sqlite3_db_filename(db: PSQLite3; const zDbName: string): PAnsiChar;
function sqlite3_db_handle(stmt: Psqlite3_stmt): PSQLite3;
function sqlite3_db_mutex(db: PSQLite3): Psqlite3_mutex;
function sqlite3_db_readonly(db: PSQLite3; const zDbName: string): Integer;
function sqlite3_db_release_memory(db: PSQLite3): Integer;
function sqlite3_db_status(db: PSQLite3; op: Integer; out pCur: Integer;
  out pHiwtr: Integer; resetFlg: Integer): Integer;
function sqlite3_declare_vtab(db: PSQLite3; const zSQL: string): Integer;
function sqlite3_deserialize(db: PSQLite3; const zSchema: string;
  pData: PAnsiChar; szDb: Int64; szBuf: Int64; mFlags: Cardinal): Integer;
function sqlite3_enable_load_extension(db: PSQLite3; onoff: Integer): Integer;
function sqlite3_enable_shared_cache(onoff: Integer): Integer;
function sqlite3_errcode(db: PSQLite3): Integer;
function sqlite3_errmsg(db: PSQLite3): PAnsiChar;
function sqlite3_errmsg16(db: PSQLite3): PWideChar;
function sqlite3_errstr(errcode: Integer): PAnsiChar;
function sqlite3_exec(db: PSQLite3; const sql: string;
  callback: TSQLiteExecCallback; UserData: Pointer;
  var errmsg: PAnsiChar): Integer;
function sqlite3_expanded_sql(pStmt: Psqlite3_stmt): PAnsiChar;
function sqlite3_extended_errcode(db: PSQLite3): Integer;
function sqlite3_extended_result_codes(db: PSQLite3; onoff: Integer): Integer;
function sqlite3_file_control(db: PSQLite3; const zDbName: string; op: Integer;
  UserData: Pointer): Integer;
function sqlite3_finalize(pStmt: Psqlite3_stmt): Integer;
procedure sqlite3_free(data: Pointer);
function sqlite3_get_autocommit(db: PSQLite3): Integer;
function sqlite3_get_auxdata(ctx: Psqlite3_context; N: Integer): Pointer;
function sqlite3_initialize: Integer;
procedure sqlite3_interrupt(db: PSQLite3);
function sqlite3_keyword_check(const str: string; strlen: Integer): Integer;
function sqlite3_keyword_count: Integer;
function sqlite3_keyword_name(N: Integer; out name: UTF8String;
  out strlen: Integer): Integer;
function sqlite3_last_insert_rowid(db: PSQLite3): Int64;
function sqlite3_libversion: PAnsiChar;
function sqlite3_libversion_number: Integer;
function sqlite3_limit(db: PSQLite3; id: Integer; newval: Integer): Integer;
function sqlite3_load_extension(db: PSQLite3; const zFile: string;
  const zProc: string; out errmsg: UTF8String): Integer;
function sqlite3_malloc(bytes: Integer): Pointer;
function sqlite3_malloc64(bytes: UInt64): Pointer;
function sqlite3_memory_highwater(resetFlag: Integer): Int64;
function sqlite3_memory_used: Int64;
function sqlite3_msize(data: Pointer): UInt64;
function sqlite3_mutex_alloc(mutexType: Integer): Psqlite3_mutex;
procedure sqlite3_mutex_enter(mutex: Psqlite3_mutex);
procedure sqlite3_mutex_free(mutex: Psqlite3_mutex);
function sqlite3_mutex_held(mutex: Psqlite3_mutex): Integer;
procedure sqlite3_mutex_leave(mutex: Psqlite3_mutex);
function sqlite3_mutex_notheld(mutex: Psqlite3_mutex): Integer;
function sqlite3_mutex_try(mutex: Psqlite3_mutex): Integer;
function sqlite3_next_stmt(db: PSQLite3; pStmt: Psqlite3_stmt): Psqlite3_stmt;
function sqlite3_open(const filename: string; SQLite3: PSQLite3): Integer;
function sqlite3_open16(const filename: string; out SQLite3: PSQLite3): Integer;
function sqlite3_open_v2(const filename: string; out SQLite3: PSQLite3;
  flags: Integer; const zVfs: PAnsiString): Integer;
function sqlite3_os_end: Integer;
function sqlite3_os_init: Integer;
function sqlite3_overload_function(db: PSQLite3; const zFuncName: string;
  nArg: Integer): Integer;
function sqlite3_prepare(db: PSQLite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PAnsiChar): Integer;
function sqlite3_prepare16(db: PSQLite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString): Integer;
function sqlite3_prepare16_v2(db: PSQLite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString): Integer;
function sqlite3_prepare16_v3(db: PSQLite3; const zSQL: string; nByte: Integer;
  prepFlags: Cardinal; out ppStmt: Psqlite3_stmt;
  out pzTail: PAnsiChar): Integer;
function sqlite3_prepare_v2(db: PSQLite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PAnsiChar): Integer;
function sqlite3_prepare_v3(db: PSQLite3; const zSQL: string; nByte: Integer;
  prepFlags: Cardinal; out ppStmt: Psqlite3_stmt;
  out pzTail: PAnsiChar): Integer;
function sqlite3_preupdate_count(db: PSQLite3): Integer;
function sqlite3_preupdate_depth(db: PSQLite3): Integer;
function sqlite3_preupdate_hook(db: PSQLite3;
  xPreUpdate: TPreupdateHookCallback; pCtx: Pointer): Pointer;
function sqlite3_preupdate_new(db: PSQLite3; col: Integer;
  out value: Psqlite3_value): Integer;
function sqlite3_preupdate_old(db: PSQLite3; col: Integer;
  out value: Psqlite3_value): Integer;
function sqlite3_profile(db: PSQLite3; xProfile: TProfileCallback;
  UserData: Pointer): Pointer;
procedure sqlite3_progress_handler(db: PSQLite3; handler: TProgressCallback;
  UserData: Pointer);
procedure sqlite3_randomness(length: Integer; buffer: Pointer);
function sqlite3_realloc(data: Pointer; bytes: Integer): Pointer;
function sqlite3_realloc64(data: Pointer; bytes: UInt64): Pointer;
function sqlite3_release_memory(bytes: Integer): Integer;
function sqlite3_reset(pStmt: Psqlite3_stmt): Integer;
procedure sqlite3_reset_auto_extension;
procedure sqlite3_result_blob(ctx: Psqlite3_context; blobData: Pointer;
  bytesLength: Integer; xDestructor: TSQLite3Destructor);
procedure sqlite3_result_blob64(ctx: Psqlite3_context; blobData: Pointer;
  bytesLength: UInt64; xDestructor: TSQLite3Destructor);
procedure sqlite3_result_double(ctx: Psqlite3_context; data: Double);
procedure sqlite3_result_error(ctx: Psqlite3_context; const msg: string;
  msgLength: Integer);
procedure sqlite3_result_error16(ctx: Psqlite3_context; const msg: string;
  msgLength: Integer);
procedure sqlite3_result_error_code(ctx: PSQLite3; errcode: Integer);
procedure sqlite3_result_error_nomem(ctx: PSQLite3);
procedure sqlite3_result_error_toobig(ctx: PSQLite3);
procedure sqlite3_result_int(ctx: PSQLite3; data: Integer);
procedure sqlite3_result_int64(ctx: PSQLite3; data: Int64);
procedure sqlite3_result_null(ctx: PSQLite3);
procedure sqlite3_result_pointer(ctx: Psqlite3_context; data: Pointer;
  const datatype: string; xDestructor: TSQLite3Destructor);
procedure sqlite3_result_subtype(ctx: Psqlite3_context; subtype: Cardinal);
procedure sqlite3_result_text(ctx: Psqlite3_context; const data: string;
  msgLength: Integer; xDestructor: TSQLite3Destructor);
procedure sqlite3_result_text16(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
procedure sqlite3_result_text16be(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
procedure sqlite3_result_text16le(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
procedure sqlite3_result_text64(ctx: Psqlite3_context; text: PAnsiChar;
  txtLength: UInt64; xDestructor: TSQLite3Destructor; encoding: Char);
procedure sqlite3_result_value(ctx: Psqlite3_context; value: Psqlite3_value);
procedure sqlite3_result_zeroblob(ctx: Psqlite3_context; length: Integer);
procedure sqlite3_result_zeroblob64(ctx: Psqlite3_context; length: UInt64);
function sqlite3_rollback_hook(db: PSQLite3;
  callback: TRollbackHookCallback): Pointer;
function sqlite3_serialize(db: PSQLite3; const zSchema: string; out size: Int64;
  flags: Cardinal): PAnsiChar;
function sqlite3_set_authorizer(db: PSQLite3; xAuth: TAuthorizationCallback;
  UserData: Pointer): Integer;
procedure sqlite3_set_auxdata(ctx: Psqlite3_context; N: Integer;
  metadata: Pointer; xDestructor: TSQLite3Destructor);
procedure sqlite3_set_last_insert_rowid(db: PSQLite3; rowid: Int64);
function sqlite3_shutdown: Integer;
function sqlite3_sleep(ms: Integer): Integer;
function sqlite3_snapshot_cmp(p1: Psqlite3_snapshot;
  p2: Psqlite3_snapshot): Integer;
procedure sqlite3_snapshot_free(snapshot: Psqlite3_snapshot);
function sqlite3_snapshot_get(db: PSQLite3; const zSchema: string;
  out snapshot: Psqlite3_snapshot): Integer;
function sqlite3_snapshot_open(db: PSQLite3; const zSchema: string;
  snapshot: Psqlite3_snapshot): Integer;
function sqlite3_snapshot_recover(db: PSQLite3; const zDb: string): Integer;
function sqlite3_soft_heap_limit64(N: Int64): Int64;
function sqlite3_sourceid: PAnsiChar;
function sqlite3_sql(pStmt: Psqlite3_stmt): PAnsiChar;
function sqlite3_status(op: Integer; out pCurrent: Integer;
  resetFlag: Integer): Integer;
function sqlite3_status64(op: Integer; out pCurrent: Int64;
  out pHighwater: Int64; resetFlag: Integer): Integer;
function sqlite3_step(stmt: Psqlite3_stmt): Integer;
function sqlite3_stmt_busy(stmt: Psqlite3_stmt): Integer;
function sqlite3_stmt_readonly(stmt: Psqlite3_stmt): Integer;
function sqlite3_stmt_scanstatus(stmt: Psqlite3_stmt; idx: Integer;
  iScanStatusOp: Integer; pOut: Pointer): Integer;
procedure sqlite3_stmt_scanstatus_reset(stmt: Psqlite3_stmt);
function sqlite3_stmt_status(stmt: Psqlite3_stmt; op: Integer;
  resetFlag: Integer): Integer;
function sqlite3_strglob(const zGlob: string; const zStr: string): Integer;
function sqlite3_stricmp(const str1: string; const str2: string): Integer;
function sqlite3_strnicmp(const str1: string; const str2: string;
  length: Integer): Integer;
function sqlite3_system_errno(db: PSQLite3): Integer;
function sqlite3_table_column_metadata(db: PSQLite3; const zDbName: string;
  const zTableName: string; const zColumnName: string;
  out pzDataType: PAnsiChar; out pzCollSeq: PAnsiChar; out pNotNull: Integer;
  out pPrimaryKey: Integer; out pAutoinc: Integer): Integer;
function sqlite3_threadsafe: Integer;
function sqlite3_total_changes(db: PSQLite3): Integer;
function sqlite3_trace(db: PSQLite3; xTrace: TTraceCallback;
  UserData: Pointer): Pointer;
function sqlite3_trace_v2(db: PSQLite3; uMask: Cardinal;
  xCallback: TTraceV2Callback; pCtx: Pointer): Integer;
function sqlite3_unlock_notify(pBlocked: PSQLite3; xNotify: TNotifyCallback;
  pNotifyArg: Pointer): Integer;
function sqlite3_update_hook(db: PSQLite3; updateCallback: TUpdateCallback;
  UserData: Pointer): Pointer;
function sqlite3_uri_boolean(const zFilename: string; const zParam: string;
  bDefault: Integer): Integer;
function sqlite3_uri_int64(const zFilename: string; const zParam: string;
  bDefault: Int64): Int64;
function sqlite3_uri_parameter(const zFilename: string; const zParam: string)
  : PAnsiChar;
function sqlite3_user_data(ctx: Psqlite3_context): Pointer;
function sqlite3_value_blob(value: Psqlite3_value): Pointer;
function sqlite3_value_bytes(value: Psqlite3_value): Integer;
function sqlite3_value_bytes16(value: Psqlite3_value): Integer;
function sqlite3_value_double(value: Psqlite3_value): Double;
function sqlite3_value_dup(const value: Psqlite3_value): Psqlite3_value;
procedure sqlite3_value_free(value: Psqlite3_value);
function sqlite3_value_int(value: Psqlite3_value): Integer;
function sqlite3_value_int64(value: Psqlite3_value): Int64;
function sqlite3_value_nochange(value: Psqlite3_value): Integer;
function sqlite3_value_numeric_type(value: Psqlite3_value): Integer;
function sqlite3_value_pointer(value: Psqlite3_value;
  const name: string): Pointer;
function sqlite3_value_subtype(value: Psqlite3_value): Integer;
function sqlite3_value_text(value: Psqlite3_value): PAnsiChar;
function sqlite3_value_text16(value: Psqlite3_value): PWideChar;
function sqlite3_value_text16be(value: Psqlite3_value): PWideChar;
function sqlite3_value_text16le(value: Psqlite3_value): PWideChar;
function sqlite3_value_type(value: Psqlite3_value): Integer;
function sqlite3_vfs_find(const zVfsName: string): Psqlite3_vfs;
function sqlite3_vfs_register(const zVfsName: string;
  makeDflt: Integer): Integer;
function sqlite3_vfs_unregister(const zVfsName: string): Integer;
function sqlite3_vtab_collation(info: Psqlite3_index_info; index: Integer)
  : PAnsiChar;
function sqlite3_vtab_nochange(ctx: Psqlite3_context): Integer;
function sqlite3_vtab_on_conflict(db: PSQLite3): Integer;
function sqlite3_wal_autocheckpoint(db: PSQLite3; N: Integer): Integer;
function sqlite3_wal_checkpoint(db: PSQLite3; const zDb: string): Integer;
function sqlite3_wal_checkpoint_v2(db: PSQLite3; const zDb: string;
  eMode: Integer; out pnLog: Integer; out pnCkpt: Integer): Integer;
function sqlite3_wal_hook(db: PSQLite3; callback: TWALCallback;
  UserData: Pointer): Pointer;
function sqlite3_win32_set_directory(dirType: Integer; zValue: Pointer)
  : Integer;
function sqlite3_win32_set_directory16(dirType: Integer;
  const zValue: string): Integer;
function sqlite3_win32_set_directory8(dirType: Integer;
  const zValue: string): Integer;

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
  SQLITE3_MAXINDEX = 235;

resourcestring
  EXCPT_MSG = 'SQLite3 function not implemented';

var
  // Global library variables
  TempDLLFile: string = '';
  dllHandler: THandle = 0;
  psqlite3_function: array [0 .. SQLITE3_MAXINDEX] of FARPROC;

const
  sqlite3_fname: array [0 .. SQLITE3_MAXINDEX] of UnicodeString =
    ('sqlite3_auto_extension', 'sqlite3_backup_finish',
    'sqlite3_aggregate_context', 'sqlite3_backup_init',
    'sqlite3_backup_pagecount', 'sqlite3_backup_remaining',
    'sqlite3_backup_step', 'sqlite3_bind_blob', 'sqlite3_bind_blob64',
    'sqlite3_bind_double', 'sqlite3_bind_int', 'sqlite3_bind_int64',
    'sqlite3_bind_null', 'sqlite3_bind_parameter_count',
    'sqlite3_bind_parameter_index', 'sqlite3_bind_parameter_name',
    'sqlite3_bind_pointer', 'sqlite3_bind_text', 'sqlite3_bind_text16',
    'sqlite3_bind_text64', 'sqlite3_bind_value', 'sqlite3_bind_zeroblob',
    'sqlite3_bind_zeroblob64', 'sqlite3_blob_bytes', 'sqlite3_blob_close',
    'sqlite3_blob_open', 'sqlite3_blob_read', 'sqlite3_blob_reopen',
    'sqlite3_blob_write', 'sqlite3_busy_handler', 'sqlite3_busy_timeout',
    'sqlite3_cancel_auto_extension', 'sqlite3_changes',
    'sqlite3_clear_bindings', 'sqlite3_close', 'sqlite3_close_v2',
    'sqlite3_collation_needed', 'sqlite3_collation_needed16',
    'sqlite3_column_blob', 'sqlite3_column_bytes', 'sqlite3_column_bytes16',
    'sqlite3_column_count', 'sqlite3_column_database_name',
    'sqlite3_column_database_name16', 'sqlite3_column_decltype',
    'sqlite3_column_decltype16', 'sqlite3_column_double', 'sqlite3_column_int',
    'sqlite3_column_int64', 'sqlite3_column_name', 'sqlite3_column_name16',
    'sqlite3_column_origin_name', 'sqlite3_column_origin_name16',
    'sqlite3_column_table_name', 'sqlite3_column_table_name16',
    'sqlite3_column_text', 'sqlite3_column_text16', 'sqlite3_column_type',
    'sqlite3_column_value', 'sqlite3_commit_hook', 'sqlite3_compileoption_get',
    'sqlite3_compileoption_used', 'sqlite3_complete', 'sqlite3_complete16',
    'sqlite3_context_db_handle', 'sqlite3_create_collation',
    'sqlite3_create_collation16', 'sqlite3_create_collation_v2',
    'sqlite3_create_function', 'sqlite3_create_function16',
    'sqlite3_create_function_v2', 'sqlite3_create_module',
    'sqlite3_create_module_v2', 'sqlite3_create_window_function',
    'sqlite3_data_count', 'sqlite3_db_cacheflush', 'sqlite3_db_filename',
    'sqlite3_db_handle', 'sqlite3_db_mutex', 'sqlite3_db_readonly',
    'sqlite3_db_release_memory', 'sqlite3_db_status', 'sqlite3_declare_vtab',
    'sqlite3_deserialize', 'sqlite3_enable_load_extension',
    'sqlite3_enable_shared_cache', 'sqlite3_errcode', 'sqlite3_errmsg',
    'sqlite3_errmsg16', 'sqlite3_errstr', 'sqlite3_exec',
    'sqlite3_expanded_sql', 'sqlite3_extended_errcode',
    'sqlite3_extended_result_codes', 'sqlite3_file_control', 'sqlite3_finalize',
    'sqlite3_free', 'sqlite3_get_autocommit', 'sqlite3_get_auxdata',
    'sqlite3_initialize', 'sqlite3_interrupt', 'sqlite3_keyword_check',
    'sqlite3_keyword_count', 'sqlite3_keyword_name',
    'sqlite3_last_insert_rowid', 'sqlite3_libversion',
    'sqlite3_libversion_number', 'sqlite3_limit', 'sqlite3_load_extension',
    'sqlite3_malloc', 'sqlite3_malloc64', 'sqlite3_memory_highwater',
    'sqlite3_memory_used', 'sqlite3_msize', 'sqlite3_mutex_alloc',
    'sqlite3_mutex_enter', 'sqlite3_mutex_free', 'sqlite3_mutex_held',
    'sqlite3_mutex_leave', 'sqlite3_mutex_notheld', 'sqlite3_mutex_try',
    'sqlite3_next_stmt', 'sqlite3_open', 'sqlite3_open16', 'sqlite3_open_v2',
    'sqlite3_os_end', 'sqlite3_os_init', 'sqlite3_overload_function',
    'sqlite3_prepare', 'sqlite3_prepare16', 'sqlite3_prepare16_v2',
    'sqlite3_prepare16_v3', 'sqlite3_prepare_v2', 'sqlite3_prepare_v3',
    'sqlite3_preupdate_count', 'sqlite3_preupdate_depth',
    'sqlite3_preupdate_hook', 'sqlite3_preupdate_new', 'sqlite3_preupdate_old',
    'sqlite3_profile', 'sqlite3_progress_handler', 'sqlite3_randomness',
    'sqlite3_realloc', 'sqlite3_realloc64', 'sqlite3_release_memory',
    'sqlite3_reset', 'sqlite3_reset_auto_extension', 'sqlite3_result_blob',
    'sqlite3_result_blob64', 'sqlite3_result_double', 'sqlite3_result_error',
    'sqlite3_result_error16', 'sqlite3_result_error_code',
    'sqlite3_result_error_nomem', 'sqlite3_result_error_toobig',
    'sqlite3_result_int', 'sqlite3_result_int64', 'sqlite3_result_null',
    'sqlite3_result_pointer', 'sqlite3_result_subtype', 'sqlite3_result_text',
    'sqlite3_result_text16', 'sqlite3_result_text16be',
    'sqlite3_result_text16le', 'sqlite3_result_text64', 'sqlite3_result_value',
    'sqlite3_result_zeroblob', 'sqlite3_result_zeroblob64',
    'sqlite3_rollback_hook', 'sqlite3_serialize', 'sqlite3_set_authorizer',
    'sqlite3_set_auxdata', 'sqlite3_set_last_insert_rowid', 'sqlite3_shutdown',
    'sqlite3_sleep', 'sqlite3_snapshot_cmp', 'sqlite3_snapshot_free',
    'sqlite3_snapshot_get', 'sqlite3_snapshot_open', 'sqlite3_snapshot_recover',
    'sqlite3_soft_heap_limit64', 'sqlite3_sourceid', 'sqlite3_sql',
    'sqlite3_status', 'sqlite3_status64', 'sqlite3_step', 'sqlite3_stmt_busy',
    'sqlite3_stmt_readonly', 'sqlite3_stmt_scanstatus',
    'sqlite3_stmt_scanstatus_reset', 'sqlite3_stmt_status', 'sqlite3_strglob',
    'sqlite3_stricmp', 'sqlite3_strnicmp', 'sqlite3_system_errno',
    'sqlite3_table_column_metadata', 'sqlite3_threadsafe',
    'sqlite3_total_changes', 'sqlite3_trace', 'sqlite3_trace_v2',
    'sqlite3_unlock_notify', 'sqlite3_update_hook', 'sqlite3_uri_boolean',
    'sqlite3_uri_int64', 'sqlite3_uri_parameter', 'sqlite3_user_data',
    'sqlite3_value_blob', 'sqlite3_value_bytes', 'sqlite3_value_bytes16',
    'sqlite3_value_double', 'sqlite3_value_dup', 'sqlite3_value_free',
    'sqlite3_value_int', 'sqlite3_value_int64', 'sqlite3_value_nochange',
    'sqlite3_value_numeric_type', 'sqlite3_value_pointer',
    'sqlite3_value_subtype', 'sqlite3_value_text', 'sqlite3_value_text16',
    'sqlite3_value_text16be', 'sqlite3_value_text16le', 'sqlite3_value_type',
    'sqlite3_vfs_find', 'sqlite3_vfs_register', 'sqlite3_vfs_unregister',
    'sqlite3_vtab_collation', 'sqlite3_vtab_nochange',
    'sqlite3_vtab_on_conflict', 'sqlite3_wal_autocheckpoint',
    'sqlite3_wal_checkpoint', 'sqlite3_wal_checkpoint_v2', 'sqlite3_wal_hook',
    'sqlite3_win32_set_directory', 'sqlite3_win32_set_directory16',
    'sqlite3_win32_set_directory8');

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

function sqlite3_auto_extension(xEntryPoint: TxEntryPoint): Integer;
begin
  if assigned(psqlite3_function[0]) then
    Result := Tsqlite3_auto_extension(psqlite3_function[0])(xEntryPoint)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_backup_finish(p: PSQLite3_backup): Integer;
begin
  if assigned(psqlite3_function[1]) then
    Result := Tsqlite3_backup_finish(psqlite3_function[1])(p)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_aggregate_context(context: Psqlite3_context;
  nBytes: Integer): Pointer;
begin
  if assigned(psqlite3_function[2]) then
    Result := Tsqlite3_aggregate_context(psqlite3_function[2])(context, nBytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_backup_init(pDest: PSQLite3; const zDestName: string;
  pSource: PSQLite3; const zSourceName: string): PSQLite3_backup;
begin
  if assigned(psqlite3_function[3]) then
    Result := Tsqlite3_backup_init(psqlite3_function[3])
      (pDest, UTF8String(zDestName), pSource, UTF8String(zSourceName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_backup_pagecount(p: PSQLite3_backup): Integer;
begin
  if assigned(psqlite3_function[4]) then
    Result := Tsqlite3_backup_pagecount(psqlite3_function[4])(p)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_backup_remaining(p: PSQLite3_backup): Integer;
begin
  if assigned(psqlite3_function[5]) then
    Result := Tsqlite3_backup_remaining(psqlite3_function[5])(p)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_backup_step(p: PSQLite3_backup; nPage: Integer): Integer;
begin
  if assigned(psqlite3_function[6]) then
    Result := Tsqlite3_backup_step(psqlite3_function[6])(p, nPage)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_blob(pStmt: Psqlite3_stmt; index: Integer; value: Pointer;
  nBytes: Integer; pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[7]) then
    Result := Tsqlite3_bind_blob(psqlite3_function[7])
      (pStmt, index, value, nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_blob64(pStmt: Psqlite3_stmt; index: Integer;
  value: Pointer; nBytes: UInt64; pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[8]) then
    Result := Tsqlite3_bind_blob64(psqlite3_function[8])
      (pStmt, index, value, nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_double(pStmt: Psqlite3_stmt; index: Integer;
  value: Double): Integer;
begin
  if assigned(psqlite3_function[9]) then
    Result := Tsqlite3_bind_double(psqlite3_function[9])(pStmt, index, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_int(pStmt: Psqlite3_stmt; index: Integer;
  value: Integer): Integer;
begin
  if assigned(psqlite3_function[10]) then
    Result := Tsqlite3_bind_int(psqlite3_function[10])(pStmt, index, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_int64(pStmt: Psqlite3_stmt; index: Integer;
  value: UInt64): Integer;
begin
  if assigned(psqlite3_function[11]) then
    Result := Tsqlite3_bind_int64(psqlite3_function[11])(pStmt, index, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_null(pStmt: Psqlite3_stmt; index: Integer): Integer;
begin
  if assigned(psqlite3_function[12]) then
    Result := Tsqlite3_bind_null(psqlite3_function[12])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_parameter_count(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[13]) then
    Result := Tsqlite3_bind_parameter_count(psqlite3_function[13])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_parameter_index(pStmt: Psqlite3_stmt;
  const zName: string): Integer;
begin
  if assigned(psqlite3_function[14]) then
    Result := Tsqlite3_bind_parameter_index(psqlite3_function[14])
      (pStmt, UTF8String(zName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_parameter_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[15]) then
    Result := Tsqlite3_bind_parameter_name(psqlite3_function[15])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_pointer(pStmt: Psqlite3_stmt; index: Integer;
  value: Pointer; const valueType: string;
  pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[16]) then
    Result := Tsqlite3_bind_pointer(psqlite3_function[16])
      (pStmt, index, value, UTF8String(valueType), pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_text(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: Integer;
  pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[17]) then
    Result := Tsqlite3_bind_text(psqlite3_function[17])
      (pStmt, index, UTF8String(value), nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_text16(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: Integer;
  pDestructor: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[18]) then
    Result := Tsqlite3_bind_text16(psqlite3_function[18])
      (pStmt, index, value, nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_text64(pStmt: Psqlite3_stmt; index: Integer;
  const value: string; nBytes: UInt64; pDestructor: TSQLite3Destructor)
  : Integer;
begin
  if assigned(psqlite3_function[19]) then
    Result := Tsqlite3_bind_text64(psqlite3_function[19])
      (pStmt, index, value, nBytes, pDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_value(pStmt: Psqlite3_stmt; index: Integer;
  value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[20]) then
    Result := Tsqlite3_bind_value(psqlite3_function[20])(pStmt, index, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_zeroblob(spStmt: Psqlite3_stmt; index: Integer;
  nBytes: Integer): Integer;
begin
  if assigned(psqlite3_function[21]) then
    Result := Tsqlite3_bind_zeroblob(psqlite3_function[21])
      (spStmt, index, nBytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_bind_zeroblob64(spStmt: Psqlite3_stmt; index: Integer;
  nBytes: UInt64): Integer;
begin
  if assigned(psqlite3_function[22]) then
    Result := Tsqlite3_bind_zeroblob64(psqlite3_function[22])
      (spStmt, index, nBytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_blob_bytes(pBlob: Psqlite3_blob): Integer;
begin
  if assigned(psqlite3_function[23]) then
    Result := Tsqlite3_blob_bytes(psqlite3_function[23])(pBlob)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_blob_close(pBlob: Psqlite3_blob): Integer;
begin
  if assigned(psqlite3_function[24]) then
    Result := Tsqlite3_blob_close(psqlite3_function[24])(pBlob)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_blob_open(db: PSQLite3; const zDb: string;
  const zTable: string; const zColumn: string; iRow: Int64; flags: Integer;
  out ppBlob: Psqlite3_blob): Integer;
begin
  if assigned(psqlite3_function[25]) then
    Result := Tsqlite3_blob_open(psqlite3_function[25])
      (db, UTF8String(zDb), UTF8String(zTable), UTF8String(zColumn), iRow,
      flags, ppBlob)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_blob_read(pBlob: Psqlite3_blob; buffer: Pointer;
  nBytes: Integer; iOffset: Integer): Integer;
begin
  if assigned(psqlite3_function[26]) then
    Result := Tsqlite3_blob_read(psqlite3_function[26])
      (pBlob, buffer, nBytes, iOffset)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_blob_reopen(pBlob: Psqlite3_blob; iRow: Int64): Integer;
begin
  if assigned(psqlite3_function[27]) then
    Result := Tsqlite3_blob_reopen(psqlite3_function[27])(pBlob, iRow)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_blob_write(pBlob: Psqlite3_blob; buffer: Pointer;
  nBytes: Integer; iOffset: Integer): Integer;
begin
  if assigned(psqlite3_function[28]) then
    Result := Tsqlite3_blob_write(psqlite3_function[28])
      (pBlob, buffer, nBytes, iOffset)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_busy_handler(db: PSQLite3; callback: TBusyHandlerCallback;
  p: Pointer): Integer;
begin
  if assigned(psqlite3_function[29]) then
    Result := Tsqlite3_busy_handler(psqlite3_function[29])(db, callback, p)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_busy_timeout(db: PSQLite3; ms: Integer): Integer;
begin
  if assigned(psqlite3_function[30]) then
    Result := Tsqlite3_busy_timeout(psqlite3_function[30])(db, ms)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_cancel_auto_extension(xEntryPoint: TxEntryPoint): Integer;
begin
  if assigned(psqlite3_function[31]) then
    Result := Tsqlite3_cancel_auto_extension(psqlite3_function[31])(xEntryPoint)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_changes(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[32]) then
    Result := Tsqlite3_changes(psqlite3_function[32])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_clear_bindings(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[33]) then
    Result := Tsqlite3_clear_bindings(psqlite3_function[33])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_close(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[34]) then
    Result := Tsqlite3_close(psqlite3_function[34])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_close_v2(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[35]) then
    Result := Tsqlite3_close_v2(psqlite3_function[35])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_collation_needed(db: PSQLite3; p: Pointer;
  callback: TCollationNeededCallback): Integer;
begin
  if assigned(psqlite3_function[36]) then
    Result := Tsqlite3_collation_needed(psqlite3_function[36])(db, p, callback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_collation_needed16(db: PSQLite3; p: Pointer;
  callback: TCollationNeeded16Callback): Integer;
begin
  if assigned(psqlite3_function[37]) then
    Result := Tsqlite3_collation_needed16(psqlite3_function[37])
      (db, p, callback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_blob(stmt: Psqlite3_stmt; iCol: Integer): Pointer;
begin
  if assigned(psqlite3_function[38]) then
    Result := Tsqlite3_column_blob(psqlite3_function[38])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_bytes(stmt: Psqlite3_stmt; iCol: Integer): Integer;
begin
  if assigned(psqlite3_function[39]) then
    Result := Tsqlite3_column_bytes(psqlite3_function[39])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_bytes16(stmt: Psqlite3_stmt; iCol: Integer): Integer;
begin
  if assigned(psqlite3_function[40]) then
    Result := Tsqlite3_column_bytes16(psqlite3_function[40])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_count(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[41]) then
    Result := Tsqlite3_column_count(psqlite3_function[41])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_database_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[42]) then
    Result := Tsqlite3_column_database_name(psqlite3_function[42])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_database_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
begin
  if assigned(psqlite3_function[43]) then
    Result := Tsqlite3_column_database_name16(psqlite3_function[43])
      (pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_decltype(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[44]) then
    Result := Tsqlite3_column_decltype(psqlite3_function[44])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_decltype16(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[45]) then
    Result := Tsqlite3_column_decltype16(psqlite3_function[45])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_double(stmt: Psqlite3_stmt; iCol: Integer): Double;
begin
  if assigned(psqlite3_function[46]) then
    Result := Tsqlite3_column_double(psqlite3_function[46])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_int(stmt: Psqlite3_stmt; iCol: Integer): Integer;
begin
  if assigned(psqlite3_function[47]) then
    Result := Tsqlite3_column_int(psqlite3_function[47])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_int64(stmt: Psqlite3_stmt; iCol: Integer): Int64;
begin
  if assigned(psqlite3_function[48]) then
    Result := Tsqlite3_column_int64(psqlite3_function[48])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_name(pStmt: Psqlite3_stmt; index: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[49]) then
    Result := Tsqlite3_column_name(psqlite3_function[49])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_name16(pStmt: Psqlite3_stmt; index: Integer): PWideChar;
begin
  if assigned(psqlite3_function[50]) then
    Result := Tsqlite3_column_name16(psqlite3_function[50])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_origin_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[51]) then
    Result := Tsqlite3_column_origin_name(psqlite3_function[51])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_origin_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
begin
  if assigned(psqlite3_function[52]) then
    Result := Tsqlite3_column_origin_name16(psqlite3_function[52])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_table_name(pStmt: Psqlite3_stmt; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[53]) then
    Result := Tsqlite3_column_table_name(psqlite3_function[53])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_table_name16(pStmt: Psqlite3_stmt; index: Integer)
  : PWideChar;
begin
  if assigned(psqlite3_function[54]) then
    Result := Tsqlite3_column_table_name16(psqlite3_function[54])(pStmt, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_text(stmt: Psqlite3_stmt; iCol: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[55]) then
    Result := Tsqlite3_column_text(psqlite3_function[55])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_text16(stmt: Psqlite3_stmt; iCol: Integer): PWideChar;
begin
  if assigned(psqlite3_function[56]) then
    Result := Tsqlite3_column_text16(psqlite3_function[56])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_type(stmt: Psqlite3_stmt; iCol: Integer): Integer;
begin
  if assigned(psqlite3_function[57]) then
    Result := Tsqlite3_column_type(psqlite3_function[57])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_column_value(stmt: Psqlite3_stmt; iCol: Integer)
  : Psqlite3_value;
begin
  if assigned(psqlite3_function[58]) then
    Result := Tsqlite3_column_value(psqlite3_function[58])(stmt, iCol)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_commit_hook(db: PSQLite3;
  callback: TCommitHookCallback): Pointer;
begin
  if assigned(psqlite3_function[59]) then
    Result := Tsqlite3_commit_hook(psqlite3_function[59])(db, callback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_compileoption_get(N: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[60]) then
    Result := Tsqlite3_compileoption_get(psqlite3_function[60])(N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_compileoption_used(const zOptName: string): Integer;
begin
  if assigned(psqlite3_function[61]) then
    Result := Tsqlite3_compileoption_used(psqlite3_function[61])
      (UTF8String(zOptName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_complete(const sql: string): Integer;
begin
  if assigned(psqlite3_function[62]) then
    Result := Tsqlite3_complete(psqlite3_function[62])(UTF8String(sql))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_complete16(const sql: string): Integer;
begin
  if assigned(psqlite3_function[63]) then
    Result := Tsqlite3_complete16(psqlite3_function[63])(sql)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_context_db_handle(ctx: Psqlite3_context): PSQLite3;
begin
  if assigned(psqlite3_function[64]) then
    Result := Tsqlite3_context_db_handle(psqlite3_function[64])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_collation(db: PSQLite3; const name: string;
  eTextRep: Integer; pArg: Pointer;
  xCallback: TCollationFunctionCallback): Integer;
begin
  if assigned(psqlite3_function[65]) then
    Result := Tsqlite3_create_collation(psqlite3_function[65])
      (db, UTF8String(name), eTextRep, pArg, xCallback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_collation16(db: PSQLite3; const name: string;
  eTextRep: Integer; pArg: Pointer;
  xCallback: TCollationFunctionCallback): Integer;
begin
  if assigned(psqlite3_function[66]) then
    Result := Tsqlite3_create_collation16(psqlite3_function[66])
      (db, name, eTextRep, pArg, xCallback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_collation_v2(db: PSQLite3; const name: string;
  eTextRep: Integer; pArg: Pointer; xCallback: TCollationFunctionCallback;
  xDestroy: TCollationDestroyCallback): Integer;
begin
  if assigned(psqlite3_function[67]) then
    Result := Tsqlite3_create_collation_v2(psqlite3_function[67])
      (db, UTF8String(name), eTextRep, pArg, xCallback, xDestroy)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_function(db: PSQLite3; const FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal): Integer;
begin
  if assigned(psqlite3_function[68]) then
    Result := Tsqlite3_create_function(psqlite3_function[68])
      (db, UTF8String(FunctionName), nArg, eTextRep, pApp, xFunc, xStep, xFinal)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_function16(db: PSQLite3; FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal): Integer;
begin
  if assigned(psqlite3_function[69]) then
    Result := Tsqlite3_create_function16(psqlite3_function[69])
      (db, FunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_function_v2(db: PSQLite3; const FunctionName: string;
  nArg: Integer; eTextRep: Integer; pApp: Pointer; xFunc: TSQLiteFunctionDef;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
  xDestroy: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[70]) then
    Result := Tsqlite3_create_function_v2(psqlite3_function[70])
      (db, UTF8String(FunctionName), nArg, eTextRep, pApp, xFunc, xStep,
      xFinal, xDestroy)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_module(db: PSQLite3; const zName: string;
  const p: Psqlite3_module; pClientData: Pointer): Integer;
begin
  if assigned(psqlite3_function[71]) then
    Result := Tsqlite3_create_module(psqlite3_function[71])
      (db, UTF8String(zName), p, pClientData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_module_v2(db: PSQLite3; const zName: string;
  const p: Psqlite3_module; pClientData: Pointer;
  xDestroy: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[72]) then
    Result := Tsqlite3_create_module_v2(psqlite3_function[72])
      (db, UTF8String(zName), p, pClientData, xDestroy)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_create_window_function(db: PSQLite3;
  const FunctionName: string; nArg: Integer; eTextRep: Integer; pApp: Pointer;
  xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
  xValue: TSQLiteFunctionFinal; xInverse: TSQLiteFunctionDef;
  xDestroy: TSQLite3Destructor): Integer;
begin
  if assigned(psqlite3_function[73]) then
    Result := Tsqlite3_create_window_function(psqlite3_function[73])
      (db, UTF8String(FunctionName), nArg, eTextRep, pApp, xStep, xFinal,
      xValue, xInverse, xDestroy)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_data_count(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[74]) then
    Result := Tsqlite3_data_count(psqlite3_function[74])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_db_cacheflush(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[75]) then
    Result := Tsqlite3_db_cacheflush(psqlite3_function[75])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_db_filename(db: PSQLite3; const zDbName: string): PAnsiChar;
begin
  if assigned(psqlite3_function[76]) then
    Result := Tsqlite3_db_filename(psqlite3_function[76])
      (db, UTF8String(zDbName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_db_handle(stmt: Psqlite3_stmt): PSQLite3;
begin
  if assigned(psqlite3_function[77]) then
    Result := Tsqlite3_db_handle(psqlite3_function[77])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_db_mutex(db: PSQLite3): Psqlite3_mutex;
begin
  if assigned(psqlite3_function[78]) then
    Result := Tsqlite3_db_mutex(psqlite3_function[78])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_db_readonly(db: PSQLite3; const zDbName: string): Integer;
begin
  if assigned(psqlite3_function[79]) then
    Result := Tsqlite3_db_readonly(psqlite3_function[79])
      (db, UTF8String(zDbName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_db_release_memory(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[80]) then
    Result := Tsqlite3_db_release_memory(psqlite3_function[80])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_db_status(db: PSQLite3; op: Integer; out pCur: Integer;
  out pHiwtr: Integer; resetFlg: Integer): Integer;
begin
  if assigned(psqlite3_function[81]) then
    Result := Tsqlite3_db_status(psqlite3_function[81])
      (db, op, pCur, pHiwtr, resetFlg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_declare_vtab(db: PSQLite3; const zSQL: string): Integer;
begin
  if assigned(psqlite3_function[82]) then
    Result := Tsqlite3_declare_vtab(psqlite3_function[82])(db, UTF8String(zSQL))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_deserialize(db: PSQLite3; const zSchema: string;
  pData: PAnsiChar; szDb: Int64; szBuf: Int64; mFlags: Cardinal): Integer;
begin
  if assigned(psqlite3_function[83]) then
    Result := Tsqlite3_deserialize(psqlite3_function[83])
      (db, UTF8String(zSchema), pData, szDb, szBuf, mFlags)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_enable_load_extension(db: PSQLite3; onoff: Integer): Integer;
begin
  if assigned(psqlite3_function[84]) then
    Result := Tsqlite3_enable_load_extension(psqlite3_function[84])(db, onoff)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_enable_shared_cache(onoff: Integer): Integer;
begin
  if assigned(psqlite3_function[85]) then
    Result := Tsqlite3_enable_shared_cache(psqlite3_function[85])(onoff)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_errcode(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[86]) then
    Result := Tsqlite3_errcode(psqlite3_function[86])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_errmsg(db: PSQLite3): PAnsiChar;
begin
  if assigned(psqlite3_function[87]) then
    Result := Tsqlite3_errmsg(psqlite3_function[87])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_errmsg16(db: PSQLite3): PWideChar;
begin
  if assigned(psqlite3_function[88]) then
    Result := Tsqlite3_errmsg16(psqlite3_function[88])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_errstr(errcode: Integer): PAnsiChar;
begin
  if assigned(psqlite3_function[89]) then
    Result := Tsqlite3_errstr(psqlite3_function[89])(errcode)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_exec(db: PSQLite3; const sql: string;
  callback: TSQLiteExecCallback; UserData: Pointer;
  var errmsg: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[90]) then
    Result := Tsqlite3_exec(psqlite3_function[90])(db, UTF8String(sql),
      callback, UserData, errmsg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_expanded_sql(pStmt: Psqlite3_stmt): PAnsiChar;
begin
  if assigned(psqlite3_function[91]) then
    Result := Tsqlite3_expanded_sql(psqlite3_function[91])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_extended_errcode(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[92]) then
    Result := Tsqlite3_extended_errcode(psqlite3_function[92])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_extended_result_codes(db: PSQLite3; onoff: Integer): Integer;
begin
  if assigned(psqlite3_function[93]) then
    Result := Tsqlite3_extended_result_codes(psqlite3_function[93])(db, onoff)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_file_control(db: PSQLite3; const zDbName: string; op: Integer;
  UserData: Pointer): Integer;
begin
  if assigned(psqlite3_function[94]) then
    Result := Tsqlite3_file_control(psqlite3_function[94])
      (db, UTF8String(zDbName), op, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_finalize(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[95]) then
    Result := Tsqlite3_finalize(psqlite3_function[95])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_free(data: Pointer);
begin
  if assigned(psqlite3_function[96]) then
    Tsqlite3_free(psqlite3_function[96])(data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_get_autocommit(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[97]) then
    Result := Tsqlite3_get_autocommit(psqlite3_function[97])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_get_auxdata(ctx: Psqlite3_context; N: Integer): Pointer;
begin
  if assigned(psqlite3_function[98]) then
    Result := Tsqlite3_get_auxdata(psqlite3_function[98])(ctx, N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_initialize: Integer;
begin
  if assigned(psqlite3_function[99]) then
    Result := Tsqlite3_initialize(psqlite3_function[99])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_interrupt(db: PSQLite3);
begin
  if assigned(psqlite3_function[100]) then
    Tsqlite3_interrupt(psqlite3_function[100])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_keyword_check(const str: string; strlen: Integer): Integer;
begin
  if assigned(psqlite3_function[101]) then
    Result := Tsqlite3_keyword_check(psqlite3_function[101])
      (UTF8String(str), strlen)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_keyword_count: Integer;
begin
  if assigned(psqlite3_function[102]) then
    Result := Tsqlite3_keyword_count(psqlite3_function[102])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_keyword_name(N: Integer; out name: UTF8String;
  out strlen: Integer): Integer;
begin
  if assigned(psqlite3_function[103]) then
    Result := Tsqlite3_keyword_name(psqlite3_function[103])(N, name, strlen)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_last_insert_rowid(db: PSQLite3): Int64;
begin
  if assigned(psqlite3_function[104]) then
    Result := Tsqlite3_last_insert_rowid(psqlite3_function[104])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_libversion: PAnsiChar;
begin
  if assigned(psqlite3_function[105]) then
    Result := Tsqlite3_libversion(psqlite3_function[105])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_libversion_number: Integer;
begin
  if assigned(psqlite3_function[106]) then
    Result := Tsqlite3_libversion_number(psqlite3_function[106])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_limit(db: PSQLite3; id: Integer; newval: Integer): Integer;
begin
  if assigned(psqlite3_function[107]) then
    Result := Tsqlite3_limit(psqlite3_function[107])(db, id, newval)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_load_extension(db: PSQLite3; const zFile: string;
  const zProc: string; out errmsg: UTF8String): Integer;
begin
  if assigned(psqlite3_function[108]) then
    Result := Tsqlite3_load_extension(psqlite3_function[108])
      (db, UTF8String(zFile), UTF8String(zProc), errmsg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_malloc(bytes: Integer): Pointer;
begin
  if assigned(psqlite3_function[109]) then
    Result := Tsqlite3_malloc(psqlite3_function[109])(bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_malloc64(bytes: UInt64): Pointer;
begin
  if assigned(psqlite3_function[110]) then
    Result := Tsqlite3_malloc64(psqlite3_function[110])(bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_memory_highwater(resetFlag: Integer): Int64;
begin
  if assigned(psqlite3_function[111]) then
    Result := Tsqlite3_memory_highwater(psqlite3_function[111])(resetFlag)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_memory_used: Int64;
begin
  if assigned(psqlite3_function[112]) then
    Result := Tsqlite3_memory_used(psqlite3_function[112])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_msize(data: Pointer): UInt64;
begin
  if assigned(psqlite3_function[113]) then
    Result := Tsqlite3_msize(psqlite3_function[113])(data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_mutex_alloc(mutexType: Integer): Psqlite3_mutex;
begin
  if assigned(psqlite3_function[114]) then
    Result := Tsqlite3_mutex_alloc(psqlite3_function[114])(mutexType)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_mutex_enter(mutex: Psqlite3_mutex);
begin
  if assigned(psqlite3_function[115]) then
    Tsqlite3_mutex_enter(psqlite3_function[115])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_mutex_free(mutex: Psqlite3_mutex);
begin
  if assigned(psqlite3_function[116]) then
    Tsqlite3_mutex_free(psqlite3_function[116])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_mutex_held(mutex: Psqlite3_mutex): Integer;
begin
  if assigned(psqlite3_function[117]) then
    Result := Tsqlite3_mutex_held(psqlite3_function[117])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_mutex_leave(mutex: Psqlite3_mutex);
begin
  if assigned(psqlite3_function[118]) then
    Tsqlite3_mutex_leave(psqlite3_function[118])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_mutex_notheld(mutex: Psqlite3_mutex): Integer;
begin
  if assigned(psqlite3_function[119]) then
    Result := Tsqlite3_mutex_notheld(psqlite3_function[119])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_mutex_try(mutex: Psqlite3_mutex): Integer;
begin
  if assigned(psqlite3_function[120]) then
    Result := Tsqlite3_mutex_try(psqlite3_function[120])(mutex)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_next_stmt(db: PSQLite3; pStmt: Psqlite3_stmt): Psqlite3_stmt;
begin
  if assigned(psqlite3_function[121]) then
    Result := Tsqlite3_next_stmt(psqlite3_function[121])(db, pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_open(const filename: string; SQLite3: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[122]) then
    Result := Tsqlite3_open(psqlite3_function[122])
      (UTF8String(filename), SQLite3)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_open16(const filename: string; out SQLite3: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[123]) then
    Result := Tsqlite3_open16(psqlite3_function[123])(filename, SQLite3)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_open_v2(const filename: string; out SQLite3: PSQLite3;
  flags: Integer; const zVfs: PAnsiString): Integer;
begin
  if assigned(psqlite3_function[124]) then
    Result := Tsqlite3_open_v2(psqlite3_function[124])(UTF8String(filename),
      SQLite3, flags, zVfs)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_os_end: Integer;
begin
  if assigned(psqlite3_function[125]) then
    Result := Tsqlite3_os_end(psqlite3_function[125])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_os_init: Integer;
begin
  if assigned(psqlite3_function[126]) then
    Result := Tsqlite3_os_init(psqlite3_function[126])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_overload_function(db: PSQLite3; const zFuncName: string;
  nArg: Integer): Integer;
begin
  if assigned(psqlite3_function[127]) then
    Result := Tsqlite3_overload_function(psqlite3_function[127])
      (db, UTF8String(zFuncName), nArg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_prepare(db: PSQLite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[128]) then
    Result := Tsqlite3_prepare(psqlite3_function[128])(db, UTF8String(zSQL),
      nByte, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_prepare16(db: PSQLite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString): Integer;
begin
  if assigned(psqlite3_function[129]) then
    Result := Tsqlite3_prepare16(psqlite3_function[129])
      (db, zSQL, nByte, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_prepare16_v2(db: PSQLite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString): Integer;
begin
  if assigned(psqlite3_function[130]) then
    Result := Tsqlite3_prepare16_v2(psqlite3_function[130])
      (db, zSQL, nByte, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_prepare16_v3(db: PSQLite3; const zSQL: string; nByte: Integer;
  prepFlags: Cardinal; out ppStmt: Psqlite3_stmt;
  out pzTail: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[131]) then
    Result := Tsqlite3_prepare16_v3(psqlite3_function[131])
      (db, zSQL, nByte, prepFlags, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_prepare_v2(db: PSQLite3; const zSQL: string; nByte: Integer;
  out ppStmt: Psqlite3_stmt; out pzTail: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[132]) then
    Result := Tsqlite3_prepare_v2(psqlite3_function[132])
      (db, UTF8String(zSQL), nByte, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_prepare_v3(db: PSQLite3; const zSQL: string; nByte: Integer;
  prepFlags: Cardinal; out ppStmt: Psqlite3_stmt;
  out pzTail: PAnsiChar): Integer;
begin
  if assigned(psqlite3_function[133]) then
    Result := Tsqlite3_prepare_v3(psqlite3_function[133])
      (db, UTF8String(zSQL), nByte, prepFlags, ppStmt, pzTail)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_preupdate_count(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[134]) then
    Result := Tsqlite3_preupdate_count(psqlite3_function[134])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_preupdate_depth(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[135]) then
    Result := Tsqlite3_preupdate_depth(psqlite3_function[135])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_preupdate_hook(db: PSQLite3;
  xPreUpdate: TPreupdateHookCallback; pCtx: Pointer): Pointer;
begin
  if assigned(psqlite3_function[136]) then
    Result := Tsqlite3_preupdate_hook(psqlite3_function[136])
      (db, xPreUpdate, pCtx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_preupdate_new(db: PSQLite3; col: Integer;
  out value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[137]) then
    Result := Tsqlite3_preupdate_new(psqlite3_function[137])(db, col, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_preupdate_old(db: PSQLite3; col: Integer;
  out value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[138]) then
    Result := Tsqlite3_preupdate_old(psqlite3_function[138])(db, col, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_profile(db: PSQLite3; xProfile: TProfileCallback;
  UserData: Pointer): Pointer;
begin
  if assigned(psqlite3_function[139]) then
    Result := Tsqlite3_profile(psqlite3_function[139])(db, xProfile, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_progress_handler(db: PSQLite3; handler: TProgressCallback;
  UserData: Pointer);
begin
  if assigned(psqlite3_function[140]) then
    Tsqlite3_progress_handler(psqlite3_function[140])(db, handler, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_randomness(length: Integer; buffer: Pointer);
begin
  if assigned(psqlite3_function[141]) then
    Tsqlite3_randomness(psqlite3_function[141])(length, buffer)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_realloc(data: Pointer; bytes: Integer): Pointer;
begin
  if assigned(psqlite3_function[142]) then
    Result := Tsqlite3_realloc(psqlite3_function[142])(data, bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_realloc64(data: Pointer; bytes: UInt64): Pointer;
begin
  if assigned(psqlite3_function[143]) then
    Result := Tsqlite3_realloc64(psqlite3_function[143])(data, bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_release_memory(bytes: Integer): Integer;
begin
  if assigned(psqlite3_function[144]) then
    Result := Tsqlite3_release_memory(psqlite3_function[144])(bytes)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_reset(pStmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[145]) then
    Result := Tsqlite3_reset(psqlite3_function[145])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_reset_auto_extension;
begin
  if assigned(psqlite3_function[146]) then
    Tsqlite3_reset_auto_extension(psqlite3_function[146])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_blob(ctx: Psqlite3_context; blobData: Pointer;
  bytesLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[147]) then
    Tsqlite3_result_blob(psqlite3_function[147])(ctx, blobData, bytesLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_blob64(ctx: Psqlite3_context; blobData: Pointer;
  bytesLength: UInt64; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[148]) then
    Tsqlite3_result_blob64(psqlite3_function[148])(ctx, blobData, bytesLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_double(ctx: Psqlite3_context; data: Double);
begin
  if assigned(psqlite3_function[149]) then
    Tsqlite3_result_double(psqlite3_function[149])(ctx, data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_error(ctx: Psqlite3_context; const msg: string;
  msgLength: Integer);
begin
  if assigned(psqlite3_function[150]) then
    Tsqlite3_result_error(psqlite3_function[150])(ctx, UTF8String(msg),
      msgLength)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_error16(ctx: Psqlite3_context; const msg: string;
  msgLength: Integer);
begin
  if assigned(psqlite3_function[151]) then
    Tsqlite3_result_error16(psqlite3_function[151])(ctx, msg, msgLength)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_error_code(ctx: PSQLite3; errcode: Integer);
begin
  if assigned(psqlite3_function[152]) then
    Tsqlite3_result_error_code(psqlite3_function[152])(ctx, errcode)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_error_nomem(ctx: PSQLite3);
begin
  if assigned(psqlite3_function[153]) then
    Tsqlite3_result_error_nomem(psqlite3_function[153])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_error_toobig(ctx: PSQLite3);
begin
  if assigned(psqlite3_function[154]) then
    Tsqlite3_result_error_toobig(psqlite3_function[154])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_int(ctx: PSQLite3; data: Integer);
begin
  if assigned(psqlite3_function[155]) then
    Tsqlite3_result_int(psqlite3_function[155])(ctx, data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_int64(ctx: PSQLite3; data: Int64);
begin
  if assigned(psqlite3_function[156]) then
    Tsqlite3_result_int64(psqlite3_function[156])(ctx, data)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_null(ctx: PSQLite3);
begin
  if assigned(psqlite3_function[157]) then
    Tsqlite3_result_null(psqlite3_function[157])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_pointer(ctx: Psqlite3_context; data: Pointer;
  const datatype: string; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[158]) then
    Tsqlite3_result_pointer(psqlite3_function[158])
      (ctx, data, UTF8String(datatype), xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_subtype(ctx: Psqlite3_context; subtype: Cardinal);
begin
  if assigned(psqlite3_function[159]) then
    Tsqlite3_result_subtype(psqlite3_function[159])(ctx, subtype)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_text(ctx: Psqlite3_context; const data: string;
  msgLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[160]) then
    Tsqlite3_result_text(psqlite3_function[160])(ctx, UTF8String(data),
      msgLength, xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_text16(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[161]) then
    Tsqlite3_result_text16(psqlite3_function[161])(ctx, text, txtLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_text16be(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[162]) then
    Tsqlite3_result_text16be(psqlite3_function[162])(ctx, text, txtLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_text16le(ctx: Psqlite3_context; const text: string;
  txtLength: Integer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[163]) then
    Tsqlite3_result_text16le(psqlite3_function[163])(ctx, text, txtLength,
      xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_text64(ctx: Psqlite3_context; text: PAnsiChar;
  txtLength: UInt64; xDestructor: TSQLite3Destructor; encoding: Char);
begin
  if assigned(psqlite3_function[164]) then
    Tsqlite3_result_text64(psqlite3_function[164])(ctx, text, txtLength,
      xDestructor, encoding)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_value(ctx: Psqlite3_context; value: Psqlite3_value);
begin
  if assigned(psqlite3_function[165]) then
    Tsqlite3_result_value(psqlite3_function[165])(ctx, value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_zeroblob(ctx: Psqlite3_context; length: Integer);
begin
  if assigned(psqlite3_function[166]) then
    Tsqlite3_result_zeroblob(psqlite3_function[166])(ctx, length)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_result_zeroblob64(ctx: Psqlite3_context; length: UInt64);
begin
  if assigned(psqlite3_function[167]) then
    Tsqlite3_result_zeroblob64(psqlite3_function[167])(ctx, length)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_rollback_hook(db: PSQLite3;
  callback: TRollbackHookCallback): Pointer;
begin
  if assigned(psqlite3_function[168]) then
    Result := Tsqlite3_rollback_hook(psqlite3_function[168])(db, callback)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_serialize(db: PSQLite3; const zSchema: string; out size: Int64;
  flags: Cardinal): PAnsiChar;
begin
  if assigned(psqlite3_function[169]) then
    Result := Tsqlite3_serialize(psqlite3_function[169])
      (db, UTF8String(zSchema), size, flags)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_set_authorizer(db: PSQLite3; xAuth: TAuthorizationCallback;
  UserData: Pointer): Integer;
begin
  if assigned(psqlite3_function[170]) then
    Result := Tsqlite3_set_authorizer(psqlite3_function[170])
      (db, xAuth, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_set_auxdata(ctx: Psqlite3_context; N: Integer;
  metadata: Pointer; xDestructor: TSQLite3Destructor);
begin
  if assigned(psqlite3_function[171]) then
    Tsqlite3_set_auxdata(psqlite3_function[171])(ctx, N, metadata, xDestructor)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_set_last_insert_rowid(db: PSQLite3; rowid: Int64);
begin
  if assigned(psqlite3_function[172]) then
    Tsqlite3_set_last_insert_rowid(psqlite3_function[172])(db, rowid)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_shutdown: Integer;
begin
  if assigned(psqlite3_function[173]) then
    Result := Tsqlite3_shutdown(psqlite3_function[173])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_sleep(ms: Integer): Integer;
begin
  if assigned(psqlite3_function[174]) then
    Result := Tsqlite3_sleep(psqlite3_function[174])(ms)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_snapshot_cmp(p1: Psqlite3_snapshot;
  p2: Psqlite3_snapshot): Integer;
begin
  if assigned(psqlite3_function[175]) then
    Result := Tsqlite3_snapshot_cmp(psqlite3_function[175])(p1, p2)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_snapshot_free(snapshot: Psqlite3_snapshot);
begin
  if assigned(psqlite3_function[176]) then
    Tsqlite3_snapshot_free(psqlite3_function[176])(snapshot)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_snapshot_get(db: PSQLite3; const zSchema: string;
  out snapshot: Psqlite3_snapshot): Integer;
begin
  if assigned(psqlite3_function[177]) then
    Result := Tsqlite3_snapshot_get(psqlite3_function[177])
      (db, UTF8String(zSchema), snapshot)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_snapshot_open(db: PSQLite3; const zSchema: string;
  snapshot: Psqlite3_snapshot): Integer;
begin
  if assigned(psqlite3_function[178]) then
    Result := Tsqlite3_snapshot_open(psqlite3_function[178])
      (db, UTF8String(zSchema), snapshot)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_snapshot_recover(db: PSQLite3; const zDb: string): Integer;
begin
  if assigned(psqlite3_function[179]) then
    Result := Tsqlite3_snapshot_recover(psqlite3_function[179])
      (db, UTF8String(zDb))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_soft_heap_limit64(N: Int64): Int64;
begin
  if assigned(psqlite3_function[180]) then
    Result := Tsqlite3_soft_heap_limit64(psqlite3_function[180])(N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_sourceid: PAnsiChar;
begin
  if assigned(psqlite3_function[181]) then
    Result := Tsqlite3_sourceid(psqlite3_function[181])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_sql(pStmt: Psqlite3_stmt): PAnsiChar;
begin
  if assigned(psqlite3_function[182]) then
    Result := Tsqlite3_sql(psqlite3_function[182])(pStmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_status(op: Integer; out pCurrent: Integer;
  resetFlag: Integer): Integer;
begin
  if assigned(psqlite3_function[183]) then
    Result := Tsqlite3_status(psqlite3_function[183])(op, pCurrent, resetFlag)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_status64(op: Integer; out pCurrent: Int64;
  out pHighwater: Int64; resetFlag: Integer): Integer;
begin
  if assigned(psqlite3_function[184]) then
    Result := Tsqlite3_status64(psqlite3_function[184])
      (op, pCurrent, pHighwater, resetFlag)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_step(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[185]) then
    Result := Tsqlite3_step(psqlite3_function[185])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_stmt_busy(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[186]) then
    Result := Tsqlite3_stmt_busy(psqlite3_function[186])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_stmt_readonly(stmt: Psqlite3_stmt): Integer;
begin
  if assigned(psqlite3_function[187]) then
    Result := Tsqlite3_stmt_readonly(psqlite3_function[187])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_stmt_scanstatus(stmt: Psqlite3_stmt; idx: Integer;
  iScanStatusOp: Integer; pOut: Pointer): Integer;
begin
  if assigned(psqlite3_function[188]) then
    Result := Tsqlite3_stmt_scanstatus(psqlite3_function[188])
      (stmt, idx, iScanStatusOp, pOut)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_stmt_scanstatus_reset(stmt: Psqlite3_stmt);
begin
  if assigned(psqlite3_function[189]) then
    Tsqlite3_stmt_scanstatus_reset(psqlite3_function[189])(stmt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_stmt_status(stmt: Psqlite3_stmt; op: Integer;
  resetFlag: Integer): Integer;
begin
  if assigned(psqlite3_function[190]) then
    Result := Tsqlite3_stmt_status(psqlite3_function[190])(stmt, op, resetFlag)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_strglob(const zGlob: string; const zStr: string): Integer;
begin
  if assigned(psqlite3_function[191]) then
    Result := Tsqlite3_strglob(psqlite3_function[191])
      (UTF8String(zGlob), UTF8String(zStr))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_stricmp(const str1: string; const str2: string): Integer;
begin
  if assigned(psqlite3_function[192]) then
    Result := Tsqlite3_stricmp(psqlite3_function[192])
      (UTF8String(str1), UTF8String(str2))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_strnicmp(const str1: string; const str2: string;
  length: Integer): Integer;
begin
  if assigned(psqlite3_function[193]) then
    Result := Tsqlite3_strnicmp(psqlite3_function[193])
      (UTF8String(str1), UTF8String(str2), length)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_system_errno(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[194]) then
    Result := Tsqlite3_system_errno(psqlite3_function[194])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_table_column_metadata(db: PSQLite3; const zDbName: string;
  const zTableName: string; const zColumnName: string;
  out pzDataType: PAnsiChar; out pzCollSeq: PAnsiChar; out pNotNull: Integer;
  out pPrimaryKey: Integer; out pAutoinc: Integer): Integer;
begin
  if assigned(psqlite3_function[195]) then
    Result := Tsqlite3_table_column_metadata(psqlite3_function[195])
      (db, UTF8String(zDbName), UTF8String(zTableName), UTF8String(zColumnName),
      pzDataType, pzCollSeq, pNotNull, pPrimaryKey, pAutoinc)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_threadsafe: Integer;
begin
  if assigned(psqlite3_function[196]) then
    Result := Tsqlite3_threadsafe(psqlite3_function[196])()
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_total_changes(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[197]) then
    Result := Tsqlite3_total_changes(psqlite3_function[197])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_trace(db: PSQLite3; xTrace: TTraceCallback;
  UserData: Pointer): Pointer;
begin
  if assigned(psqlite3_function[198]) then
    Result := Tsqlite3_trace(psqlite3_function[198])(db, xTrace, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_trace_v2(db: PSQLite3; uMask: Cardinal;
  xCallback: TTraceV2Callback; pCtx: Pointer): Integer;
begin
  if assigned(psqlite3_function[199]) then
    Result := Tsqlite3_trace_v2(psqlite3_function[199])
      (db, uMask, xCallback, pCtx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_unlock_notify(pBlocked: PSQLite3; xNotify: TNotifyCallback;
  pNotifyArg: Pointer): Integer;
begin
  if assigned(psqlite3_function[200]) then
    Result := Tsqlite3_unlock_notify(psqlite3_function[200])
      (pBlocked, xNotify, pNotifyArg)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_update_hook(db: PSQLite3; updateCallback: TUpdateCallback;
  UserData: Pointer): Pointer;
begin
  if assigned(psqlite3_function[201]) then
    Result := Tsqlite3_update_hook(psqlite3_function[201])
      (db, updateCallback, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_uri_boolean(const zFilename: string; const zParam: string;
  bDefault: Integer): Integer;
begin
  if assigned(psqlite3_function[202]) then
    Result := Tsqlite3_uri_boolean(psqlite3_function[202])
      (UTF8String(zFilename), UTF8String(zParam), bDefault)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_uri_int64(const zFilename: string; const zParam: string;
  bDefault: Int64): Int64;
begin
  if assigned(psqlite3_function[203]) then
    Result := Tsqlite3_uri_int64(psqlite3_function[203])(UTF8String(zFilename),
      UTF8String(zParam), bDefault)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_uri_parameter(const zFilename: string; const zParam: string)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[204]) then
    Result := Tsqlite3_uri_parameter(psqlite3_function[204])
      (UTF8String(zFilename), UTF8String(zParam))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_user_data(ctx: Psqlite3_context): Pointer;
begin
  if assigned(psqlite3_function[205]) then
    Result := Tsqlite3_user_data(psqlite3_function[205])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_blob(value: Psqlite3_value): Pointer;
begin
  if assigned(psqlite3_function[206]) then
    Result := Tsqlite3_value_blob(psqlite3_function[206])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_bytes(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[207]) then
    Result := Tsqlite3_value_bytes(psqlite3_function[207])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_bytes16(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[208]) then
    Result := Tsqlite3_value_bytes16(psqlite3_function[208])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_double(value: Psqlite3_value): Double;
begin
  if assigned(psqlite3_function[209]) then
    Result := Tsqlite3_value_double(psqlite3_function[209])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_dup(const value: Psqlite3_value): Psqlite3_value;
begin
  if assigned(psqlite3_function[210]) then
    Result := Tsqlite3_value_dup(psqlite3_function[210])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

procedure sqlite3_value_free(value: Psqlite3_value);
begin
  if assigned(psqlite3_function[211]) then
    Tsqlite3_value_free(psqlite3_function[211])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_int(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[212]) then
    Result := Tsqlite3_value_int(psqlite3_function[212])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_int64(value: Psqlite3_value): Int64;
begin
  if assigned(psqlite3_function[213]) then
    Result := Tsqlite3_value_int64(psqlite3_function[213])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_nochange(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[214]) then
    Result := Tsqlite3_value_nochange(psqlite3_function[214])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_numeric_type(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[215]) then
    Result := Tsqlite3_value_numeric_type(psqlite3_function[215])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_pointer(value: Psqlite3_value;
  const name: string): Pointer;
begin
  if assigned(psqlite3_function[216]) then
    Result := Tsqlite3_value_pointer(psqlite3_function[216])
      (value, UTF8String(name))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_subtype(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[217]) then
    Result := Tsqlite3_value_subtype(psqlite3_function[217])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_text(value: Psqlite3_value): PAnsiChar;
begin
  if assigned(psqlite3_function[218]) then
    Result := Tsqlite3_value_text(psqlite3_function[218])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_text16(value: Psqlite3_value): PWideChar;
begin
  if assigned(psqlite3_function[219]) then
    Result := Tsqlite3_value_text16(psqlite3_function[219])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_text16be(value: Psqlite3_value): PWideChar;
begin
  if assigned(psqlite3_function[220]) then
    Result := Tsqlite3_value_text16be(psqlite3_function[220])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_text16le(value: Psqlite3_value): PWideChar;
begin
  if assigned(psqlite3_function[221]) then
    Result := Tsqlite3_value_text16le(psqlite3_function[221])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_value_type(value: Psqlite3_value): Integer;
begin
  if assigned(psqlite3_function[222]) then
    Result := Tsqlite3_value_type(psqlite3_function[222])(value)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vfs_find(const zVfsName: string): Psqlite3_vfs;
begin
  if assigned(psqlite3_function[223]) then
    Result := Tsqlite3_vfs_find(psqlite3_function[223])(UTF8String(zVfsName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vfs_register(const zVfsName: string;
  makeDflt: Integer): Integer;
begin
  if assigned(psqlite3_function[224]) then
    Result := Tsqlite3_vfs_register(psqlite3_function[224])
      (UTF8String(zVfsName), makeDflt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vfs_unregister(const zVfsName: string): Integer;
begin
  if assigned(psqlite3_function[225]) then
    Result := Tsqlite3_vfs_unregister(psqlite3_function[225])
      (UTF8String(zVfsName))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vtab_collation(info: Psqlite3_index_info; index: Integer)
  : PAnsiChar;
begin
  if assigned(psqlite3_function[226]) then
    Result := Tsqlite3_vtab_collation(psqlite3_function[226])(info, index)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vtab_nochange(ctx: Psqlite3_context): Integer;
begin
  if assigned(psqlite3_function[227]) then
    Result := Tsqlite3_vtab_nochange(psqlite3_function[227])(ctx)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_vtab_on_conflict(db: PSQLite3): Integer;
begin
  if assigned(psqlite3_function[228]) then
    Result := Tsqlite3_vtab_on_conflict(psqlite3_function[228])(db)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_wal_autocheckpoint(db: PSQLite3; N: Integer): Integer;
begin
  if assigned(psqlite3_function[229]) then
    Result := Tsqlite3_wal_autocheckpoint(psqlite3_function[229])(db, N)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_wal_checkpoint(db: PSQLite3; const zDb: string): Integer;
begin
  if assigned(psqlite3_function[230]) then
    Result := Tsqlite3_wal_checkpoint(psqlite3_function[230])
      (db, UTF8String(zDb))
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_wal_checkpoint_v2(db: PSQLite3; const zDb: string;
  eMode: Integer; out pnLog: Integer; out pnCkpt: Integer): Integer;
begin
  if assigned(psqlite3_function[231]) then
    Result := Tsqlite3_wal_checkpoint_v2(psqlite3_function[231])
      (db, UTF8String(zDb), eMode, pnLog, pnCkpt)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_wal_hook(db: PSQLite3; callback: TWALCallback;
  UserData: Pointer): Pointer;
begin
  if assigned(psqlite3_function[232]) then
    Result := Tsqlite3_wal_hook(psqlite3_function[232])(db, callback, UserData)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_win32_set_directory(dirType: Integer; zValue: Pointer)
  : Integer;
begin
  if assigned(psqlite3_function[233]) then
    Result := Tsqlite3_win32_set_directory(psqlite3_function[233])
      (dirType, zValue)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_win32_set_directory16(dirType: Integer;
  const zValue: string): Integer;
begin
  if assigned(psqlite3_function[234]) then
    Result := Tsqlite3_win32_set_directory16(psqlite3_function[234])
      (dirType, zValue)
  else
    raise ENotImplemented.Create(EXCPT_MSG);
end;

function sqlite3_win32_set_directory8(dirType: Integer;
  const zValue: string): Integer;
begin
  if assigned(psqlite3_function[235]) then
    Result := Tsqlite3_win32_set_directory8(psqlite3_function[235])
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
