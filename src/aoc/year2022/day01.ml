open Utils.Fn

(* words and stuff and things and more this line needs to be quite long to test
   things out properly... *)
let data = Utils.Fs.read_lines "src/aoc/year2022/day01_data.txt"

let test = Utils.Fs.read_lines "src/aoc/year2022/day01_test.txt"

let keep_somes_ditch_nones lst = lst |> List.map Option.to_list |> List.flatten

let most_calories_test =
  test
  |> Utils.List.split_on_value ""
  |> List.map (List.map int_of_string_opt >> keep_somes_ditch_nones)
