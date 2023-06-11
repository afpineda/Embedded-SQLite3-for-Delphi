# Embedded SQLite for Delphi

This project provides a Delphi translation for the [SQLite](https://sqlite.org/) API and some handy classes for convenience. Supports both dynamic and static linking (with a creative solution). Support for Unicode and BLOBs.

For Windows applications.

**Currently translated SQLite version**: 3.42.0

## API structure

This API mimics the structure of the SQLite documentation:

- [SQLite3.Core.Constants](./source/SQLite3.Core.Constants.pas): constants as described in [List of Constants](https://sqlite.org/c3ref/constlist.html), including error codes.
- [SQLite3.Core.Objects](./source/SQLite3.Core.Objects.pas): data types as described in [List of Objects](https://sqlite.org/c3ref/objlist.html), plus other auxiliary data types not described there, but used anywhere in the API.
- [SQLite3.Core.Functions](./source/SQLite3.Core.Functions.pas): API functions as described in [List of Functions](https://sqlite.org/c3ref/funclist.html).
- [SQLite3.Core.Prototypes](./source/SQLite3.Core.Prototypes.pas): Pascal specification of every SQLite function. Not needed in user code. Used for automation.
- [SQLite3.Classes](./source/SQLite3.Classes.pas): An abstraction of the SQLite API for convenience. Includes most used SQLite functionality, but not all.

**Note** that:

- Some SQLite functions has not been translated.
- Most translated functions were not tested.
- Even if they work, their data types may be wrong or may be improved.

## How it works

Both 64 and 32 bits versions of "Sqlite3.dll" are included at build time as a resource.
See [resource/How-to.txt](./resource/How-to.txt) for instructions.
At app initialization, the proper dll is extracted to a temp file and linked dynamically.

## How to upgrade to newer versions of SQLite3

Many source code is machine-generated, which is much less prone to human error.
Such code is generated from [SQLite3.Core.Prototypes](./source/SQLite3.Core.Prototypes.pas)
Edit such a file in order to include new SQLite3's function prototypes.
SQLite3's new data types should be declared at *SQLite3.Core.Objects*.
Then, add a call to `GenCode(TypeInfo(<<new function prototype>>))` at program [SQLite3CodeGen](./Project/SQLite3CodeGen.dpr).

Compile, build and run project *SQLite3CodeGen.exe*.
Console output is part of the code that must be copy-pasted into [SQLite3.Core.Functions](./source/SQLite3.Core.Functions.pas):
half to the *interface* section, half to the *implementation* section, which is noted at console output.

## Did you know that Delphi already provides built-in support for SQLite ?

Yes. I'm aware of [that](https://docwiki.embarcadero.com/RADStudio/Sydney/en/Using_SQLite_with_FireDAC).
At the the time this project was born (but not published yet), there were no built-in SQLite support in Delphi.

However, there are still a number of reasons not to use FireDAC. For example, smaller binaries and **portability**.

## Where is the documentation?

Look for commentaries at the source code.
