(lang dune 3.0)

(name boulangerie)
(version 1.1.1)
(generate_opam_files false)

(source
 (github coco33920/boulangerie))

(authors "Charlotte Thomas")

(maintainers "Charlotte Thomas")

(license GPL-3.0-or-later)

(homepage "https://boulangerie.baguettesharp.fr/")
(package
 (name boulangerie)
 (synopsis "B# Package Manager")
 (description "The World's first exotic language package manager: BOULANGERIE made for Baguette# (mostly as a joke)")
 (depends ocaml dune yojson cmdliner fileutils))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
