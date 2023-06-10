program SQLite3CodeGen;
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

  Generates code from sqlite3 prototypes to be included
  at SQLite3.Core.Functions

  *******************************************************

  CHANGE LOG:

  - 2018-09-224: First implementation

  - 2021-04-06: Updated to SQLITE version 3.35.

  - 2021-05-10: Fixed minor bug at "ENotImplemented"
  exception raising

  - 2023-06-03: Updated to SQLITE version 3.42.

  ******************************************************* }
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.RTTI,
  System.StrUtils,
  System.TypInfo,
  System.Generics.Collections,
  SQLite3.Core.Objects in '..\source\SQLite3.Core.Objects.pas',
  SQLite3.Core.Prototypes in '..\source\SQLITE3.Core.Prototypes.pas';

const
  PROC_ARRAY = 'psqlite3_function';
  NAMES_ARRAY = 'sqlite3_fname';
  REASON_DEPRECATED = 'deprecated';
  REASON_OPEN_PARAM = 'open parameters';
  REASON_OPTIONAL = 'compile-time optional';

var
  // Note: global variables
  LContext: TRttiContext;
  headers, bodies, procNames: TList<String>;

procedure GenCode(t: Pointer);
var
  LType: TRttiProcedureType;
  header, body, aux, procName, call: string;
  params: TArray<TRttiParameter>;
  varFlag: boolean;
  i: integer;
  counter: integer;
begin
  LType := TRttiProcedureType(LContext.GetType(t));
  counter := headers.Count;
  if (Assigned(LType.ReturnType)) then
  begin
    header := 'function ';
    call := 'Result := ';
  end
  else
  begin
    header := 'procedure ';
    call := '';
  end;
  procName := RightStr(LType.Name, Length(LType.Name) - 1);
  header := header + procName;
  call := call + Format('%s(%s[%d])', [LType.Name, PROC_ARRAY, counter]);
  params := LType.GetParameters;
  if (Assigned(params)) then
  begin
    header := header + '(';
    call := call + '(';
    for i := low(params) to high(params) do
    begin
      if (TParamFlag.pfConst in params[i].Flags) then
        header := header + 'const ';
      if (TParamFlag.pfVar in params[i].Flags) then
        header := header + 'var ';
      if (TParamFlag.pfOut in params[i].Flags) then
        header := header + 'out ';
      varFlag := (TParamFlag.pfVar in params[i].Flags) or
        (TParamFlag.pfOut in params[i].Flags);
      if (CompareText(params[i].ParamType.Name, 'UTF8string') = 0) and
        (not varFlag) then
      begin
        aux := 'string';
        call := call + 'UTF8String(' + params[i].Name + ')';
      end
      else
      begin
        aux := params[i].ParamType.Name;
        call := call + params[i].Name;
      end;
      header := header + params[i].Name + ':' + aux;

      if (i < high(params)) then
      begin
        header := header + ';';
        call := call + ',';
      end;
    end;
    header := header + ')';
    call := call + ')';
  end
  else
    call := call + '()';
  if (Assigned(LType.ReturnType)) then
    header := header + ':' + LType.ReturnType.ToString;
  header := header + ';';

  body := Format('begin if assigned(%s[%d]) then %s else ' +
    'raise ENotImplemented.Create(EXCPT_MSG); end;',
    [PROC_ARRAY, counter, call]);
  procNames.Add(procName);
  headers.Add(header);
  bodies.Add(body);
  // WriteLn(header);
  // WriteLn(body);
end;

procedure NoGenCode(const t,reason: string);
begin
  // This procedure does nothing useful on purpose.
  // Used to document SQLite functions not translated
  // due to whatever reason. It Makes easier future work.
  WriteLn(Format('  // %s not translated (%s)', [t,reason]));
end;

procedure DumpItfSection;
var
  i: integer;
begin
  WriteLn('// machine-generated code for interface section');
  WriteLn;
  for i := 0 to headers.Count - 1 do
  begin
    WriteLn(headers.Items[i]);
  end;
end;

procedure DumpImplSection;
var
  i: integer;
begin
  WriteLn('// machine-generated code for implementation section');
  WriteLn;
  WriteLn('const ');
  WriteLn(Format('  SQLITE3_MAXINDEX = %d;', [procNames.Count - 1]));
  WriteLn(Format('  %s: array [0 .. SQLITE3_MAXINDEX] of UnicodeString = ',
    [NAMES_ARRAY]));
  WriteLn('(');
  for i := 0 to procNames.Count - 1 do
  begin
    Write('''' + procNames.Items[i] + '''');
    if (i < procNames.Count - 1) then
      WriteLn(',');
  end;
  WriteLn(');');
  WriteLn;
  WriteLn('// function bodies');
  WriteLn;
  for i := 0 to bodies.Count - 1 do
  begin
    WriteLn(headers.Items[i]);
    WriteLn(bodies.Items[i]);
    WriteLn;
  end;
end;

begin
  try
    LContext := TRttiContext.Create();
    headers := TList<string>.Create;
    bodies := TList<string>.Create;
    procNames := TList<string>.Create;
    try
      GenCode(TypeInfo(Tsqlite3_aggregate_context));
      NoGenCode('TypeInfo(Tsqlite3_aggregate_count)',REASON_DEPRECATED);
      GenCode(TypeInfo(Tsqlite3_auto_extension));
      GenCode(TypeInfo(Tsqlite3_autovacuum_pages));
      GenCode(TypeInfo(Tsqlite3_backup_finish));
      GenCode(TypeInfo(Tsqlite3_backup_init));
      GenCode(TypeInfo(Tsqlite3_backup_pagecount));
      GenCode(TypeInfo(Tsqlite3_backup_remaining));
      GenCode(TypeInfo(Tsqlite3_backup_step));
      GenCode(TypeInfo(Tsqlite3_bind_blob));
      GenCode(TypeInfo(Tsqlite3_bind_blob64));
      GenCode(TypeInfo(Tsqlite3_bind_double));
      GenCode(TypeInfo(Tsqlite3_bind_int));
      GenCode(TypeInfo(Tsqlite3_bind_int64));
      GenCode(TypeInfo(Tsqlite3_bind_null));
      GenCode(TypeInfo(Tsqlite3_bind_parameter_count));
      GenCode(TypeInfo(Tsqlite3_bind_parameter_index));
      GenCode(TypeInfo(Tsqlite3_bind_parameter_name));
      GenCode(TypeInfo(Tsqlite3_bind_pointer));
      GenCode(TypeInfo(Tsqlite3_bind_text));
      GenCode(TypeInfo(Tsqlite3_bind_text16));
      GenCode(TypeInfo(Tsqlite3_bind_text64));
      GenCode(TypeInfo(Tsqlite3_bind_value));
      GenCode(TypeInfo(Tsqlite3_bind_zeroblob));
      GenCode(TypeInfo(Tsqlite3_bind_zeroblob64));
      GenCode(TypeInfo(Tsqlite3_blob_bytes));
      GenCode(TypeInfo(Tsqlite3_blob_close));
      GenCode(TypeInfo(Tsqlite3_blob_open));
      GenCode(TypeInfo(Tsqlite3_blob_read));
      GenCode(TypeInfo(Tsqlite3_blob_reopen));
      GenCode(TypeInfo(Tsqlite3_blob_write));
      GenCode(TypeInfo(Tsqlite3_busy_handler));
      GenCode(TypeInfo(Tsqlite3_busy_timeout));
      GenCode(TypeInfo(Tsqlite3_cancel_auto_extension));
      GenCode(TypeInfo(Tsqlite3_changes));
      GenCode(TypeInfo(Tsqlite3_changes64));
      GenCode(TypeInfo(Tsqlite3_clear_bindings));
      GenCode(TypeInfo(Tsqlite3_close));
      GenCode(TypeInfo(Tsqlite3_close_v2));
      GenCode(TypeInfo(Tsqlite3_collation_needed));
      GenCode(TypeInfo(Tsqlite3_collation_needed16));
      GenCode(TypeInfo(Tsqlite3_column_blob));
      GenCode(TypeInfo(Tsqlite3_column_bytes));
      GenCode(TypeInfo(Tsqlite3_column_bytes16));
      GenCode(TypeInfo(Tsqlite3_column_count));
      GenCode(TypeInfo(Tsqlite3_column_database_name));
      GenCode(TypeInfo(Tsqlite3_column_database_name16));
      GenCode(TypeInfo(Tsqlite3_column_decltype));
      GenCode(TypeInfo(Tsqlite3_column_decltype16));
      GenCode(TypeInfo(Tsqlite3_column_double));
      GenCode(TypeInfo(Tsqlite3_column_int));
      GenCode(TypeInfo(Tsqlite3_column_int64));
      GenCode(TypeInfo(Tsqlite3_column_name));
      GenCode(TypeInfo(Tsqlite3_column_name16));
      GenCode(TypeInfo(Tsqlite3_column_origin_name));
      GenCode(TypeInfo(Tsqlite3_column_origin_name16));
      GenCode(TypeInfo(Tsqlite3_column_table_name));
      GenCode(TypeInfo(Tsqlite3_column_table_name16));
      GenCode(TypeInfo(Tsqlite3_column_text));
      GenCode(TypeInfo(Tsqlite3_column_text16));
      GenCode(TypeInfo(Tsqlite3_column_type));
      GenCode(TypeInfo(Tsqlite3_column_value));
      GenCode(TypeInfo(Tsqlite3_commit_hook));
      GenCode(TypeInfo(Tsqlite3_compileoption_get));
      GenCode(TypeInfo(Tsqlite3_compileoption_used));
      GenCode(TypeInfo(Tsqlite3_complete));
      GenCode(TypeInfo(Tsqlite3_complete16));
      NoGenCode('TypeInfo(Tsqlite3_config)',REASON_OPEN_PARAM);
      GenCode(TypeInfo(Tsqlite3_context_db_handle));
      GenCode(TypeInfo(Tsqlite3_create_collation));
      GenCode(TypeInfo(Tsqlite3_create_collation16));
      GenCode(TypeInfo(Tsqlite3_create_collation_v2));
      GenCode(TypeInfo(Tsqlite3_create_filename));
      GenCode(TypeInfo(Tsqlite3_create_function));
      GenCode(TypeInfo(Tsqlite3_create_function16));
      GenCode(TypeInfo(Tsqlite3_create_function_v2));
      GenCode(TypeInfo(Tsqlite3_create_module));
      GenCode(TypeInfo(Tsqlite3_create_module_v2));
      GenCode(TypeInfo(Tsqlite3_create_window_function));
      GenCode(TypeInfo(Tsqlite3_data_count));
      GenCode(TypeInfo(Tsqlite3_database_file_object));
      GenCode(TypeInfo(Tsqlite3_db_cacheflush));
      NoGenCode('TypeInfo(Tsqlite3_db_config)',REASON_OPEN_PARAM);
      GenCode(TypeInfo(Tsqlite3_db_filename));
      GenCode(TypeInfo(Tsqlite3_db_handle));
      GenCode(TypeInfo(Tsqlite3_db_mutex));
      GenCode(TypeInfo(Tsqlite3_db_name));
      GenCode(TypeInfo(Tsqlite3_db_readonly));
      GenCode(TypeInfo(Tsqlite3_db_release_memory));
      GenCode(TypeInfo(Tsqlite3_db_status));
      GenCode(TypeInfo(Tsqlite3_declare_vtab));
      GenCode(TypeInfo(Tsqlite3_deserialize));
      GenCode(TypeInfo(Tsqlite3_drop_modules));
      GenCode(TypeInfo(Tsqlite3_enable_load_extension));
      GenCode(TypeInfo(Tsqlite3_enable_shared_cache));
      GenCode(TypeInfo(Tsqlite3_errcode));
      GenCode(TypeInfo(Tsqlite3_errmsg));
      GenCode(TypeInfo(Tsqlite3_errmsg16));
      GenCode(TypeInfo(Tsqlite3_error_offset));
      GenCode(TypeInfo(Tsqlite3_errstr));
      GenCode(TypeInfo(Tsqlite3_exec));
      GenCode(TypeInfo(Tsqlite3_expanded_sql));
      NoGenCode('TypeInfo(Tsqlite3_expired)',REASON_DEPRECATED);
      GenCode(TypeInfo(Tsqlite3_extended_errcode));
      GenCode(TypeInfo(Tsqlite3_extended_result_codes));
      GenCode(TypeInfo(Tsqlite3_file_control));
      GenCode(TypeInfo(Tsqlite3_filename_database));
      GenCode(TypeInfo(Tsqlite3_filename_journal));
      GenCode(TypeInfo(Tsqlite3_filename_wal));
      GenCode(TypeInfo(Tsqlite3_finalize));
      GenCode(TypeInfo(Tsqlite3_free));
      GenCode(TypeInfo(Tsqlite3_free_filename));
      GenCode(TypeInfo(Tsqlite3_free_table));
      GenCode(TypeInfo(Tsqlite3_get_autocommit));
      GenCode(TypeInfo(Tsqlite3_get_auxdata));
      GenCode(TypeInfo(Tsqlite3_get_table));
      NoGenCode('TypeInfo(Tsqlite3_global_recover)',REASON_DEPRECATED);
      GenCode(TypeInfo(Tsqlite3_hard_heap_limit64));
      GenCode(TypeInfo(Tsqlite3_initialize));
      GenCode(TypeInfo(Tsqlite3_interrupt));
      GenCode(TypeInfo(Tsqlite3_is_interrupted));
      GenCode(TypeInfo(Tsqlite3_keyword_check));
      GenCode(TypeInfo(Tsqlite3_keyword_count));
      GenCode(TypeInfo(Tsqlite3_keyword_name));
      GenCode(TypeInfo(Tsqlite3_last_insert_rowid));
      GenCode(TypeInfo(Tsqlite3_libversion));
      GenCode(TypeInfo(Tsqlite3_libversion_number));
      GenCode(TypeInfo(Tsqlite3_limit));
      GenCode(TypeInfo(Tsqlite3_load_extension));
      NoGenCode('TypeInfo(Tsqlite3_log)',REASON_DEPRECATED);
      GenCode(TypeInfo(Tsqlite3_malloc));
      GenCode(TypeInfo(Tsqlite3_malloc64));
      NoGenCode('TypeInfo(Tsqlite3_memory_alarm)',REASON_DEPRECATED);
      GenCode(TypeInfo(Tsqlite3_memory_highwater));
      GenCode(TypeInfo(Tsqlite3_memory_used));
      NoGenCode('TypeInfo(Tsqlite3_mprintf)',REASON_OPEN_PARAM);
      GenCode(TypeInfo(Tsqlite3_msize));
      GenCode(TypeInfo(Tsqlite3_mutex_alloc));
      GenCode(TypeInfo(Tsqlite3_mutex_enter));
      GenCode(TypeInfo(Tsqlite3_mutex_free));
      GenCode(TypeInfo(Tsqlite3_mutex_held));
      GenCode(TypeInfo(Tsqlite3_mutex_leave));
      GenCode(TypeInfo(Tsqlite3_mutex_notheld));
      GenCode(TypeInfo(Tsqlite3_mutex_try));
      GenCode(TypeInfo(Tsqlite3_next_stmt));
      NoGenCode('TypeInfo(Tsqlite3_normalized_sql)',REASON_OPTIONAL);
      GenCode(TypeInfo(Tsqlite3_open));
      GenCode(TypeInfo(Tsqlite3_open16));
      GenCode(TypeInfo(Tsqlite3_open_v2));
      GenCode(TypeInfo(Tsqlite3_os_end));
      GenCode(TypeInfo(Tsqlite3_os_init));
      GenCode(TypeInfo(Tsqlite3_overload_function));
      GenCode(TypeInfo(Tsqlite3_prepare));
      GenCode(TypeInfo(Tsqlite3_prepare16));
      GenCode(TypeInfo(Tsqlite3_prepare16_v2));
      GenCode(TypeInfo(Tsqlite3_prepare16_v3));
      GenCode(TypeInfo(Tsqlite3_prepare_v2));
      GenCode(TypeInfo(Tsqlite3_prepare_v3));
      GenCode(TypeInfo(Tsqlite3_preupdate_blobwrite));
      GenCode(TypeInfo(Tsqlite3_preupdate_count));
      GenCode(TypeInfo(Tsqlite3_preupdate_depth));
      GenCode(TypeInfo(Tsqlite3_preupdate_hook));
      GenCode(TypeInfo(Tsqlite3_preupdate_new));
      GenCode(TypeInfo(Tsqlite3_preupdate_old));
      GenCode(TypeInfo(Tsqlite3_profile));
      GenCode(TypeInfo(Tsqlite3_progress_handler));
      GenCode(TypeInfo(Tsqlite3_randomness));
      GenCode(TypeInfo(Tsqlite3_realloc));
      GenCode(TypeInfo(Tsqlite3_realloc64));
      GenCode(TypeInfo(Tsqlite3_release_memory));
      GenCode(TypeInfo(Tsqlite3_reset));
      GenCode(TypeInfo(Tsqlite3_reset_auto_extension));
      GenCode(TypeInfo(Tsqlite3_result_blob));
      GenCode(TypeInfo(Tsqlite3_result_blob64));
      GenCode(TypeInfo(Tsqlite3_result_double));
      GenCode(TypeInfo(Tsqlite3_result_error));
      GenCode(TypeInfo(Tsqlite3_result_error16));
      GenCode(TypeInfo(Tsqlite3_result_error_code));
      GenCode(TypeInfo(Tsqlite3_result_error_nomem));
      GenCode(TypeInfo(Tsqlite3_result_error_toobig));
      GenCode(TypeInfo(Tsqlite3_result_int));
      GenCode(TypeInfo(Tsqlite3_result_int64));
      GenCode(TypeInfo(Tsqlite3_result_null));
      GenCode(TypeInfo(Tsqlite3_result_pointer));
      GenCode(TypeInfo(Tsqlite3_result_subtype));
      GenCode(TypeInfo(Tsqlite3_result_text));
      GenCode(TypeInfo(Tsqlite3_result_text16));
      GenCode(TypeInfo(Tsqlite3_result_text16be));
      GenCode(TypeInfo(Tsqlite3_result_text16le));
      GenCode(TypeInfo(Tsqlite3_result_text64));
      GenCode(TypeInfo(Tsqlite3_result_value));
      GenCode(TypeInfo(Tsqlite3_result_zeroblob));
      GenCode(TypeInfo(Tsqlite3_result_zeroblob64));
      GenCode(TypeInfo(Tsqlite3_rollback_hook));
      GenCode(TypeInfo(Tsqlite3_serialize));
      GenCode(TypeInfo(Tsqlite3_set_authorizer));
      GenCode(TypeInfo(Tsqlite3_set_auxdata));
      GenCode(TypeInfo(Tsqlite3_set_last_insert_rowid));
      GenCode(TypeInfo(Tsqlite3_shutdown));
      GenCode(TypeInfo(Tsqlite3_sleep));
      GenCode(TypeInfo(Tsqlite3_snapshot_cmp));
      GenCode(TypeInfo(Tsqlite3_snapshot_free));
      GenCode(TypeInfo(Tsqlite3_snapshot_get));
      GenCode(TypeInfo(Tsqlite3_snapshot_open));
      GenCode(TypeInfo(Tsqlite3_snapshot_recover));
      NoGenCode('TypeInfo(Tsqlite3_snprintf)',REASON_OPEN_PARAM);
      NoGenCode('TypeInfo(Tsqlite3_soft_heap_limit)',REASON_DEPRECATED);
      GenCode(TypeInfo(Tsqlite3_soft_heap_limit64));
      GenCode(TypeInfo(Tsqlite3_sourceid));
      GenCode(TypeInfo(Tsqlite3_sql));
      GenCode(TypeInfo(Tsqlite3_status));
      GenCode(TypeInfo(Tsqlite3_status64));
      GenCode(TypeInfo(Tsqlite3_step));
      GenCode(TypeInfo(Tsqlite3_stmt_busy));
      GenCode(TypeInfo(Tsqlite3_stmt_isexplain));
      GenCode(TypeInfo(Tsqlite3_stmt_readonly));
      GenCode(TypeInfo(Tsqlite3_stmt_scanstatus));
      GenCode(TypeInfo(Tsqlite3_stmt_scanstatus_reset));
      GenCode(TypeInfo(Tsqlite3_stmt_scanstatus_v2));
      GenCode(TypeInfo(Tsqlite3_stmt_status));
      GenCode(TypeInfo(Tsqlite3_str_append));
      GenCode(TypeInfo(Tsqlite3_str_appendall));
      GenCode(TypeInfo(Tsqlite3_str_appendchar));
      NoGenCode('TypeInfo(Tsqlite3_str_appendf)',REASON_OPEN_PARAM);
      GenCode(TypeInfo(Tsqlite3_str_errcode));
      GenCode(TypeInfo(Tsqlite3_str_finish));
      GenCode(TypeInfo(Tsqlite3_str_length));
      GenCode(TypeInfo(Tsqlite3_str_new));
      GenCode(TypeInfo(Tsqlite3_str_reset));
      GenCode(TypeInfo(Tsqlite3_str_value));
      GenCode(TypeInfo(Tsqlite3_str_vappendf));
      GenCode(TypeInfo(Tsqlite3_strglob));
      GenCode(TypeInfo(Tsqlite3_stricmp));
      GenCode(TypeInfo(Tsqlite3_strlike));
      GenCode(TypeInfo(Tsqlite3_strnicmp));
      GenCode(TypeInfo(Tsqlite3_system_errno));
      GenCode(TypeInfo(Tsqlite3_table_column_metadata));
      NoGenCode('TypeInfo(Tsqlite3_test_control)',REASON_OPEN_PARAM);
      NoGenCode('TypeInfo(Tsqlite3_thread_cleanup)',REASON_DEPRECATED);
      GenCode(TypeInfo(Tsqlite3_threadsafe));
      GenCode(TypeInfo(Tsqlite3_total_changes));
      GenCode(TypeInfo(Tsqlite3_total_changes64));
      GenCode(TypeInfo(Tsqlite3_trace));
      GenCode(TypeInfo(Tsqlite3_trace_v2));
      NoGenCode('TypeInfo(Tsqlite3_transfer_bindings)',REASON_DEPRECATED);
      GenCode(TypeInfo(Tsqlite3_txn_state));
      GenCode(TypeInfo(Tsqlite3_unlock_notify));
      GenCode(TypeInfo(Tsqlite3_update_hook));
      GenCode(TypeInfo(Tsqlite3_uri_boolean));
      GenCode(TypeInfo(Tsqlite3_uri_int64));
      GenCode(TypeInfo(Tsqlite3_uri_key));
      GenCode(TypeInfo(Tsqlite3_uri_parameter));
      GenCode(TypeInfo(Tsqlite3_user_data));
      GenCode(TypeInfo(Tsqlite3_value_blob));
      GenCode(TypeInfo(Tsqlite3_value_bytes));
      GenCode(TypeInfo(Tsqlite3_value_bytes16));
      GenCode(TypeInfo(Tsqlite3_value_double));
      GenCode(TypeInfo(Tsqlite3_value_dup));
      GenCode(TypeInfo(Tsqlite3_value_encoding));
      GenCode(TypeInfo(Tsqlite3_value_free));
      GenCode(TypeInfo(Tsqlite3_value_frombind));
      GenCode(TypeInfo(Tsqlite3_value_int));
      GenCode(TypeInfo(Tsqlite3_value_int64));
      GenCode(TypeInfo(Tsqlite3_value_nochange));
      GenCode(TypeInfo(Tsqlite3_value_numeric_type));
      GenCode(TypeInfo(Tsqlite3_value_pointer));
      GenCode(TypeInfo(Tsqlite3_value_subtype));
      GenCode(TypeInfo(Tsqlite3_value_text));
      GenCode(TypeInfo(Tsqlite3_value_text16));
      GenCode(TypeInfo(Tsqlite3_value_text16be));
      GenCode(TypeInfo(Tsqlite3_value_text16le));
      GenCode(TypeInfo(Tsqlite3_value_type));
      NoGenCode('TypeInfo(Tsqlite3_version)','not callable');
      GenCode(TypeInfo(Tsqlite3_vfs_find));
      GenCode(TypeInfo(Tsqlite3_vfs_register));
      GenCode(TypeInfo(Tsqlite3_vfs_unregister));
      NoGenCode('TypeInfo(Tsqlite3_vmprintf)',REASON_OPEN_PARAM);
      NoGenCode('TypeInfo(Tsqlite3_vsnprintf)',REASON_OPEN_PARAM);
      GenCode(TypeInfo(Tsqlite3_vtab_collation));
      NoGenCode('TypeInfo(Tsqlite3_vtab_config)',REASON_OPEN_PARAM);
      GenCode(TypeInfo(Tsqlite3_vtab_distinct));
      GenCode(TypeInfo(Tsqlite3_vtab_in));
      GenCode(TypeInfo(Tsqlite3_vtab_in_first));
      GenCode(TypeInfo(Tsqlite3_vtab_in_next));
      GenCode(TypeInfo(Tsqlite3_vtab_nochange));
      GenCode(TypeInfo(Tsqlite3_vtab_on_conflict));
      GenCode(TypeInfo(Tsqlite3_vtab_rhs_value));
      GenCode(TypeInfo(Tsqlite3_wal_autocheckpoint));
      GenCode(TypeInfo(Tsqlite3_wal_checkpoint));
      GenCode(TypeInfo(Tsqlite3_wal_checkpoint_v2));
      GenCode(TypeInfo(Tsqlite3_wal_hook));
      GenCode(TypeInfo(Tsqlite3_win32_set_directory));
      GenCode(TypeInfo(Tsqlite3_win32_set_directory16));
      GenCode(TypeInfo(Tsqlite3_win32_set_directory8));

      DumpItfSection;
      WriteLn;
      DumpImplSection;
    finally
      LContext.Free;
      headers.Free;
      bodies.Free;
      procNames.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
  ReadLn;

end.
