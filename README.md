<h1 align="center">Croissant : The Baguette# Package Manager</h1>
<h3 align="center">World's first exotic language package manager!</h3>

## Croissant
Welcome to the very early development of **Croissant** the package manager made for the *Baguette#* exotic programming language  
The structure is heavily inspired by OPAM the OCaml Package Manager.

## Feature
running `croissant` in the current directory reads file and search for a `croissant.yml` file.  
In this file you must follow the example given by the file in the `_template` folder.  
* Running `croissant install` in a directory with the template folder copy the content of a `src` folder into the `/home/name/.croissant/lib/library_name/`. If a binary was compiled and is present in the `bin` folder it is copied to `/home/name/.croissant/bin/library_name/`
* Running `croissant exec file` execute the file (provided you have a baguette_sharp.repl binary in your $PATH)
* Running `croissant list` reads the current lists of package with their description available
* `croissant update` fetch the list from the repository and updates it
* `croissant upgrade` upgrade the upgradable files
* and finally `croissant install <library>` install a library from the repository.

## Usage
To use it in a B# file you just need to do a `LOAD <library>`, and it will load all the files of the library,
running `LOAD <library.file>` loads specifically the file specified.