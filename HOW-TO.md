# How it works

Both 64 and 32 bits versions of "Sqlite3.dll" are included at build time as a resource.
See *resource\how-to.txt* for instructions.
At app initialization, the proper dll is extracted to a temp file and linked dynamically.

# How to upgrade to newer versions of SQLite3

Many source code is machine-generated, which is much less prone to human error.
Such code is generated from *SQLite3.Core.Prototypes*.
Edit such file in order to include new SQLite3's function prototypes.
SQLite3's new data types should be declared at *SQLite3.Core.Objects*.
Then, add a call to **GenCode(TypeInfo(<<new function prototype>>))** at program *SQLite3CodeGen*

Compile, build and run project *SQLite3CodeGen.exe*.
Console output is part of the code that must be copy-pasted into *SQLite3.Core.Functions*:
half to the *interface* section, half to the *implementation* section, which is noted at console output.
