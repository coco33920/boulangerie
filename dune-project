(lang dune 3.0)

(name croissant)
(version 0.0.1)
(generate_opam_files true)

(source
 (github coco33920/croissant))

(authors "Charlotte Thomas")

(maintainers "Charlotte Thomas")

(license MIT)

(homepage "https://croissant.baguettesharp.fr/")
(package
 (name croissant)
 (synopsis "B# Package Manager")
 (description "The World's first exotic language package manager: CROISSANT made for Baguette# (mostly as a joke)")
 (depends ocaml dune yaml))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
