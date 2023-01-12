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
  let str = read_file (Filemanager.home () ^ Filemanager.sep () ^ ".boulangerie" ^ Filemanager.sep () ^ "repository.boulangerie") in 
  let () = print_endline "--- List of available dependancies ---" in 
  str |> List.map (fun s -> print_endline s) |> ignore;