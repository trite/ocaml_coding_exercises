open Fn

let day = "y22day03"

let data = Fs.read_lines "src/aoc/year2022/day03/data.txt"

let test = Fs.read_lines "src/aoc/year2022/day03/test.txt"

let find_shared_item_p1 (a, b) =
  a
  |> Str.to_char_list
  |> Lst.filter (fun x -> b |> Str.to_char_list |> Lst.mem x)
  |> Lst.head
  |> Opt.get_or_failwith "find_shared_item_p1 shouldn't produce an empty list"


let char_code_to_priority x =
  match x with
  | x when x >= 97 && x <= 122 ->
      x - 96
  | x when x >= 65 && x <= 90 ->
      x - 38
  | _ ->
      failwith "invalid character code"


let get_priority_p1 x =
  x
  |> Str.split_at ((x |> Core.String.length) / 2)
  |> find_shared_item_p1
  |> Char.code
  |> char_code_to_priority


let part1 = Lst.map get_priority_p1

let do_work part = part >> Lst_int.sum

let find_shared_item_p2 (a, b, c) =
  let find_shared_items a b =
    a
    |> Str.to_char_list
    |> Lst.filter (fun x -> b |> Str.to_char_list |> Lst.mem x)
    |> Lst.remove_duplicates
    |> Str.from_char_list
  in
  a |> find_shared_items b |> find_shared_items c


let chunk_to_priority =
  Lst.to_tuple_3
  >> Opt.get_or_failwith "chunk_to_priority was fed a list of invalid size"
  >> find_shared_item_p2
  >> Str.to_char_list
  >> Lst.head
  >> Opt.get_or_failwith "chunk_to_priority shouldn't produce an empty list"
  >> Char.code
  >> char_code_to_priority


let part2 = Lst.chunk 3 >> Lst.map chunk_to_priority

(* Part 1 *)
let () = do_work part1 test = 157 |> V.verify_p1_test day

let () = do_work part1 data = 7850 |> V.verify_p1_data day

(* Part 2 *)
let () = do_work part2 test = 70 |> V.verify_p2_test day

let () = do_work part2 data = 2581 |> V.verify_p2_data day
