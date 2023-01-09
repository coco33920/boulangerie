open Yojson.Basic
open Yojson.Basic.Util

let open_file () = from_file "_boulangerie.json";;
let get_name json = json |> member "name" |> to_string |> String.lowercase_ascii |> Str.global_replace (Str.regexp " ") "_";;
let is_installed name =
  let json = from_file (Filemanager.installed_file ()) in 
  let installed_list = json |> member "installed" |> to_list in
  let installed_list = List.map (fun c -> c |> to_string) installed_list in
  let is_installed = match (List.find_opt (fun c -> String.equal c name) installed_list) with
    | Some _ -> true
    | None -> false in
  is_installed;;