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
  |> ignore
