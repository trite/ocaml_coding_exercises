open Fn

(* Custom functions *)

let to_char_list = String.to_seq >> List.of_seq

let from_char_list = List.to_seq >> String.of_seq

let split_at index str =
  ( Core.String.slice str 0 index
  , Core.String.slice str index (str |> Core.String.length) )


let from_char c = [c] |> from_char_list

let split_on_value (split_on : char) (to_split : string) : string list =
  to_split
  |> to_char_list
  |> Lst.split_on_value split_on
  |> Lst.map from_char_list
