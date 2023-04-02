open Fn

let day = "y22day03"

let data = Fs.read_lines "src/aoc/year2022/day03/data.txt"

let test = Fs.read_lines "src/aoc/year2022/day03/test.txt"

let string_to_list = String.to_seq >> List.of_seq

let find_shared_item_p1 (a, b) =
  a
  |> string_to_list
  |> List.filter (fun x -> b |> string_to_list |> List.mem x)
  |> List.hd


let char_code_to_priority x =
  match x with
  | x when x >= 97 && x <= 122 ->
      x - 96
  | x when x >= 65 && x <= 90 ->
      x - 38
  | _ ->
      failwith "invalid character code"


let string_split_at index str =
  ( Core.String.slice str 0 index
  , Core.String.slice str index (str |> Core.String.length) )


let get_priority_p1 x =
  x
  |> string_split_at ((x |> Core.String.length) / 2)
  |> find_shared_item_p1
  |> Char.code
  |> char_code_to_priority


let part1 = List.map get_priority_p1

let do_work part = part >> Lst_int.sum

let remove_duplicates str =
  let go acc curr = if List.mem curr acc then acc else curr :: acc in
  List.fold_left go [] str |> List.rev


let char_list_to_string = List.to_seq >> String.of_seq

let find_shared_item_p2 (a, b, c) =
  let find_shared_items a b =
    a
    |> string_to_list
    |> List.filter (fun x -> b |> string_to_list |> List.mem x)
    |> remove_duplicates
    |> char_list_to_string
  in
  a |> find_shared_items b |> find_shared_items c


let to_tuple_3 = function
  | [a; b; c] ->
      (a, b, c)
  | _ ->
      failwith "Cannot convert array to Tuple3 - invalid input"


let chunk_to_priority =
  to_tuple_3
  >> find_shared_item_p2
  >> string_to_list
  >> List.hd
  >> Char.code
  >> char_code_to_priority


let part2 lst = Core.List.chunks_of lst ~length:3 |> List.map chunk_to_priority

(* Part 1 *)
let () = do_work part1 test = 157 |> O.verify day O.p1test

let () = do_work part1 data = 7850 |> O.verify day O.p1test

(* Part 2 *)
let () = do_work part2 test = 70 |> O.verify day O.p1test

let () = do_work part2 data = 2581 |> O.verify day O.p1test
