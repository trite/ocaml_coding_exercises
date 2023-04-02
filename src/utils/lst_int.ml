open Fn

let sum = Stdlib.List.fold_left ( + ) 0

let max = Stdlib.List.fold_left (fun a b -> if a > b then a else b) 0

let sort = List.sort Int.compare

let keep_somes_ditch_nones : int option list -> int list =
  List.map Option.to_list >> List.flatten
