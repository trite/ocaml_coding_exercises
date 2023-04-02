open Fn

let day = "y22day04"

let data = Fs.read_lines "src/aoc/year2022/day04/data.txt"

let test = Fs.read_lines "src/aoc/year2022/day04/test.txt"

let parse =
  Str.split_on_value ','
  >> Lst.map
       ( Str.split_on_value '-'
       >> Lst.map int_of_string
       >> Lst.to_tuple_2
       >> Opt.get_or_failwith "parse failure on '-'" )
  >> Lst.to_tuple_2
  >> Opt.get_or_failwith "parse failure on ','"


let p1_fully_contains ((a1, a2), (b1, b2)) =
  (a1 <= b1 && a2 >= b2) || (b1 <= a1 && b2 >= a2)


let p2_overlaps ((a1, a2), (b1, b2)) =
  (a1 <= b2 && a2 >= b1) || (b1 <= a2 && b2 >= a1)


let do_work comparison data =
  data |> Lst.filter (parse >> comparison) |> Lst.length


let () = do_work p1_fully_contains test = 2 |> V.verify_p1_test day

let () = do_work p1_fully_contains data = 576 |> V.verify_p1_data day

let () = do_work p2_overlaps test = 4 |> V.verify_p2_test day

let () = do_work p2_overlaps data = 905 |> V.verify_p2_data day
