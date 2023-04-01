let something = Utils.Fs.read_file "lib/aoc/day01/day01.txt"

let () = something = "abc123" |> Utils.Verify.verify