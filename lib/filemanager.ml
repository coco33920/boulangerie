let home () = Sys.getenv "HOME"
let sep () = Filename.dir_sep
let mkdir name = Sys.command ("mkdir -p " ^ home () ^ sep () ^ name) |> ignore

let init_parent_file () =
  match Sys.file_exists (home () ^ sep () ^ ".boulangerie") with
  | false -> mkdir ".boulangerie"
  | true -> ()

let init_list_file () =
  match
    Sys.file_exists
      (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "repository.boulangerie")
  with
  | false ->
      Sys.command
        "wget -q \
         https://raw.githubusercontent.com/coco33920/boulangerie/distant-list/repository/repository.boulangerie"
      |> ignore;
      FileUtil.mv "repository.boulangerie"
        (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "repository.boulangerie");
      print_endline "list file downloaded"
  | true -> ()

let init_lib_file () =
  match
    Sys.file_exists (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "lib")
  with
  | false -> mkdir (".boulangerie" ^ sep () ^ "lib")
  | true -> ()

let create_lib_dir name =
  match
    Sys.file_exists
      (home () ^ sep () ^ ".boulangerie" ^ sep () ^ "lib" ^ sep () ^ name)
  with
  | false -> mkdir (".boulangerie" ^ sep () ^ "lib" ^ sep () ^ name)
  | true -> ()

let create_lib_name_dir name =
  mkdir (".boulangerie" ^ sep () ^ "lib" ^ sep () ^ name)

let file_in_lib_dir libname name =
  home () ^ sep () ^ ".boulangerie" ^ sep () ^ "lib" ^ sep () ^ libname ^ sep ()
  ^ name

let install_lib_dir libname version =
  let c =
    open_out
      (home () ^ sep () ^ ".boulangerie" ^ sep () ^ libname ^ ".installed")
  in
  Printf.fprintf c "%f\n" version;
  close_out c

let dirfile () = home () ^ sep () ^ ".boulangerie"

let init () =
  init_parent_file ();
  init_lib_file ()
