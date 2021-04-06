unit SQLite3.Core.Constants;
{ *******************************************************

  SQLite 3 Dynamic Library wrapper for Delphi

  2012 �ngel Fern�ndez Pineda. Madrid. Spain.

  This work is licensed under the Creative Commons
  Attribution-ShareAlike 3.0 Unported License. To
  view a copy of this license,
  visit http://creativecommons.org/licenses/by-sa/3.0/
  or send a letter to Creative Commons,
  444 Castro Street, Suite 900,
  Mountain View, California, 94041, USA.

  *******************************************************

  CHANGE LOG:

  - 2012-03-22: First implementation
  - 2019-09-19: Updated to SQLITE version 3.25.1 (2018)
  - 2021-04-06: Updated to SQLITE version 3.35.

  ******************************************************* }

interface

const
  // Result codes
  SQLITE_OK = 0; // Successful result
  SQLITE_ERROR = 1; // SQL error or missing database
  SQLITE_INTERNAL = 2; // An internal logic error in SQLite
  SQLITE_PERM = 3; // Access permission denied
  SQLITE_ABORT = 4; // Callback routine requested an abort
  SQLITE_BUSY = 5; // The database file is locked
  SQLITE_LOCKED = 6; // A table in the database is locked
  SQLITE_NOMEM = 7; // A malloc() failed
  SQLITE_READONLY = 8; // Attempt to write a readonly database
  SQLITE_INTERRUPT = 9; // Operation terminated by sqlite3_interrupt()
  SQLITE_IOERR = 10; // Some kind of disk I/O error occurred
  SQLITE_CORRUPT = 11; // The database disk image is malformed
  SQLITE_NOTFOUND = 12; // (Internal Only) Table or record not found
  SQLITE_FULL = 13; // Insertion failed because database is full
  SQLITE_CANTOPEN = 14; // Unable to open the database file
  SQLITE_PROTOCOL = 15; // Database lock protocol error
  SQLITE_EMPTY = 16; // Database is empty
  SQLITE_SCHEMA = 17; // The database schema changed
  SQLITE_TOOBIG = 18; // Too much data for one row of a table
  SQLITE_CONSTRAINT = 19; // Abort due to contraint violation
  SQLITE_MISMATCH = 20; // Data type mismatch
  SQLITE_MISUSE = 21; // Library used incorrectly
  SQLITE_NOLFS = 22; // Uses OS features not supported on host
  SQLITE_AUTH = 23; // Authorization denied
  SQLITE_FORMAT = 24; // Auxiliary database format error
  SQLITE_RANGE = 25; // 2nd parameter to sqlite3_bind out of range
  SQLITE_NOTADB = 26; // File opened that is not a database file
  SQLITE_NOTICE = 27; // Notifications from sqlite3_log()
  SQLITE_WARNING = 28; // Warnings from sqlite3_log()
  SQLITE_ROW = 100; // sqlite3_step() has another row ready
  SQLITE_DONE = 101; // sqlite3_step() has finished executing


  // CAPI3REF: Extended Result Codes

  SQLITE_ERROR_MISSING_COLLSEQ = (SQLITE_ERROR or (1 shl 8));
  SQLITE_ERROR_RETRY = (SQLITE_ERROR or (2 shl 8));
  SQLITE_ERROR_SNAPSHOT = (SQLITE_ERROR or (3 shl 8));
  SQLITE_IOERR_READ = (SQLITE_IOERR or (1 shl 8));
  SQLITE_IOERR_SHORT_READ = (SQLITE_IOERR or (2 shl 8));
  SQLITE_IOERR_WRITE = (SQLITE_IOERR or (3 shl 8));
  SQLITE_IOERR_FSYNC = (SQLITE_IOERR or (4 shl 8));
  SQLITE_IOERR_DIR_FSYNC = (SQLITE_IOERR or (5 shl 8));
  SQLITE_IOERR_TRUNCATE = (SQLITE_IOERR or (6 shl 8));
  SQLITE_IOERR_FSTAT = (SQLITE_IOERR or (7 shl 8));
  SQLITE_IOERR_UNLOCK = (SQLITE_IOERR or (8 shl 8));
  SQLITE_IOERR_RDLOCK = (SQLITE_IOERR or (9 shl 8));
  SQLITE_IOERR_DELETE = (SQLITE_IOERR or (10 shl 8));
  SQLITE_IOERR_BLOCKED = (SQLITE_IOERR or (11 shl 8));
  SQLITE_IOERR_NOMEM = (SQLITE_IOERR or (12 shl 8));
  SQLITE_IOERR_ACCESS = (SQLITE_IOERR or (13 shl 8));
  SQLITE_IOERR_CHECKRESERVEDLOCK = (SQLITE_IOERR or (14 shl 8));
  SQLITE_IOERR_LOCK = (SQLITE_IOERR or (15 shl 8));
  SQLITE_IOERR_CLOSE = (SQLITE_IOERR or (16 shl 8));
  SQLITE_IOERR_DIR_CLOSE = (SQLITE_IOERR or (17 shl 8));
  SQLITE_IOERR_SHMOPEN = (SQLITE_IOERR or (18 shl 8));
  SQLITE_IOERR_SHMSIZE = (SQLITE_IOERR or (19 shl 8));
  SQLITE_IOERR_SHMLOCK = (SQLITE_IOERR or (20 shl 8));
  SQLITE_IOERR_SHMMAP = (SQLITE_IOERR or (21 shl 8));
  SQLITE_IOERR_SEEK = (SQLITE_IOERR or (22 shl 8));
  SQLITE_IOERR_DELETE_NOENT = (SQLITE_IOERR or (23 shl 8));
  SQLITE_IOERR_MMAP = (SQLITE_IOERR or (24 shl 8));
  SQLITE_IOERR_GETTEMPPATH = (SQLITE_IOERR or (25 shl 8));
  SQLITE_IOERR_CONVPATH = (SQLITE_IOERR or (26 shl 8));
  SQLITE_IOERR_VNODE = (SQLITE_IOERR or (27 shl 8));
  SQLITE_IOERR_AUTH = (SQLITE_IOERR or (28 shl 8));
  SQLITE_IOERR_BEGIN_ATOMIC = (SQLITE_IOERR or (29 shl 8));
  SQLITE_IOERR_COMMIT_ATOMIC = (SQLITE_IOERR or (30 shl 8));
  SQLITE_IOERR_ROLLBACK_ATOMIC = (SQLITE_IOERR or (31 shl 8));
  SQLITE_IOERR_DATA = (SQLITE_IOERR or (32 shl 8));
  SQLITE_IOERR_CORRUPTFS = (SQLITE_IOERR or (33 shl 8));
  SQLITE_LOCKED_SHAREDCACHE = (SQLITE_LOCKED or (1 shl 8));
  SQLITE_LOCKED_VTAB = (SQLITE_LOCKED or (2 shl 8));
  SQLITE_BUSY_RECOVERY = (SQLITE_BUSY or (1 shl 8));
  SQLITE_BUSY_SNAPSHOT = (SQLITE_BUSY or (2 shl 8));
  SQLITE_BUSY_TIMEOUT = (SQLITE_BUSY or (3 shl 8));
  SQLITE_CANTOPEN_NOTEMPDIR = (SQLITE_CANTOPEN or (1 shl 8));
  SQLITE_CANTOPEN_ISDIR = (SQLITE_CANTOPEN or (2 shl 8));
  SQLITE_CANTOPEN_FULLPATH = (SQLITE_CANTOPEN or (3 shl 8));
  SQLITE_CANTOPEN_CONVPATH = (SQLITE_CANTOPEN or (4 shl 8));
  SQLITE_CANTOPEN_DIRTYWAL = (SQLITE_CANTOPEN or (5 shl 8)); // Not Used
  SQLITE_CANTOPEN_SYMLINK = (SQLITE_CANTOPEN or (6 shl 8));
  SQLITE_CORRUPT_VTAB = (SQLITE_CORRUPT or (1 shl 8));
  SQLITE_CORRUPT_SEQUENCE = (SQLITE_CORRUPT or (2 shl 8));
  SQLITE_CORRUPT_INDEX = (SQLITE_CORRUPT or (3 shl 8));
  SQLITE_READONLY_RECOVERY = (SQLITE_READONLY or (1 shl 8));
  SQLITE_READONLY_CANTLOCK = (SQLITE_READONLY or (2 shl 8));
  SQLITE_READONLY_ROLLBACK = (SQLITE_READONLY or (3 shl 8));
  SQLITE_READONLY_DBMOVED = (SQLITE_READONLY or (4 shl 8));
  SQLITE_READONLY_CANTINIT = (SQLITE_READONLY or (5 shl 8));
  SQLITE_READONLY_DIRECTORY = (SQLITE_READONLY or (6 shl 8));
  SQLITE_ABORT_ROLLBACK = (SQLITE_ABORT or (2 shl 8));
  SQLITE_CONSTRAINT_CHECK = (SQLITE_CONSTRAINT or (1 shl 8));
  SQLITE_CONSTRAINT_COMMITHOOK = (SQLITE_CONSTRAINT or (2 shl 8));
  SQLITE_CONSTRAINT_FOREIGNKEY = (SQLITE_CONSTRAINT or (3 shl 8));
  SQLITE_CONSTRAINT_FUNCTION = (SQLITE_CONSTRAINT or (4 shl 8));
  SQLITE_CONSTRAINT_NOTNULL = (SQLITE_CONSTRAINT or (5 shl 8));
  SQLITE_CONSTRAINT_PRIMARYKEY = (SQLITE_CONSTRAINT or (6 shl 8));
  SQLITE_CONSTRAINT_TRIGGER = (SQLITE_CONSTRAINT or (7 shl 8));
  SQLITE_CONSTRAINT_UNIQUE = (SQLITE_CONSTRAINT or (8 shl 8));
  SQLITE_CONSTRAINT_VTAB = (SQLITE_CONSTRAINT or (9 shl 8));
  SQLITE_CONSTRAINT_ROWID = (SQLITE_CONSTRAINT or (10 shl 8));
  SQLITE_CONSTRAINT_PINNED = (SQLITE_CONSTRAINT or (11 shl 8));
  SQLITE_NOTICE_RECOVER_WAL = (SQLITE_NOTICE or (1 shl 8));
  SQLITE_NOTICE_RECOVER_ROLLBACK = (SQLITE_NOTICE or (2 shl 8));
  SQLITE_WARNING_AUTOINDEX = (SQLITE_WARNING or (1 shl 8));
  SQLITE_AUTH_USER = (SQLITE_AUTH or (1 shl 8));
  SQLITE_OK_LOAD_PERMANENTLY = (SQLITE_OK or (1 shl 8));
  SQLITE_OK_SYMLINK = (SQLITE_OK or (2 shl 8));

  // CAPI3REF: Flags For File Open Operations

  SQLITE_OPEN_READONLY = $00000001; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_READWRITE = $00000002; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_CREATE = $00000004; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_DELETEONCLOSE = $00000008; // VFS only
  SQLITE_OPEN_EXCLUSIVE = $00000010; // VFS only
  SQLITE_OPEN_AUTOPROXY = $00000020; // VFS only
  SQLITE_OPEN_URI = $00000040; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_MEMORY = $00000080; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_MAIN_DB = $00000100; // VFS only
  SQLITE_OPEN_TEMP_DB = $00000200; // VFS only
  SQLITE_OPEN_TRANSIENT_DB = $00000400; // VFS only
  SQLITE_OPEN_MAIN_JOURNAL = $00000800; // VFS only
  SQLITE_OPEN_TEMP_JOURNAL = $00001000; // VFS only
  SQLITE_OPEN_SUBJOURNAL = $00002000; // VFS only
  SQLITE_OPEN_SUPER_JOURNAL = $00004000; // VFS only
  SQLITE_OPEN_NOMUTEX = $00008000; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_FULLMUTEX = $00010000; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_SHAREDCACHE = $00020000; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_PRIVATECACHE = $00040000; // Ok for sqlite3_open_v2()
  SQLITE_OPEN_WAL = $00080000; // VFS only
  SQLITE_OPEN_NOFOLLOW = $01000000; // Ok for sqlite3_open_v2()

  SQLITE_OPEN_MASTER_JOURNAL = $00004000; // VFS only

  // CAPI3REF: Device Characteristics

  SQLITE_IOCAP_ATOMIC = $00000001;
  SQLITE_IOCAP_ATOMIC512 = $00000002;
  SQLITE_IOCAP_ATOMIC1K = $00000004;
  SQLITE_IOCAP_ATOMIC2K = $00000008;
  SQLITE_IOCAP_ATOMIC4K = $00000010;
  SQLITE_IOCAP_ATOMIC8K = $00000020;
  SQLITE_IOCAP_ATOMIC16K = $00000040;
  SQLITE_IOCAP_ATOMIC32K = $00000080;
  SQLITE_IOCAP_ATOMIC64K = $00000100;
  SQLITE_IOCAP_SAFE_APPEND = $00000200;
  SQLITE_IOCAP_SEQUENTIAL = $00000400;
  SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN = $00000800;
  SQLITE_IOCAP_POWERSAFE_OVERWRITE = $00001000;
  SQLITE_IOCAP_IMMUTABLE = $00002000;
  SQLITE_IOCAP_BATCH_ATOMIC = $00004000;


  // CAPI3REF: File Locking Levels

  SQLITE_LOCK_NONE = 0;
  SQLITE_LOCK_SHARED = 1;
  SQLITE_LOCK_RESERVED = 2;
  SQLITE_LOCK_PENDING = 3;
  SQLITE_LOCK_EXCLUSIVE = 4;

  // CAPI3REF: Synchronization Type Flags

  SQLITE_SYNC_NORMAL = $00002;
  SQLITE_SYNC_FULL = $00003;
  SQLITE_SYNC_DATAONLY = $00010;

  // Flags for the xAccess VFS method
  SQLITE_ACCESS_EXISTS = 0;
  SQLITE_ACCESS_READWRITE = 1;
  SQLITE_ACCESS_READ = 2;

  // Authorizer Action Codes
  SQLITE_CREATE_INDEX = 1; // Index Name      Table Name
  SQLITE_CREATE_TABLE = 2; // Table Name      NULL
  SQLITE_CREATE_TEMP_INDEX = 3; // Index Name      Table Name
  SQLITE_CREATE_TEMP_TABLE = 4; // Table Name      NULL
  SQLITE_CREATE_TEMP_TRIGGER = 5; // Trigger Name    Table Name
  SQLITE_CREATE_TEMP_VIEW = 6; // View Name       NULL
  SQLITE_CREATE_TRIGGER = 7; // Trigger Name    Table Name
  SQLITE_CREATE_VIEW = 8; // View Name       NULL
  SQLITE_DELETE = 9; // Table Name      NULL
  SQLITE_DROP_INDEX = 10; // Index Name      Table Name
  SQLITE_DROP_TABLE = 11; // Table Name      NULL
  SQLITE_DROP_TEMP_INDEX = 12; // Index Name      Table Name
  SQLITE_DROP_TEMP_TABLE = 13; // Table Name      NULL
  SQLITE_DROP_TEMP_TRIGGER = 14; // Trigger Name    Table Name
  SQLITE_DROP_TEMP_VIEW = 15; // View Name       NULL
  SQLITE_DROP_TRIGGER = 16; // Trigger Name    Table Name
  SQLITE_DROP_VIEW = 17; // View Name       NULL
  SQLITE_INSERT = 18; // Table Name      NULL
  SQLITE_PRAGMA = 19; // Pragma Name     1st arg or NULL
  SQLITE_READ = 20; // Table Name      Column Name
  SQLITE_SELECT = 21; // NULL            NULL
  SQLITE_TRANSACTION = 22; // Operation       NULL
  SQLITE_UPDATE = 23; // Table Name      Column Name
  SQLITE_ATTACH = 24; // Filename        NULL
  SQLITE_DETACH = 25; // Database Name   NULL
  SQLITE_ALTER_TABLE = 26; // Database Name   Table Name
  SQLITE_REINDEX = 27; // Index Name      NULL
  SQLITE_ANALYZE = 28; // Table Name      NULL
  SQLITE_CREATE_VTABLE = 29; // Table Name      Module Name
  SQLITE_DROP_VTABLE = 30; // Table Name      Module Name
  SQLITE_FUNCTION = 31; // NULL            Function Name
  SQLITE_SAVEPOINT = 32; // Operation       Savepoint Name
  SQLITE_COPY = 0; // No longer used
  SQLITE_RECURSIVE = 33; // NULL            NULL

  // Fundamental Data types
  SQLITE_INTEGER = 1;
  SQLITE_FLOAT = 2;
  SQLITE_TEXT = 3;
  SQLITE_BLOB = 4;
  SQLITE_NULL = 5;

  // Text encodings
  SQLITE_UTF8 = 1;
  SQLITE_UTF16 = 2;
  SQLITE_UTF16BE = 3;
  SQLITE_UTF16LE = 4;
  SQLITE_ANY = 5;
  SQLITE_UTF16_ALIGNED = 8; // sqlite3_create_collation only

  // Constants Defining Special Destructor Behavior
  SQLITE_STATIC = Pointer(0);
  SQLITE_TRANSIENT = Pointer(-1);

  // Checkpoint operation parameters
  SQLITE_CHECKPOINT_PASSIVE = 0; // Do as much as possible w/o blocking
  SQLITE_CHECKPOINT_FULL = 1; // Wait for writers, then checkpoint
  SQLITE_CHECKPOINT_RESTART = 2; // Like FULL but wait for for readers
  SQLITE_CHECKPOINT_TRUNCATE = 3; // Like RESTART but also truncate WAL

  // Configuration options
  SQLITE_CONFIG_SINGLETHREAD = 1; // nil
  SQLITE_CONFIG_MULTITHREAD = 2; // nil
  SQLITE_CONFIG_SERIALIZED = 3; // nil
  SQLITE_CONFIG_MALLOC = 4; // sqlite3_mem_methods*
  SQLITE_CONFIG_GETMALLOC = 5; // sqlite3_mem_methods*
  SQLITE_CONFIG_SCRATCH = 6; // No longer used
  SQLITE_CONFIG_PAGECACHE = 7; // void*, int sz, int N
  SQLITE_CONFIG_HEAP = 8; // void*, int nByte, int min
  SQLITE_CONFIG_MEMSTATUS = 9; // boolean
  SQLITE_CONFIG_MUTEX = 10; // sqlite3_mutex_methods*
  SQLITE_CONFIG_GETMUTEX = 11; // sqlite3_mutex_methods*
  // previously SQLITE_CONFIG_CHUNKALLOC = 12 which is now unused.
  SQLITE_CONFIG_LOOKASIDE = 13; // int int
  SQLITE_CONFIG_PCACHE = 14; // no-op
  SQLITE_CONFIG_GETPCACHE = 15; // no-op
  SQLITE_CONFIG_LOG = 16; // xFunc, void*
  SQLITE_CONFIG_URI = 17; // int
  SQLITE_CONFIG_PCACHE2 = 18; // sqlite3_pcache_methods2*
  SQLITE_CONFIG_GETPCACHE2 = 19; // sqlite3_pcache_methods2*
  SQLITE_CONFIG_COVERING_INDEX_SCAN = 20; // int
  SQLITE_CONFIG_SQLLOG = 21; // xSqllog, void*
  SQLITE_CONFIG_MMAP_SIZE = 22; // sqlite3_int64, sqlite3_int64
  SQLITE_CONFIG_WIN32_HEAPSIZE = 23; // int nByte
  SQLITE_CONFIG_PCACHE_HDRSZ = 24; // int *psz
  SQLITE_CONFIG_PMASZ = 25; // unsigned int szPma
  SQLITE_CONFIG_STMTJRNL_SPILL = 26; // int nByte
  SQLITE_CONFIG_SMALL_MALLOC = 27; // boolean
  SQLITE_CONFIG_SORTERREF_SIZE = 28; // int nByte

  // Status Parameters for database connections
  SQLITE_DBSTATUS_LOOKASIDE_USED = 0;
  SQLITE_DBSTATUS_CACHE_USED = 1;
  SQLITE_DBSTATUS_SCHEMA_USED = 2;
  SQLITE_DBSTATUS_STMT_USED = 3;
  SQLITE_DBSTATUS_LOOKASIDE_HIT = 4;
  SQLITE_DBSTATUS_LOOKASIDE_MISS_SIZE = 5;
  SQLITE_DBSTATUS_LOOKASIDE_MISS_FULL = 6;
  SQLITE_DBSTATUS_CACHE_HIT = 7;
  SQLITE_DBSTATUS_CACHE_MISS = 8;
  SQLITE_DBSTATUS_CACHE_WRITE = 9;
  SQLITE_DBSTATUS_DEFERRED_FKS = 10;
  SQLITE_DBSTATUS_CACHE_USED_SHARED = 11;
  SQLITE_DBSTATUS_CACHE_SPILL = 12;
  SQLITE_DBSTATUS_MAX = 12;

  // Standard File Control Opcodes
  SQLITE_FCNTL_LOCKSTATE = 1;
  SQLITE_GET_LOCKPROXYFILE = 2;
  SQLITE_SET_LOCKPROXYFILE = 3;
  SQLITE_LAST_ERRNO = 4;
  SQLITE_FCNTL_SIZE_HINT = 5;
  SQLITE_FCNTL_CHUNK_SIZE = 6;
  SQLITE_FCNTL_FILE_POINTER = 7;
  SQLITE_FCNTL_SYNC_OMITTED = 8;
  SQLITE_FCNTL_WIN32_AV_RETRY = 9;
  SQLITE_FCNTL_PERSIST_WAL = 10;
  SQLITE_FCNTL_OVERWRITE = 11;
  SQLITE_FCNTL_VFSNAME = 12;
  SQLITE_FCNTL_POWERSAFE_OVERWRITE = 13;
  SQLITE_FCNTL_PRAGMA = 14;
  SQLITE_FCNTL_BUSYHANDLER = 15;
  SQLITE_FCNTL_TEMPFILENAME = 16;
  SQLITE_FCNTL_MMAP_SIZE = 18;
  SQLITE_FCNTL_TRACE = 19;
  SQLITE_FCNTL_HAS_MOVED = 20;
  SQLITE_FCNTL_SYNC = 21;
  SQLITE_FCNTL_COMMIT_PHASETWO = 22;
  SQLITE_FCNTL_WIN32_SET_HANDLE = 23;
  SQLITE_FCNTL_WAL_BLOCK = 24;
  SQLITE_FCNTL_ZIPVFS = 25;
  SQLITE_FCNTL_RBU = 26;
  SQLITE_FCNTL_VFS_POINTER = 27;
  SQLITE_FCNTL_JOURNAL_POINTER = 28;
  SQLITE_FCNTL_WIN32_GET_HANDLE = 29;
  SQLITE_FCNTL_PDB = 30;
  SQLITE_FCNTL_BEGIN_ATOMIC_WRITE = 31;
  SQLITE_FCNTL_COMMIT_ATOMIC_WRITE = 32;
  SQLITE_FCNTL_ROLLBACK_ATOMIC_WRITE = 33;
  SQLITE_FCNTL_LOCK_TIMEOUT = 34;
  SQLITE_FCNTL_DATA_VERSION = 35;

  // Authorizer Return Codes
  SQLITE_DENY = 1;
  SQLITE_IGNORE = 2;

  // Virtual Table Constraint Operator Codes
  SQLITE_INDEX_CONSTRAINT_EQ = 2;
  SQLITE_INDEX_CONSTRAINT_GT = 4;
  SQLITE_INDEX_CONSTRAINT_LE = 8;
  SQLITE_INDEX_CONSTRAINT_LT = 16;
  SQLITE_INDEX_CONSTRAINT_GE = 32;
  SQLITE_INDEX_CONSTRAINT_MATCH = 64;
  SQLITE_INDEX_CONSTRAINT_LIKE = 65;
  SQLITE_INDEX_CONSTRAINT_GLOB = 66;
  SQLITE_INDEX_CONSTRAINT_REGEXP = 67;
  SQLITE_INDEX_CONSTRAINT_NE = 68;
  SQLITE_INDEX_CONSTRAINT_ISNOT = 69;
  SQLITE_INDEX_CONSTRAINT_ISNOTNULL = 70;
  SQLITE_INDEX_CONSTRAINT_ISNULL = 71;
  SQLITE_INDEX_CONSTRAINT_IS = 72;
  SQLITE_INDEX_CONSTRAINT_FUNCTION = 150;

  // Run-Time Limit Categories
  SQLITE_LIMIT_LENGTH = 0;
  SQLITE_LIMIT_SQL_LENGTH = 1;
  SQLITE_LIMIT_COLUMN = 2;
  SQLITE_LIMIT_EXPR_DEPTH = 3;
  SQLITE_LIMIT_COMPOUND_SELECT = 4;
  SQLITE_LIMIT_VDBE_OP = 5;
  SQLITE_LIMIT_FUNCTION_ARG = 6;
  SQLITE_LIMIT_ATTACHED = 7;
  SQLITE_LIMIT_LIKE_PATTERN_LENGTH = 8;
  SQLITE_LIMIT_VARIABLE_NUMBER = 9;
  SQLITE_LIMIT_TRIGGER_DEPTH = 10;
  SQLITE_LIMIT_WORKER_THREADS = 11;

  // Mutex Types
  SQLITE_MUTEX_FAST = 0;
  SQLITE_MUTEX_RECURSIVE = 1;
  SQLITE_MUTEX_STATIC_MASTER = 2;
  SQLITE_MUTEX_STATIC_MEM = 3; // sqlite3_malloc()
  SQLITE_MUTEX_STATIC_MEM2 = 4; // NOT USED
  SQLITE_MUTEX_STATIC_OPEN = 4; // sqlite3BtreeOpen()
  SQLITE_MUTEX_STATIC_PRNG = 5; // sqlite3_randomness()
  SQLITE_MUTEX_STATIC_LRU = 6; // ru page list
  SQLITE_MUTEX_STATIC_LRU2 = 7; // NOT USED
  SQLITE_MUTEX_STATIC_PMEM = 7; // sqlite3PageMalloc()
  SQLITE_MUTEX_STATIC_APP1 = 8; // For use by application
  SQLITE_MUTEX_STATIC_APP2 = 9; // For use by application
  SQLITE_MUTEX_STATIC_APP3 = 10; // For use by application
  SQLITE_MUTEX_STATIC_VFS1 = 11; // For use by built-in VFS
  SQLITE_MUTEX_STATIC_VFS2 = 12; // For use by extension VFS
  SQLITE_MUTEX_STATIC_VFS3 = 13; // For use by application VFS

  // Flags for the xShmLock VFS method
  SQLITE_SHM_UNLOCK = 1;
  SQLITE_SHM_LOCK = 2;
  SQLITE_SHM_SHARED = 4;
  SQLITE_SHM_EXCLUSIVE = 8;

  // Status Parameters
  SQLITE_STATUS_MEMORY_USED = 0;
  SQLITE_STATUS_PAGECACHE_USED = 1;
  SQLITE_STATUS_PAGECACHE_OVERFLOW = 2;
  SQLITE_STATUS_SCRATCH_USED = 3; // NOT USED
  SQLITE_STATUS_SCRATCH_OVERFLOW = 4; // NOT USED
  SQLITE_STATUS_MALLOC_SIZE = 5;
  SQLITE_STATUS_PARSER_STACK = 6;
  SQLITE_STATUS_PAGECACHE_SIZE = 7;
  SQLITE_STATUS_SCRATCH_SIZE = 8; // NOT USED
  SQLITE_STATUS_MALLOC_COUNT = 9;

  // Status Parameters for prepared statements
  SQLITE_STMTSTATUS_FULLSCAN_STEP = 1;
  SQLITE_STMTSTATUS_SORT = 2;
  SQLITE_STMTSTATUS_AUTOINDEX = 3;
  SQLITE_STMTSTATUS_VM_STEP = 4;
  SQLITE_STMTSTATUS_REPREPARE = 5;
  SQLITE_STMTSTATUS_RUN = 6;
  SQLITE_STMTSTATUS_MEMUSED = 99;

  // Testing Interface Operation Codes
  SQLITE_TESTCTRL_FIRST = 5;
  SQLITE_TESTCTRL_PRNG_SAVE = 5;
  SQLITE_TESTCTRL_PRNG_RESTORE = 6;
  SQLITE_TESTCTRL_PRNG_RESET = 7;
  SQLITE_TESTCTRL_BITVEC_TEST = 8;
  SQLITE_TESTCTRL_FAULT_INSTALL = 9;
  SQLITE_TESTCTRL_BENIGN_MALLOC_HOOKS = 10;
  SQLITE_TESTCTRL_PENDING_BYTE = 11;
  SQLITE_TESTCTRL_ASSERT = 12;
  SQLITE_TESTCTRL_ALWAYS = 13;
  SQLITE_TESTCTRL_RESERVE = 14;
  SQLITE_TESTCTRL_OPTIMIZATIONS = 15;
  SQLITE_TESTCTRL_ISKEYWORD = 16; // NOT USED
  SQLITE_TESTCTRL_PGHDRSZ = 17; // NOT USED
  SQLITE_TESTCTRL_SCRATCHMALLOC = 18;
  SQLITE_TESTCTRL_ONCE_RESET_THRESHOLD = 19;
  SQLITE_TESTCTRL_NEVER_CORRUPT = 20;
  SQLITE_TESTCTRL_VDBE_COVERAGE = 21;
  SQLITE_TESTCTRL_BYTEORDER = 22;
  SQLITE_TESTCTRL_ISINIT = 23;
  SQLITE_TESTCTRL_SORTER_MMAP = 24;
  SQLITE_TESTCTRL_IMPOSTER = 25;
  SQLITE_TESTCTRL_PARSER_COVERAGE = 26;
  SQLITE_TESTCTRL_LOCALTIME_FAULT = 19; // NOT USED
  SQLITE_TESTCTRL_LAST = 26; // Largest TESTCTRL

  // Virtual Table Configuration Options
  SQLITE_VTAB_CONSTRAINT_SUPPORT = 1;

  // sqlite3_win32_set_directory
  SQLITE_WIN32_DATA_DIRECTORY_TYPE = 1;
  SQLITE_WIN32_TEMP_DIRECTORY_TYPE = 2;

implementation

end.
