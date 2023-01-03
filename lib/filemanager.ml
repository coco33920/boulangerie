let home () = Sys.getenv "HOME";;
let sep () = Filename.dir_sep;;
let mkdir name = Sys.command ("mkdir -p " ^ (home () ^ sep () ^ name)) |> ignore;;
let init_parent_file () = match Sys.file_exists (home () ^ sep () ^ ".boulangerie") with
  | false -> mkdir ".boulangerie"
  | true -> ();;

let init_lib_file () = match Sys.file_exists (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "lib") with
  | false -> mkdir (".boulangerie" ^ sep () ^ "lib")
  | true -> ();;

let init = init_parent_file (); init_lib_file;;