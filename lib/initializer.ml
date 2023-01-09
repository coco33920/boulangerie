let exists () = 
  try
    open_in "_boulangerie.json" |> ignore;
    true
  with _ -> false;;

(*
Creates a new croissant project
*)
let init git =
  if exists () then (print_endline "there already is a croissant project here")
  else begin
  print_endline "Downloading file from github...";
  Sys.command
    "wget -q https://raw.githubusercontent.com/coco33920/croissant/install/_template/_boulangerie.json"
  |> ignore;
  print_endline "file downloaded";
  if git then (
    Sys.command "git init" |> ignore;
    print_endline "git repository created");
  let oc = open_out "lib.baguette" in
  Printf.fprintf oc "%s\n"
    "CROISSANT CHOUQUETTE PARISBREST Hello World PARISBREST CLAFOUTIS BAGUETTE";
  close_out oc;
  print_endline "Boulangerie project initialized" end;
