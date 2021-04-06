program SQLite3Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SQLite3.Classes in '..\source\SQLite3.Classes.pas',
  SQLite3.Core.Constants in '..\source\SQLite3.Core.Constants.pas',
  SQLite3.Core.Functions in '..\source\SQLite3.Core.Functions.pas',
  SQLite3.Core.Objects in '..\source\SQLite3.Core.Objects.pas',
  SQLite3.Core.Prototypes in '..\source\SQLite3.Core.Prototypes.pas';

var
  db: TSQLiteDatabase;
begin

  try
    if not isAvailable then
      raise Exception.Create('SQLite3 not available');
    db := TSQLiteDatabase.Create;
    try

    finally
      db.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
