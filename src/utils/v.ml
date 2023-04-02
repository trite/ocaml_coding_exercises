(* let verify x = assert x *)

let verify yday failure_message x =
  if x then () else failwith (failure_message yday)


let p1test yday = yday ^ " p1 test data failed"

let p1data yday = yday ^ " p1 actual data failed"

let p2test yday = yday ^ " p2 test data failed"

let p2data yday = yday ^ " p2 actual data failed"
