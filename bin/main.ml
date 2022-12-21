open Cmdliner

type init_conf = { git : bool }
type exec_conf = { verbose : bool }
type cmd_conf = Init of init_conf | Exec of exec_conf

let run cmd =
  match cmd with
  | Init _ -> print_endline "init!"
  | Exec _ -> print_endline "exec!"

let git_term =
  let info = Arg.info [ "git" ] ~doc:"Initialize an empty git repository" in
  Arg.value (Arg.flag info)

let bar_term =
  let info = Arg.info [ "bar" ] ~doc:"Toggle the verbose" in
  Arg.value (Arg.flag info)

let init_term run =
  let combine git = Init { git } |> run in
  Term.(const combine $ git_term)

let exec_term run =
  let combine verbose = Exec { verbose } |> run in
  Term.(const combine $ bar_term)

let init_doc = "initialize an empty croissant project in the current folder"

let init_man =
  [
    `S Manpage.s_description; `P "Let you initialize an empty croissant project in the current folder";
  ]

let init run =
  let info = Cmd.info "init" ~doc:init_doc ~man:init_man in
  Cmd.v info (init_term run)

let exec_doc = "execute a croissant project"

let exec_man =
  [
    `S Manpage.s_description;
    `P "Execute a croissant project with the Baguette# interpreter";
  ]

let exec run =
  let info = Cmd.info "exec" ~doc:exec_doc ~man:exec_man in
  Cmd.v info (exec_term run)

let root_doc = "The Baguette# package and project manager"
let root_info = Cmd.info "croissant" ~doc:root_doc
let subcommand run = [ init run; exec run ]

let parse_command_line_and_run (run : cmd_conf -> unit) =
  Cmd.group root_info (subcommand run) |> Cmd.eval |> exit

let () = parse_command_line_and_run run
