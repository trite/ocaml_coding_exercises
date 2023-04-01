(* words and stuff and things and more this line needs to be quite long to test
   things out properly... *)
let data = Utils.Fs.read_lines "lib/aoc/year2022/day01_data.txt"

let test = Utils.Fs.read_lines "lib/aoc/year2022/day01_test.txt"

let split = test |> List.partition (( = ) "")
