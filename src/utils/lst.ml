let ( >> ) = Fn.( >> )

let split_on_value split_on to_split =
  let rec go acc curr split_on to_split =
    match to_split with
    | [] ->
        Stdlib.List.rev (curr :: acc)
    | hd :: tl when hd = split_on ->
        go (Stdlib.List.rev curr :: acc) [] split_on tl
    | hd :: tl ->
        go acc (hd :: curr) split_on tl
  in
  go [] [] split_on to_split


let take x lst = Core.List.take lst x
