open Cmdliner

type init_conf = { git : bool }
type exec_conf = { verbose : bool }
type install_conf = { lib : string }
type cmd_conf = Init of init_conf | Exec of exec_conf | Install of install_conf

let run cmd =
  match cmd with
  | Init f -> Boulangerie.Initializer.init f.git
  | Exec _ -> Sys.command "baguette_sharp.repl --input lib.baguette" |> ignore
  | Install i -> if i.lib=="" then 
    begin
      let json = Boulangerie.Parseboulangerie.open_file () in 
      let name = Boulangerie.Parseboulangerie.get_name json in
      match Boulangerie.Parseboulangerie.is_installed name with
      | false -> print_endline (name ^ " pas installé")
      | true -> print_endline (name ^ " installé")
    end
  else ()

let git_term =
  let info = Arg.info [ "git" ] ~doc:"Initialize an empty git repository" in
  Arg.value (Arg.flag info)

let bar_term =
  let info = Arg.info [ "verbose" ] ~doc:"Toggle the verbose" in
  Arg.value (Arg.flag info)

let lib_term = 
  let info = Arg.info [ "lib" ] ~doc:"Install a distant library from the repository" in 
  Arg.value ((Arg.opt Arg.string) "" info)

let init_term run =
  let combine git = Init { git } |> run in
  Term.(const combine $ git_term)

let exec_term run =
  let combine verbose = Exec { verbose } |> run in
  Term.(const combine $ bar_term)

let install_term run = 
  let combine lib = Install { lib } |> run in 
  Term.(const combine $ lib_term)

let init_doc = "initialize an empty boulangerie project in the current folder"

let init_man =
  [
    `S Manpage.s_description;
    `P "Let you initialize an empty boulangerie project in the current folder";
  ]

let init run =
  let info = Cmd.info "enter" ~doc:init_doc ~man:init_man in
  Cmd.v info (init_term run)

let exec_doc = "execute a boulangerie project"

let exec_man =
  [
    `S Manpage.s_description;
    `P "Execute a boulangerie project with the Baguette# interpreter";
  ]

let exec run =
  let info = Cmd.info "try" ~doc:exec_doc ~man:exec_man in
  Cmd.v info (exec_term run)

let install_doc = "install the current or a distant library"

let install_man = 
  [
    `S Manpage.s_description;
    `P "Install the current library or the distant library in the project core"
  ]

  let install run =
    let info = Cmd.info "buy" ~doc:install_doc ~man:install_man in 
    Cmd.v info (install_term run)

let root_doc = "The Baguette# package and project manager"
let root_info = Cmd.info "boulangerie" ~doc:root_doc
let subcommand run = [ init run; exec run; install run ]

let parse_command_line_and_run (run : cmd_conf -> unit) =
  Cmd.group root_info (subcommand run) |> Cmd.eval |> exit

let () = parse_command_line_and_run run
