(* Custom functions *)

let get_or_failwith failure_message opt =
  match opt with Some x -> x | None -> failwith failure_message
