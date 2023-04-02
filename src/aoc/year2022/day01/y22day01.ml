open Fn

let day = "y22day01"

let data = Fs.read_lines "src/aoc/year2022/day01/data.txt"

let test = Fs.read_lines "src/aoc/year2022/day01/test.txt"

let group_calories =
  Lst.split_on_value ""
  >> Lst.map
       (Lst.map int_of_string_opt >> Lst.keep_somes_ditch_nones >> Lst_int.sum)


(* Part 1 *)
let most_calories = group_calories >> Lst_int.max

let () = most_calories test = 24000 |> V.verify_p1_test day

let () = most_calories data = 72017 |> V.verify_p1_data day

(* Part 2 *)
let sum_top_x_calories x lst =
  lst |> group_calories |> Lst_int.sort |> Lst.rev |> Lst.take x |> Lst_int.sum


let () = sum_top_x_calories 3 test = 45000 |> V.verify_p2_test day

let () = sum_top_x_calories 3 data = 212520 |> V.verify_p2_data day
