let read_file filename =
  let lines = ref [] in
  let chan = open_in filename in
  try
    while true do
      let a = input_line chan in
      if not (String.starts_with ~prefix:"//" a) then lines := a :: !lines
    done;
    !lines
  with End_of_file ->
    close_in chan;
    List.rev !lines

let list_available_files_and_print_them () =
  let str =
    read_file
      (Filemanager.home () ^ Filemanager.sep () ^ ".boulangerie"
     ^ Filemanager.sep () ^ "repository.boulangerie")
  in
  let () =
    print_endline
      "\027[1;38;2;195;239;195m--- List of available dependancies ---\027[m"
  in
  str
  |> List.map (fun s -> print_endline ("\027[38;2;195;239;195m" ^ s ^ "\027[m"))
  |> ignore;;

let find name eq =
  let sv = String.split_on_char ':' name in
  let s  = String.split_on_char '/' (List.hd sv) in
  String.equal (List.hd s) eq;;

let exists name =
  let transform_to_list s =
    let sv = String.split_on_char ':' s in
    let sv = String.split_on_char '/' (List.hd sv) in
    List.hd (List.tl sv)
  in
  let str =
    read_file
      (Filemanager.home () ^ Filemanager.sep () ^ ".boulangerie"
     ^ Filemanager.sep () ^ "repository.boulangerie")
  in
  match
    str |> List.map transform_to_list
    |> List.find_opt (fun s -> find s name)
  with
  | Some _ -> true
  | None -> false;;

let find_with_version name =
  let transform_to_list s =
    let sv = String.split_on_char ':' s in
    (List.hd sv, List.hd (List.tl sv))
  in
  let str =
    read_file
      (Filemanager.home () ^ Filemanager.sep () ^ ".boulangerie"
     ^ Filemanager.sep () ^ "repository.boulangerie")
  in
  match
    str |> List.map transform_to_list
    |> List.find_opt (fun (s, _) -> find s name)
  with
  | Some (s, v) -> print_endline s; (s, v)
  | None -> ("", "");;
