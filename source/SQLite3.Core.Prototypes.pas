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

  *******************************************************

  TO DO:

  - Some prototypes not translated due to C-like open parameters
  - Most prototypes were not tested and may be wrong.

  ******************************************************* }

interface

uses
  SQLite3.Core.Objects;

type
  // Aggregate functions
  Tsqlite3_aggregate_context = function(context: Psqlite3_context;
    nBytes: integer): pointer; cdecl;

  // Automatically Load Statically Linked Extensions
  Tsqlite3_auto_extension = function(xEntryPoint: TxEntryPoint): integer;

  // Backup
  Tsqlite3_backup_init = function(pDest: Psqlite3; const zDestName: UTF8String;
    pSource: Psqlite3; const zSourceName: UTF8String): PSqlite3_backup; cdecl;
  Tsqlite3_backup_step = function(p: PSqlite3_backup; nPage: integer)
    : integer; cdecl;
  Tsqlite3_backup_finish = function(p: PSqlite3_backup): integer; cdecl;
  Tsqlite3_backup_remaining = function(p: PSqlite3_backup): integer; cdecl;
  Tsqlite3_backup_pagecount = function(p: PSqlite3_backup): integer; cdecl;

  // Parameter binding
  Tsqlite3_bind_blob = function(pStmt: Psqlite3_stmt; index: integer;
    value: pointer; nBytes: integer; pDestructor: TSQLite3Destructor)
    : integer; cdecl;
  Tsqlite3_bind_blob64 = function(pStmt: Psqlite3_stmt; index: integer;
    value: pointer; nBytes: uint64; pDestructor: TSQLite3Destructor)
    : integer; cdecl;
  Tsqlite3_bind_double = function(pStmt: Psqlite3_stmt; index: integer;
    value: double): integer; cdecl;
  Tsqlite3_bind_int = function(pStmt: Psqlite3_stmt; index: integer;
    value: integer): integer; cdecl;
  Tsqlite3_bind_int64 = function(pStmt: Psqlite3_stmt; index: integer;
    value: uint64): integer; cdecl;
  Tsqlite3_bind_null = function(pStmt: Psqlite3_stmt; index: integer)
    : integer; cdecl;
  Tsqlite3_bind_text = function(pStmt: Psqlite3_stmt; index: integer;
    const value: UTF8String; nBytes: integer; pDestructor: TSQLite3Destructor)
    : integer; cdecl;
  Tsqlite3_bind_text16 = function(pStmt: Psqlite3_stmt; index: integer;
    const value: UnicodeString; nBytes: integer;
    pDestructor: TSQLite3Destructor): integer; cdecl;
  Tsqlite3_bind_text64 = function(pStmt: Psqlite3_stmt; index: integer;
    const value: UnicodeString; nBytes: uint64; pDestructor: TSQLite3Destructor)
    : integer; cdecl;
  Tsqlite3_bind_value = function(pStmt: Psqlite3_stmt; index: integer;
    value: Psqlite3_value): integer; cdecl;
  Tsqlite3_bind_pointer = function(pStmt: Psqlite3_stmt; index: integer;
    value: pointer; const valueType: UTF8String;
    pDestructor: TSQLite3Destructor): integer; cdecl;
  Tsqlite3_bind_zeroblob = function(spStmt: Psqlite3_stmt; index: integer;
    nBytes: integer): integer; cdecl;
  Tsqlite3_bind_zeroblob64 = function(spStmt: Psqlite3_stmt; index: integer;
    nBytes: uint64): integer; cdecl;

  // SQL Parameters
  Tsqlite3_bind_parameter_count = function(pStmt: Psqlite3_stmt)
    : integer; cdecl;
  Tsqlite3_bind_parameter_index = function(pStmt: Psqlite3_stmt;
    const zName: UTF8String): integer; cdecl;
  Tsqlite3_bind_parameter_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;

  // Blob
  Tsqlite3_blob_bytes = function(pBlob: Psqlite3_blob): integer; cdecl;
  Tsqlite3_blob_close = function(pBlob: Psqlite3_blob): integer; cdecl;
  Tsqlite3_blob_open = function(db: Psqlite3; const zDb: UTF8String;
    const zTable: UTF8String; const zColumn: UTF8String; iRow: int64;
    flags: integer; out ppBlob: Psqlite3_blob): integer; cdecl;
  Tsqlite3_blob_read = function(pBlob: Psqlite3_blob; buffer: pointer;
    nBytes: integer; iOffset: integer): integer; cdecl;
  Tsqlite3_blob_reopen = function(pBlob: Psqlite3_blob; iRow: int64)
    : integer; cdecl;
  Tsqlite3_blob_write = function(pBlob: Psqlite3_blob; buffer: pointer;
    nBytes: integer; iOffset: integer): integer; cdecl;

  // Busy errors and timeouts
  Tsqlite3_busy_handler = function(db: Psqlite3; callback: TBusyHandlerCallback;
    p: pointer): integer; cdecl;
  Tsqlite3_busy_timeout = function(db: Psqlite3; ms: integer): integer; cdecl;

  // cancel auto extension
  Tsqlite3_cancel_auto_extension = function(xEntryPoint: TxEntryPoint)
    : integer; cdecl;

  // Count The Number Of Rows Modified
  Tsqlite3_changes = function(db: Psqlite3): integer; cdecl;

  // Reset All Bindings On A Prepared Statement
  Tsqlite3_clear_bindings = function(stmt: Psqlite3_stmt): integer; cdecl;

  // Close database
  Tsqlite3_close = function(db: Psqlite3): integer; cdecl;
  // for garbage collection languages
  Tsqlite3_close_v2 = function(db: Psqlite3): integer; cdecl;

  // Collation
  Tsqlite3_collation_needed = function(db: Psqlite3; p: pointer;
    callback: TCollationNeededCallback): integer; cdecl;
  Tsqlite3_collation_needed16 = function(db: Psqlite3; p: pointer;
    callback: TCollationNeeded16Callback): integer; cdecl;

  // Column info
  Tsqlite3_column_blob = function(stmt: Psqlite3_stmt; iCol: integer)
    : pointer; cdecl;
  Tsqlite3_column_double = function(stmt: Psqlite3_stmt; iCol: integer)
    : double; cdecl;
  Tsqlite3_column_int = function(stmt: Psqlite3_stmt; iCol: integer)
    : integer; cdecl;
  Tsqlite3_column_int64 = function(stmt: Psqlite3_stmt; iCol: integer)
    : int64; cdecl;
  Tsqlite3_column_text = function(stmt: Psqlite3_stmt; iCol: integer)
    : PUTF8Char; cdecl;
  Tsqlite3_column_text16 = function(stmt: Psqlite3_stmt; iCol: integer)
    : PWideChar; cdecl;
  Tsqlite3_column_value = function(stmt: Psqlite3_stmt; iCol: integer)
    : Psqlite3_value; cdecl;
  Tsqlite3_column_bytes = function(stmt: Psqlite3_stmt; iCol: integer)
    : integer; cdecl;
  Tsqlite3_column_bytes16 = function(stmt: Psqlite3_stmt; iCol: integer)
    : integer; cdecl;
  Tsqlite3_column_type = function(stmt: Psqlite3_stmt; iCol: integer)
    : integer; cdecl;

  // Number Of Columns In A Result Set
  Tsqlite3_column_count = function(pStmt: Psqlite3_stmt): integer; cdecl;

  // Source Of Data In A Query Result
  Tsqlite3_column_database_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  Tsqlite3_column_database_name16 = function(pStmt: Psqlite3_stmt;
    index: integer): PWideChar; cdecl;
  Tsqlite3_column_table_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  Tsqlite3_column_table_name16 = function(pStmt: Psqlite3_stmt; index: integer)
    : PWideChar; cdecl;
  Tsqlite3_column_origin_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  Tsqlite3_column_origin_name16 = function(pStmt: Psqlite3_stmt; index: integer)
    : PWideChar;

  // Declared Datatype Of A Query Result
  Tsqlite3_column_decltype = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  Tsqlite3_column_decltype16 = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;

  // Column Names In A Result Set
  Tsqlite3_column_name = function(pStmt: Psqlite3_stmt; index: integer)
    : PUTF8Char; cdecl;
  Tsqlite3_column_name16 = function(pStmt: Psqlite3_stmt; index: integer)
    : PWideChar; cdecl;

  // Commit And Rollback Notification Callbacks
  Tsqlite3_commit_hook = function(db: Psqlite3; callback: TCommitHookCallback)
    : pointer; cdecl;
  Tsqlite3_rollback_hook = function(db: Psqlite3;
    callback: TRollbackHookCallback): pointer; cdecl;

  // Run-Time Library Compilation Options Diagnostics
  Tsqlite3_compileoption_get = function(N: integer): PUTF8Char; cdecl;
  Tsqlite3_compileoption_used = function(const zOptName: UTF8String)
    : integer; cdecl;

  // Determine If An SQL Statement Is Complete
  Tsqlite3_complete = function(const sql: UTF8String): integer; cdecl;
  Tsqlite3_complete16 = function(const sql: UnicodeString): integer; cdecl;

  // Config = not translated
  // Tsqlite3_config

  // Get db handle from function
  Tsqlite3_context_db_handle = function(ctx: Psqlite3_context): Psqlite3; cdecl;

  // Define New Collating Sequences
  Tsqlite3_create_collation = function(db: Psqlite3; const name: UTF8String;
    eTextRep: integer; pArg: pointer; xCallback: TCollationFunctionCallback)
    : integer; cdecl;
  Tsqlite3_create_collation_v2 = function(db: Psqlite3; const name: UTF8String;
    eTextRep: integer; pArg: pointer; xCallback: TCollationFunctionCallback;
    xDestroy: TCollationDestroyCallback): integer; cdecl;
  Tsqlite3_create_collation16 = function(db: Psqlite3;
    const name: UnicodeString; eTextRep: integer; pArg: pointer;
    xCallback: TCollationFunctionCallback): integer; cdecl;

  // Create Or Redefine SQL Functions
  Tsqlite3_create_function = function(db: Psqlite3;
    const FunctionName: UTF8String; nArg, eTextRep: integer; pApp: pointer;
    xFunc, xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal)
    : integer; cdecl;
  Tsqlite3_create_function16 = function(db: Psqlite3;
    FunctionName: UnicodeString; nArg, eTextRep: integer; pApp: pointer;
    xFunc, xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal)
    : integer; cdecl;
  Tsqlite3_create_function_v2 = function(db: Psqlite3;
    const FunctionName: UTF8String; nArg, eTextRep: integer; pApp: pointer;
    xFunc, xStep: TSQLiteFunctionDef; xFinal: TSQLiteFunctionFinal;
    xDestroy: TSQLite3Destructor): integer; cdecl;
  Tsqlite3_create_window_function = function(db: Psqlite3;
    const FunctionName: UTF8String; nArg, eTextRep: integer; pApp: pointer;
    xStep: TSQLiteFunctionDef; xFinal, xValue: TSQLiteFunctionFinal;
    xInverse: TSQLiteFunctionDef; xDestroy: TSQLite3Destructor): integer; cdecl;

  // Register A Virtual Table Implementation
  Tsqlite3_create_module = function(db: Psqlite3; const zName: UTF8String;
    const p: Psqlite3_module; pClientData: pointer): integer; cdecl;
  Tsqlite3_create_module_v2 = function(db: Psqlite3; const zName: UTF8String;
    const p: Psqlite3_module; pClientData: pointer;
    xDestroy: TSQLite3Destructor): integer; cdecl;

  // Number of columns in a result set
  Tsqlite3_data_count = function(pStmt: Psqlite3_stmt): integer; cdecl;

  // Flush caches to disk mid-transaction
  Tsqlite3_db_cacheflush = function(db: Psqlite3): integer; cdecl;

  // Configure database connections
  // Tsqlite3_db_config = NOT translated

  // Return The Filename For A Database Connection
  Tsqlite3_db_filename = function(db: Psqlite3; const zDbName: UTF8String)
    : PUTF8Char; cdecl;

  // Find The Database Handle Of A Prepared Statement
  Tsqlite3_db_handle = function(stmt: Psqlite3_stmt): Psqlite3; cdecl;

  // Retrieve the mutex for a database connection
  Tsqlite3_db_mutex = function(db: Psqlite3): PSqlite3_mutex; cdecl;

  // Determine if a database is read-only
  Tsqlite3_db_readonly = function(db: Psqlite3; const zDbName: UTF8String)
    : integer; cdecl;

  // Free Memory Used By A Database Connection
  Tsqlite3_db_release_memory = function(db: Psqlite3): integer; cdecl;

  // Database Connection Status
  Tsqlite3_db_status = function(db: Psqlite3; op: integer; out pCur: integer;
    out pHiwtr: integer; resetFlg: integer): integer; cdecl;

  // Declare The Schema Of A Virtual Table
  Tsqlite3_declare_vtab = function(db: Psqlite3; const zSQL: UTF8String)
    : integer; cdecl;

  // Deserialize a database
  Tsqlite3_deserialize = function(db: Psqlite3; const zSchema: UTF8String;
    pData: PUTF8Char; szDb, szBuf: int64; mFlags: cardinal): integer; cdecl;

  // Enable Or Disable Extension Loading
  Tsqlite3_enable_load_extension = function(db: Psqlite3; onoff: integer)
    : integer; cdecl;

  // Enable Or Disable Shared Pager Cache
  Tsqlite3_enable_shared_cache = function(onoff: integer): integer; cdecl;

  // Error Codes And Messages
  Tsqlite3_errcode = function(db: Psqlite3): integer; cdecl;
  Tsqlite3_extended_errcode = function(db: Psqlite3): integer; cdecl;
  Tsqlite3_errmsg = function(db: Psqlite3): PUTF8Char; cdecl;
  Tsqlite3_errmsg16 = function(db: Psqlite3): PWideChar; cdecl;
  Tsqlite3_errstr = function(errcode: integer): PUTF8Char; cdecl;

  // One-Step Query Execution Interface
  Tsqlite3_exec = function(db: Psqlite3; const sql: UTF8String;
    callback: TSQLiteExecCallback; UserData: pointer; var errmsg: PUTF8Char)
    : integer; cdecl;

  // Retrieving Statement SQL
  Tsqlite3_sql = function(pStmt: Psqlite3_stmt): PUTF8Char; cdecl;
  Tsqlite3_expanded_sql = function(pStmt: Psqlite3_stmt): PUTF8Char; cdecl;

  // Enable Or Disable Extended Result Codes
  Tsqlite3_extended_result_codes = function(db: Psqlite3; onoff: integer)
    : integer; cdecl;

  // Low-Level Control Of Database Files
  Tsqlite3_file_control = function(db: Psqlite3; const zDbName: UTF8String;
    op: integer; UserData: pointer): integer; cdecl;

  // Destroy A Prepared Statement Object
  Tsqlite3_finalize = function(pStmt: Psqlite3_stmt): integer; cdecl;

  // Memory Allocation Subsystem
  Tsqlite3_malloc = function(bytes: integer): pointer; cdecl;
  Tsqlite3_malloc64 = function(bytes: uint64): pointer; cdecl;
  Tsqlite3_realloc = function(data: pointer; bytes: integer): pointer; cdecl;
  Tsqlite3_realloc64 = function(data: pointer; bytes: uint64): pointer; cdecl;
  Tsqlite3_free = procedure(data: pointer); cdecl;
  Tsqlite3_msize = function(data: pointer): uint64; cdecl;

  // Mutex Verification Routines
  Tsqlite3_mutex_held = function(mutex: PSqlite3_mutex): integer; cdecl;
  Tsqlite3_mutex_notheld = function(mutex: PSqlite3_mutex): integer; cdecl;

  // Convenience Routines For Running Queries
  // Tsqlite3_free_table = NOT Implemented (legacy)
  // Tsqlite3_get_table = NOT translated (legacy)

  // Test For Auto-Commit Mode
  Tsqlite3_get_autocommit = function(db: Psqlite3): integer; cdecl;

  // Function Auxiliary Data
  Tsqlite3_get_auxdata = function(ctx: Psqlite3_context; N: integer)
    : pointer; cdecl;
  Tsqlite3_set_auxdata = procedure(ctx: Psqlite3_context; N: integer;
    metadata: pointer; xDestructor: TSQLite3Destructor); cdecl;

  // Tsqlite3_get_table = NOT translated (legacy)

  // Initialize The SQLite Library
  Tsqlite3_initialize = function: integer; cdecl;
  Tsqlite3_shutdown = function: integer; cdecl;
  Tsqlite3_os_init = function: integer; cdecl;
  Tsqlite3_os_end = function: integer; cdecl;

  // Interrupt A Long-Running Query
  Tsqlite3_interrupt = procedure(db: Psqlite3); cdecl;

  // SQL Keyword Checking
  Tsqlite3_keyword_count = function: integer; cdecl;
  Tsqlite3_keyword_name = function(N: integer; out name: UTF8String;
    out strlen: integer): integer; cdecl;
  Tsqlite3_keyword_check = function(const str: UTF8String; strlen: integer)
    : integer; cdecl;

  // Last Insert Rowid
  Tsqlite3_last_insert_rowid = function(db: Psqlite3): int64; cdecl;

  // Run-Time Library Version Numbers
  Tsqlite3_libversion = function: PUTF8Char; cdecl;
  Tsqlite3_sourceid = function: PUTF8Char; cdecl;
  Tsqlite3_libversion_number = function: integer; cdecl;

  // Run-time Limits
  Tsqlite3_limit = function(db: Psqlite3; id, newval: integer): integer; cdecl;

  // Load An Extension
  Tsqlite3_load_extension = function(db: Psqlite3;
    const zFile, zProc: UTF8String; out errmsg: UTF8String): integer; cdecl;

  // Tsqlite3_log = NOT translated

  // Memory Allocator Statistics
  Tsqlite3_memory_used = function: int64; cdecl;
  Tsqlite3_memory_highwater = function(resetFlag: integer): int64; cdecl;

  // Formatted String Printing Functions = NOT translated

  // Mutexes
  Tsqlite3_mutex_alloc = function(mutexType: integer): PSqlite3_mutex; cdecl;
  Tsqlite3_mutex_free = procedure(mutex: PSqlite3_mutex); cdecl;
  Tsqlite3_mutex_enter = procedure(mutex: PSqlite3_mutex); cdecl;
  Tsqlite3_mutex_try = function(mutex: PSqlite3_mutex): integer; cdecl;
  Tsqlite3_mutex_leave = procedure(mutex: PSqlite3_mutex); cdecl;

  // Find the next prepared statement
  Tsqlite3_next_stmt = function(db: Psqlite3; pStmt: Psqlite3_stmt)
    : Psqlite3_stmt; cdecl;

  // Opening A New Database Connection
  Tsqlite3_open = function(const filename: UTF8String; SQLite3: Psqlite3)
    : integer; cdecl;
  Tsqlite3_open16 = function(const filename: UnicodeString;
    out SQLite3: Psqlite3): integer; cdecl;
  Tsqlite3_open_v2 = function(const filename: UTF8String; out SQLite3: Psqlite3;
    flags: integer; const zVfs: PAnsiString): integer; cdecl;

  // Overload A Function For A Virtual Table
  Tsqlite3_overload_function = function(db: Psqlite3;
    const zFuncName: UTF8String; nArg: integer): integer; cdecl;

  // Compiling An SQL Statement
  Tsqlite3_prepare = function(db: Psqlite3; const zSQL: UTF8String;
    nByte: integer; out ppStmt: Psqlite3_stmt; out pzTail: PUTF8Char)
    : integer; cdecl;
  Tsqlite3_prepare_v2 = function(db: Psqlite3; const zSQL: UTF8String;
    nByte: integer; out ppStmt: Psqlite3_stmt; out pzTail: PUTF8Char)
    : integer; cdecl;
  Tsqlite3_prepare_v3 = function(db: Psqlite3; const zSQL: UTF8String;
    nByte: integer; prepFlags: cardinal; out ppStmt: Psqlite3_stmt;
    out pzTail: PUTF8Char): integer; cdecl;
  Tsqlite3_prepare16 = function(db: Psqlite3; const zSQL: UnicodeString;
    nByte: integer; out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString)
    : integer; cdecl;
  Tsqlite3_prepare16_v2 = function(db: Psqlite3; const zSQL: UnicodeString;
    nByte: integer; out ppStmt: Psqlite3_stmt; out pzTail: PUnicodeString)
    : integer; cdecl;
  Tsqlite3_prepare16_v3 = function(db: Psqlite3; const zSQL: UnicodeString;
    nByte: integer; prepFlags: cardinal; out ppStmt: Psqlite3_stmt;
    out pzTail: PUTF8Char): integer; cdecl;

  // The pre-update hook
  Tsqlite3_preupdate_hook = function(db: Psqlite3;
    xPreUpdate: TPreupdateHookCallback; pCtx: pointer): pointer; cdecl;
  Tsqlite3_preupdate_old = function(db: Psqlite3; col: integer;
    out value: Psqlite3_value): integer; cdecl;
  Tsqlite3_preupdate_count = function(db: Psqlite3): integer; cdecl;
  Tsqlite3_preupdate_depth = function(db: Psqlite3): integer; cdecl;
  Tsqlite3_preupdate_new = function(db: Psqlite3; col: integer;
    out value: Psqlite3_value): integer; cdecl;

  // Tracing And Profiling Functions
  Tsqlite3_trace = function(db: Psqlite3; xTrace: TTraceCallback;
    UserData: pointer): pointer; cdecl;
  Tsqlite3_profile = function(db: Psqlite3; xProfile: TProfileCallback;
    UserData: pointer): pointer; cdecl;

  // Query Progress Callbacks
  Tsqlite3_progress_handler = procedure(db: Psqlite3;
    handler: TProgressCallback; UserData: pointer); cdecl;

  // Pseudo-Random Number Generator
  Tsqlite3_randomness = procedure(length: integer; buffer: pointer); cdecl;

  // Attempt To Free Heap Memory
  Tsqlite3_release_memory = function(bytes: integer): integer; cdecl;

  // Reset A Prepared Statement Object
  Tsqlite3_reset = function(pStmt: Psqlite3_stmt): integer; cdecl;

  // Reset Automatic Extension Loading
  Tsqlite3_reset_auto_extension = procedure; cdecl;

  // Setting The Result Of An SQL Function
  Tsqlite3_result_blob = procedure(ctx: Psqlite3_context; blobData: pointer;
    bytesLength: integer; xDestructor: TSQLite3Destructor); cdecl;
  Tsqlite3_result_blob64 = procedure(ctx: Psqlite3_context; blobData: pointer;
    bytesLength: uint64; xDestructor: TSQLite3Destructor); cdecl;
  Tsqlite3_result_double = procedure(ctx: Psqlite3_context;
    data: double); cdecl;
  Tsqlite3_result_error = procedure(ctx: Psqlite3_context;
    const msg: UTF8String; msgLength: integer); cdecl;
  Tsqlite3_result_error16 = procedure(ctx: Psqlite3_context;
    const msg: UnicodeString; msgLength: integer); cdecl;
  Tsqlite3_result_error_toobig = procedure(ctx: Psqlite3); cdecl;
  Tsqlite3_result_error_nomem = procedure(ctx: Psqlite3); cdecl;
  Tsqlite3_result_error_code = procedure(ctx: Psqlite3;
    errcode: integer); cdecl;
  Tsqlite3_result_int = procedure(ctx: Psqlite3; data: integer); cdecl;
  Tsqlite3_result_int64 = procedure(ctx: Psqlite3; data: int64); cdecl;
  Tsqlite3_result_null = procedure(ctx: Psqlite3); cdecl;
  Tsqlite3_result_text = procedure(ctx: Psqlite3_context;
    const data: UTF8String; msgLength: integer;
    xDestructor: TSQLite3Destructor); cdecl;
  Tsqlite3_result_text64 = procedure(ctx: Psqlite3_context; text: PUTF8Char;
    txtLength: uint64; xDestructor: TSQLite3Destructor; encoding: char); cdecl;
  Tsqlite3_result_text16 = procedure(ctx: Psqlite3_context;
    const text: UnicodeString; txtLength: integer;
    xDestructor: TSQLite3Destructor); cdecl;
  Tsqlite3_result_text16le = procedure(ctx: Psqlite3_context;
    const text: UnicodeString; txtLength: integer;
    xDestructor: TSQLite3Destructor); cdecl;
  Tsqlite3_result_text16be = procedure(ctx: Psqlite3_context;
    const text: UnicodeString; txtLength: integer;
    xDestructor: TSQLite3Destructor); cdecl;
  Tsqlite3_result_value = procedure(ctx: Psqlite3_context;
    value: Psqlite3_value); cdecl;
  Tsqlite3_result_pointer = procedure(ctx: Psqlite3_context; data: pointer;
    const datatype: UTF8String; xDestructor: TSQLite3Destructor); cdecl;
  Tsqlite3_result_zeroblob = procedure(ctx: Psqlite3_context;
    length: integer); cdecl;
  Tsqlite3_result_zeroblob64 = procedure(ctx: Psqlite3_context;
    length: uint64); cdecl;

  // Setting The Subtype Of An SQL Function
  Tsqlite3_result_subtype = procedure(ctx: Psqlite3_context;
    subtype: cardinal); cdecl;

  // Serialize a database
  Tsqlite3_serialize = function(db: Psqlite3; const zSchema: UTF8String;
    out size: int64; flags: cardinal): PUTF8Char; cdecl;

  // Compile-Time Authorization Callbacks
  Tsqlite3_set_authorizer = function(db: Psqlite3;
    xAuth: TAuthorizationCallback; UserData: pointer): integer; cdecl;

  // Set the Last Insert Rowid value
  Tsqlite3_set_last_insert_rowid = procedure(db: Psqlite3; rowid: int64); cdecl;

  // Suspend Execution For A Short Time
  Tsqlite3_sleep = function(ms: integer): integer; cdecl;

  // Compare the ages of two snapshot handles
  Tsqlite3_snapshot_cmp = function(p1, p2: Psqlite3_snapshot): integer; cdecl;

  // Destroy a snapshot
  Tsqlite3_snapshot_free = procedure(snapshot: Psqlite3_snapshot); cdecl;

  // Record A Database Snapshot
  Tsqlite3_snapshot_get = function(db: Psqlite3; const zSchema: UTF8String;
    out snapshot: Psqlite3_snapshot): integer; cdecl;

  // Start a read transaction on an historical snapshot
  Tsqlite3_snapshot_open = function(db: Psqlite3; const zSchema: UTF8String;
    snapshot: Psqlite3_snapshot): integer; cdecl;

  // Recover snapshots from a wal file
  Tsqlite3_snapshot_recover = function(db: Psqlite3; const zDb: UTF8String)
    : integer; cdecl;

  // Impose A Limit On Heap Size
  Tsqlite3_soft_heap_limit64 = function(N: int64): int64; cdecl;

  // SQLite Runtime Status
  Tsqlite3_status = function(op: integer; out pCurrent: integer;
    resetFlag: integer): integer; cdecl;
  Tsqlite3_status64 = function(op: integer; out pCurrent, pHighwater: int64;
    resetFlag: integer): integer; cdecl;

  // Evaluate An SQL Statement
  Tsqlite3_step = function(stmt: Psqlite3_stmt): integer; cdecl;

  // Determine If A Prepared Statement Has Been Reset
  Tsqlite3_stmt_busy = function(stmt: Psqlite3_stmt): integer; cdecl;

  // Determine If An SQL Statement Writes The Database
  Tsqlite3_stmt_readonly = function(stmt: Psqlite3_stmt): integer; cdecl;

  // Prepared Statement Scan Status
  Tsqlite3_stmt_scanstatus = function(stmt: Psqlite3_stmt;
    idx, iScanStatusOp: integer; pOut: pointer): integer; cdecl;

  // Zero Scan-Status Counters
  Tsqlite3_stmt_scanstatus_reset = procedure(stmt: Psqlite3_stmt); cdecl;

  // Prepared Statement Status
  Tsqlite3_stmt_status = function(stmt: Psqlite3_stmt; op: integer;
    resetFlag: integer): integer; cdecl;

  // Add Content To A Dynamic String = NOT translated

  // String Globbing
  Tsqlite3_strglob = function(const zGlob, zStr: UTF8String): integer; cdecl;

  // String Comparison
  Tsqlite3_stricmp = function(const str1, str2: UTF8String): integer; cdecl;
  Tsqlite3_strnicmp = function(const str1, str2: UTF8String; length: integer)
    : integer; cdecl;

  // Low-level system error code
  Tsqlite3_system_errno = function(db: Psqlite3): integer; cdecl;

  // Extract Metadata About A Column Of A Table
  Tsqlite3_table_column_metadata = function(db: Psqlite3;
    const zDbName: UTF8String; const zTableName: UTF8String;
    const zColumnName: UTF8String; out pzDataType: PUTF8Char;
    out pzCollSeq: PUTF8Char; out pNotNull: integer; out pPrimaryKey: integer;
    out pAutoinc: integer): integer; cdecl;

  // Testing Interface = NOT translated

  // Test To See If The Library Is Threadsafe
  Tsqlite3_threadsafe = function: integer; cdecl;

  // Total Number Of Rows Modified
  Tsqlite3_total_changes = function(db: Psqlite3): integer; cdecl;

  // SQL Trace Hook
  Tsqlite3_trace_v2 = function(db: Psqlite3; uMask: cardinal;
    xCallback: TTraceV2Callback; pCtx: pointer): integer; cdecl;

  // Unlock Notification
  Tsqlite3_unlock_notify = function(pBlocked: Psqlite3;
    xNotify: TNotifyCallback; pNotifyArg: pointer): integer; cdecl;

  // Data Change Notification Callbacks
  Tsqlite3_update_hook = function(db: Psqlite3; updateCallback: TUpdateCallback;
    UserData: pointer): pointer; cdecl;

  // Obtain Values For URI Parameters
  Tsqlite3_uri_parameter = function(const zFilename, zParam: UTF8String)
    : PUTF8Char; cdecl;
  Tsqlite3_uri_boolean = function(const zFilename, zParam: UTF8String;
    bDefault: integer): integer; cdecl;
  Tsqlite3_uri_int64 = function(const zFilename, zParam: UTF8String;
    bDefault: int64): int64; cdecl;

  // User Data For Functions
  Tsqlite3_user_data = function(ctx: Psqlite3_context): pointer; cdecl;

  // Obtaining SQL Values
  Tsqlite3_value_blob = function(value: Psqlite3_value): pointer; cdecl;
  Tsqlite3_value_double = function(value: Psqlite3_value): double; cdecl;
  Tsqlite3_value_int = function(value: Psqlite3_value): integer; cdecl;
  Tsqlite3_value_int64 = function(value: Psqlite3_value): int64; cdecl;
  Tsqlite3_value_pointer = function(value: Psqlite3_value;
    const name: UTF8String): pointer; cdecl;
  Tsqlite3_value_text = function(value: Psqlite3_value): PUTF8Char; cdecl;
  Tsqlite3_value_text16 = function(value: Psqlite3_value): PWideChar; cdecl;
  Tsqlite3_value_text16le = function(value: Psqlite3_value): PWideChar; cdecl;
  Tsqlite3_value_text16be = function(value: Psqlite3_value): PWideChar; cdecl;
  Tsqlite3_value_bytes = function(value: Psqlite3_value): integer; cdecl;
  Tsqlite3_value_bytes16 = function(value: Psqlite3_value): integer; cdecl;
  Tsqlite3_value_type = function(value: Psqlite3_value): integer; cdecl;
  Tsqlite3_value_numeric_type = function(value: Psqlite3_value): integer; cdecl;
  Tsqlite3_value_nochange = function(value: Psqlite3_value): integer; cdecl;

  // Copy And Free SQL Values
  Tsqlite3_value_dup = function(const value: Psqlite3_value)
    : Psqlite3_value; cdecl;
  Tsqlite3_value_free = procedure(value: Psqlite3_value); cdecl;

  // F inding The Subtype Of SQL Values
  Tsqlite3_value_subtype = function(value: Psqlite3_value): integer; cdecl;

  // Virtual File System Objects
  Tsqlite3_vfs_find = function(const zVfsName: UTF8String): Psqlite3_vfs; cdecl;

  Tsqlite3_vfs_register = function(const zVfsName: UTF8String;
    makeDflt: integer): integer; cdecl;
  Tsqlite3_vfs_unregister = function(const zVfsName: UTF8String)
    : integer; cdecl;

  // Determine The Collation For a Virtual Table Constraint
  Tsqlite3_vtab_collation = function(info: Psqlite3_index_info; index: integer)
    : PUTF8Char; cdecl;

  // Virtual Table Interface Configuration
  // Tsqlite3_vtab_config = NOT translated

  // Determine If Virtual Table Column Access Is For UPDATE
  Tsqlite3_vtab_nochange = function(ctx: Psqlite3_context): integer; cdecl;

  // Determine The Virtual Table Conflict Policy
  Tsqlite3_vtab_on_conflict = function(db: Psqlite3): integer; cdecl;

  // Configure an auto-checkpoint
  Tsqlite3_wal_autocheckpoint = function(db: Psqlite3; N: integer)
    : integer; cdecl;

  // Checkpoint a database
  Tsqlite3_wal_checkpoint = function(db: Psqlite3; const zDb: UTF8String)
    : integer; cdecl;
  Tsqlite3_wal_checkpoint_v2 = function(db: Psqlite3; const zDb: UTF8String;
    eMode: integer; out pnLog, pnCkpt: integer): integer; cdecl;

  // Write-Ahead Log Commit Hook
  Tsqlite3_wal_hook = function(db: Psqlite3; callback: TWALCallback;
    UserData: pointer): pointer; cdecl;

  // Win32 Specific Interface
  Tsqlite3_win32_set_directory = function(dirType: LongInt; zValue: pointer)
    : integer; cdecl;
  Tsqlite3_win32_set_directory8 = function(dirType: LongInt;
    const zValue: UTF8String): integer; cdecl;
  Tsqlite3_win32_set_directory16 = function(dirType: LongInt;
    const zValue: UnicodeString): integer; cdecl;

implementation

{ Sorted list of SQLite functions (except for deprecated ones)
  Version 3.25.1

  * means not translated

  ********************************************************

  sqlite3_aggregate_context
  sqlite3_auto_extension
  sqlite3_backup_finish
  sqlite3_backup_init
  sqlite3_backup_pagecount
  sqlite3_backup_remaining
  sqlite3_backup_step
  sqlite3_bind_blob
  sqlite3_bind_blob64
  sqlite3_bind_double
  sqlite3_bind_int
  sqlite3_bind_int64
  sqlite3_bind_null
  sqlite3_bind_parameter_count
  sqlite3_bind_parameter_index
  sqlite3_bind_parameter_name
  sqlite3_bind_pointer
  sqlite3_bind_text
  sqlite3_bind_text16
  sqlite3_bind_text64
  sqlite3_bind_value
  sqlite3_bind_zeroblob
  sqlite3_bind_zeroblob64
  sqlite3_blob_bytes
  sqlite3_blob_close
  sqlite3_blob_open
  sqlite3_blob_read
  sqlite3_blob_reopen
  sqlite3_blob_write
  sqlite3_busy_handler
  sqlite3_busy_timeout
  sqlite3_cancel_auto_extension
  sqlite3_changes
  sqlite3_clear_bindings
  sqlite3_close
  sqlite3_close_v2
  sqlite3_collation_needed
  sqlite3_collation_needed16
  sqlite3_column_blob
  sqlite3_column_bytes
  sqlite3_column_bytes16
  sqlite3_column_count
  sqlite3_column_database_name
  sqlite3_column_database_name16
  sqlite3_column_decltype
  sqlite3_column_decltype16
  sqlite3_column_double
  sqlite3_column_int
  sqlite3_column_int64
  sqlite3_column_name
  sqlite3_column_name16
  sqlite3_column_origin_name
  sqlite3_column_origin_name16
  sqlite3_column_table_name
  sqlite3_column_table_name16
  sqlite3_column_text
  sqlite3_column_text16
  sqlite3_column_type
  sqlite3_column_value
  sqlite3_commit_hook
  sqlite3_compileoption_get
  sqlite3_compileoption_used
  sqlite3_complete
  sqlite3_complete16
  *sqlite3_config
  sqlite3_context_db_handle
  sqlite3_create_collation
  sqlite3_create_collation16
  sqlite3_create_collation_v2
  sqlite3_create_function
  sqlite3_create_function16
  sqlite3_create_function_v2
  *sqlite3_create_module
  *sqlite3_create_module_v2
  sqlite3_create_window_function
  sqlite3_data_count
  sqlite3_db_cacheflush
  sqlite3_db_config
  sqlite3_db_filename
  sqlite3_db_handle
  sqlite3_db_mutex
  sqlite3_db_readonly
  sqlite3_db_release_memory
  sqlite3_db_status
  sqlite3_declare_vtab
  sqlite3_deserialize
  sqlite3_enable_load_extension
  sqlite3_enable_shared_cache
  sqlite3_errcode
  sqlite3_errmsg
  sqlite3_errmsg16
  sqlite3_errstr
  sqlite3_exec
  sqlite3_expanded_sql
  sqlite3_extended_errcode
  sqlite3_extended_result_codes
  sqlite3_file_control
  sqlite3_finalize
  sqlite3_free
  *sqlite3_free_table
  sqlite3_get_autocommit
  sqlite3_get_auxdata
  *sqlite3_get_table
  sqlite3_initialize
  sqlite3_interrupt
  sqlite3_keyword_check
  sqlite3_keyword_count
  sqlite3_keyword_name
  sqlite3_last_insert_rowid
  sqlite3_libversion
  sqlite3_libversion_number
  sqlite3_limit
  sqlite3_load_extension
  *sqlite3_log
  sqlite3_malloc
  sqlite3_malloc64
  sqlite3_memory_highwater
  sqlite3_memory_used
  *sqlite3_mprintf
  sqlite3_msize
  sqlite3_mutex_alloc
  sqlite3_mutex_enter
  sqlite3_mutex_free
  sqlite3_mutex_held
  sqlite3_mutex_leave
  sqlite3_mutex_notheld
  sqlite3_mutex_try
  sqlite3_next_stmt
  sqlite3_open
  sqlite3_open16
  sqlite3_open_v2
  sqlite3_os_end
  sqlite3_os_init
  sqlite3_overload_function
  sqlite3_prepare
  sqlite3_prepare16
  sqlite3_prepare16_v2
  sqlite3_prepare16_v3
  sqlite3_prepare_v2
  sqlite3_prepare_v3
  sqlite3_preupdate_count
  sqlite3_preupdate_depth
  sqlite3_preupdate_hook
  sqlite3_preupdate_new
  sqlite3_preupdate_old
  sqlite3_profile
  sqlite3_progress_handler
  sqlite3_randomness
  sqlite3_realloc
  sqlite3_realloc64
  sqlite3_release_memory
  sqlite3_reset
  sqlite3_reset_auto_extension
  sqlite3_result_blob
  sqlite3_result_blob64
  sqlite3_result_double
  sqlite3_result_error
  sqlite3_result_error16
  sqlite3_result_error_code
  sqlite3_result_error_nomem
  sqlite3_result_error_toobig
  sqlite3_result_int
  sqlite3_result_int64
  sqlite3_result_null
  sqlite3_result_pointer
  sqlite3_result_subtype
  sqlite3_result_text
  sqlite3_result_text16
  sqlite3_result_text16be
  sqlite3_result_text16le
  sqlite3_result_text64
  sqlite3_result_value
  sqlite3_result_zeroblob
  sqlite3_result_zeroblob64
  sqlite3_rollback_hook
  sqlite3_serialize
  sqlite3_set_authorizer
  sqlite3_set_auxdata
  sqlite3_set_last_insert_rowid
  sqlite3_shutdown
  sqlite3_sleep
  sqlite3_snapshot_cmp
  sqlite3_snapshot_free
  sqlite3_snapshot_get
  sqlite3_snapshot_open
  sqlite3_snapshot_recover
  sqlite3_snprintf
  sqlite3_soft_heap_limit64
  sqlite3_sourceid
  sqlite3_sql
  sqlite3_status
  sqlite3_status64
  sqlite3_step
  sqlite3_stmt_busy
  sqlite3_stmt_readonly
  sqlite3_stmt_scanstatus
  sqlite3_stmt_scanstatus_reset
  sqlite3_stmt_status
  *sqlite3_str_append
  *sqlite3_str_appendall
  *sqlite3_str_appendchar
  *sqlite3_str_appendf
  *sqlite3_str_errcode
  *sqlite3_str_finish
  *sqlite3_str_length
  *sqlite3_str_new
  *sqlite3_str_reset
  *sqlite3_str_value
  *sqlite3_str_vappendf
  sqlite3_strglob
  sqlite3_stricmp
  sqlite3_strlike
  sqlite3_strnicmp
  sqlite3_system_errno
  sqlite3_table_column_metadata
  sqlite3_test_control
  sqlite3_threadsafe
  sqlite3_total_changes
  sqlite3_trace
  sqlite3_trace_v2
  sqlite3_unlock_notify
  sqlite3_update_hook
  sqlite3_uri_boolean
  sqlite3_uri_int64
  sqlite3_uri_parameter
  sqlite3_user_data
  sqlite3_value_blob
  sqlite3_value_bytes
  sqlite3_value_bytes16
  sqlite3_value_double
  sqlite3_value_dup
  sqlite3_value_free
  sqlite3_value_int
  sqlite3_value_int64
  sqlite3_value_nochange
  sqlite3_value_numeric_type
  sqlite3_value_pointer
  sqlite3_value_subtype
  sqlite3_value_text
  sqlite3_value_text16
  sqlite3_value_text16be
  sqlite3_value_text16le
  sqlite3_value_type
  sqlite3_version
  sqlite3_vfs_find
  sqlite3_vfs_register
  sqlite3_vfs_unregister
  sqlite3_vmprintf
  sqlite3_vsnprintf
  sqlite3_vtab_collation
  sqlite3_vtab_config
  sqlite3_vtab_nochange
  sqlite3_vtab_on_conflict
  sqlite3_wal_autocheckpoint
  sqlite3_wal_checkpoint
  sqlite3_wal_checkpoint_v2
  sqlite3_wal_hook
  sqlite3_win32_set_directory
  sqlite3_win32_set_directory16
  sqlite3_win32_set_directory8

}

end.
