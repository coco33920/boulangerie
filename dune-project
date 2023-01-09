(lang dune 3.0)

(name boulangerie)
(version alpha-0.0.1)
(generate_opam_files true)

(source
 (github coco33920/croissant))

(authors "Charlotte Thomas")

(maintainers "Charlotte Thomas")

(license GPLv3)

(homepage "https://croissant.baguettesharp.fr/")
(package
 (name boulangerie)
 (synopsis "B# Package Manager")
 (description "The World's first exotic language package manager: BOULANGERIE made for Baguette# (mostly as a joke)")
 (depends ocaml dune core yojson baguette_sharp cmdliner str fileutils))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
