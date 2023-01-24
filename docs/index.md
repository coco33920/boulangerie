# Welcome to Boulangerie, the Baguette# Package Manager
Welcome to *boulangerie* the first exotic language package manager!

## Install
Boulangerie is in the *OPAM* repositories, so you just need to type `opam install boulangerie` to install it, make sure you updated to the 
lastest version of Baguette# to support *boulangerie* integration, (first version to support it is v2.2.1).

## Features
Currently implemented are
* `boulangerie enter` which initialize a new boulangerie project in the current repository
* `boulangerie try` which execute with the baguettesharp executable the current project
* `boulangerie buy` which install local library under the lib files
* `boulangerie storefront` which list all available libraries
* `boulangerie buy --lib <library>` which install a library from the distant repository 
* `boulangerie raise` which updates the local list of library from the server
* `boulangerie raise --lib <library>` which update a library from the distant repository

## Usage
Just type `LOAD PARISBREST library PARISBREST` to load in a file your library (the lib.baguette file) !

## Publishing a library
To publish your library, 

* Release your library and add the url in your baguette file like in `coco33920/tartelettes/0.4/boulangerie.json`

* fork this repository 

* add in the `repository` folder your `boulangerie.json` file under `github/name/version`

* add in the `repository.boulangerie` your library, like `github/name:version`

* Commit, push, and pull request this repository !

