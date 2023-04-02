open Fn

let data = Fs.read_lines "src/aoc/year2022/day02/data.txt"

let test = Fs.read_lines "src/aoc/year2022/day02/test.txt"

type move = Rock | Paper | Scissors

let move_to_score = function Rock -> 1 | Paper -> 2 | Scissors -> 3

type outcome = Lose | Draw | Win

let outcome_to_score = function Lose -> 0 | Draw -> 3 | Win -> 6

let parse_move = function
  | "A" | "X" ->
      Rock
  | "B" | "Y" ->
      Paper
  | "C" | "Z" ->
      Scissors
  | _ ->
      failwith "Cannot parse move"


let parse_string =
  String.split_on_char ' '
  >> function
  | a :: b :: _rest ->
      (a |> parse_move, b |> parse_move)
  | _ ->
      failwith "Cannot parse string"


let do_work calculation data =
  data |> List.map (parse_string >> calculation) |> Lst_int.sum


let calculate_part1 (opponent, self) =
  let result =
    match (opponent, self) with
    | Rock, Rock | Paper, Paper | Scissors, Scissors ->
        Draw
    | Rock, Paper | Paper, Scissors | Scissors, Rock ->
        Win
    | Rock, Scissors | Paper, Rock | Scissors, Paper ->
        Lose
  in
  (self |> move_to_score) + (result |> outcome_to_score)


let convert_move_to_outcome = function
  | Rock ->
      Lose
  | Paper ->
      Draw
  | Scissors ->
      Win


let lose_to = function Rock -> Scissors | Paper -> Rock | Scissors -> Paper

let win_against = function
  | Rock ->
      Paper
  | Paper ->
      Scissors
  | Scissors ->
      Rock


let calculate_part2 (opponent, self) =
  match self |> convert_move_to_outcome with
  | Lose ->
      (Lose |> outcome_to_score) + (opponent |> lose_to |> move_to_score)
  | Draw ->
      (Draw |> outcome_to_score) + (opponent |> move_to_score)
  | Win ->
      (Win |> outcome_to_score) + (opponent |> win_against |> move_to_score)


(* Part 1 *)
let () = do_work calculate_part1 test = 15 |> O.verify "y22day02" O.p1test

let () = do_work calculate_part1 data = 8933 |> O.verify "y22day02" O.p1data

(* Part 2 *)
let () = do_work calculate_part2 test = 12 |> O.verify "y22day02" O.p2test

let () = do_work calculate_part2 data = 11998 |> O.verify "y22day02" O.p2data
