(*
Creates a new croissant project
*)
let init git =
  print_endline "Downloading file from github...";
  Nethttp_client.Convenience.http_get "https://raw.githubusercontent.com/coco33920/croissant/master/_template/_croissant.yml" |> ignore;
  print_endline "file downloaded";
  if git then begin (Sys.command "git init" |> ignore); print_endline "git repository created" end;
  let oc = open_out "lib.baguette" in
  Printf.fprintf oc "%s\n" "CROISSANT CHOUQUETTE PARISBREST Hello World PARISBREST CLAFOUTIS BAGUETTE";
  close_out oc;
  print_endline "Croissant project initialized";
