let ( >> ) = Fn.( >> )

(* Centralizing reused functions *)

let take x lst = Core.List.take lst x

let head = Core.List.hd

let filter f lst = Core.List.filter ~f lst

let mem = List.mem

let map = List.map

let chunk length lst = Core.List.chunks_of lst ~length

let rev = List.rev

let length = List.length

(* Custom functions *)

let split_on_value split_on to_split =
  let rec go acc curr split_on to_split =
    match to_split with
    | [] ->
        Stdlib.List.rev (Stdlib.List.rev curr :: acc)
    | hd :: tl when hd = split_on ->
        go (Stdlib.List.rev curr :: acc) [] split_on tl
    | hd :: tl ->
        go acc (hd :: curr) split_on tl
  in
  go [] [] split_on to_split


let remove_duplicates lst =
  let go acc curr = if List.mem curr acc then acc else curr :: acc in
  List.fold_left go [] lst |> List.rev


let to_tuple_2 = function [a; b] -> Some (a, b) | _ -> None

let to_tuple_3 = function [a; b; c] -> Some (a, b, c) | _ -> None

let keep_somes_ditch_nones lst = lst |> List.map Option.to_list |> List.flatten
