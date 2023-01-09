open Yojson.Basic
open Yojson.Basic.Util

let open_file () = from_file "_boulangerie.json";;
let get_name json = json |> member "name" |> to_string |> String.lowercase_ascii |> Str.global_replace (Str.regexp " ") "_";;
let is_installed name =
  let s = Array.to_list (Sys.readdir (Filemanager.dirfile ())) in 
  let s = List.filter (fun c -> String.equal (Filename.extension c) "installed") s in
  match List.find_opt (fun c -> String.equal c name) s with
    | Some _ -> true
    | None -> false;;

let install name = 
  Filemanager.create_lib_name_dir name;
  FileUtil.cp ["lib.baguette"] (Filemanager.file_in_lib_dir name "lib.baguette");
  Filemanager.install_lib_dir name;
  print_endline ("Library " ^ name ^ " has been installed");; 