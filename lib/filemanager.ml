let home () = Sys.getenv "HOME";;
let sep () = Filename.dir_sep;;
let mkdir name = Sys.command ("mkdir -p " ^ (home () ^ sep () ^ name)) |> ignore;;
let init_parent_file () = match Sys.file_exists (home () ^ sep () ^ ".boulangerie") with
  | false -> mkdir ".boulangerie"
  | true -> ();;

let init_lib_file () = match Sys.file_exists (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "lib") with
  | false -> mkdir (".boulangerie" ^ sep () ^ "lib")
  | true -> ();;

let init_installed_file () = match Sys.file_exists (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "installed.json") with
  | false -> let o = open_out (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "installed.json") in close_out o
  | true -> ();;

let create_lib_dir name = match Sys.file_exists (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "lib" ^ sep () ^ name) with
  | false -> mkdir (".boulangerie" ^ sep () ^ "lib" ^ sep () ^ name)
  | true -> ();;

let file_in_lib_dir libname name = home () ^ sep () ^ ".boulangerie" ^ sep () ^ "lib" ^ libname ^ sep () ^ name;;
let installed_file () = home () ^ sep () ^ ".boulangerie" ^ sep () ^ "installed.json"
let init = init_parent_file (); init_lib_file (); init_installed_file;;
