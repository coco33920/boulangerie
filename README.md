<h1 align="center">BOULANGERIE : The Baguette# Package Manager</h1>
<h3 align="center">World's first exotic language package manager!</h3>

## Boulangerie
Welcome to the very early development of **Boulangerie** the package manager made for the *Baguette#* exotic programming language  
The structure is heavily inspired by OPAM the OCaml Package Manager.

## Features currently implemented
* `boulangerie enter` initialize a new project
* `boulangerie try` execute the current project 
* `boulangerie buy` install local libraries
* `boulangerie storefront` list available libraries
* `boulangerie buy --lib lib` install a distant library
* `boulangerie raise` updates the local repository
* `boulangerie raise --lib lib` updates a distant library

## Usage
To use it in a B# file you just need to do a `LOAD <library>`, and it will load all the files of the library,
running `LOAD <library.file>` loads specifically the file specified.
