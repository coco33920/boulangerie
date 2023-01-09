open Core
open Yojson.Basic
open Yojson.Basic.Util

let open_file () = from_file "_boulangerie.json";;
let get_name json = json |> member "name" |> to_string |> String.lowercase |> String.substr_replace_all ~pattern:" " ~with_:"_";;