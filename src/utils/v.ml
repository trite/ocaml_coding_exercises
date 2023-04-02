(* Custom functions for verification/assertion *)

let verify yday failure_message x =
  if x then () else failwith (failure_message yday)


let p1test yday = yday ^ " p1 test data failed"

let p1data yday = yday ^ " p1 actual data failed"

let p2test yday = yday ^ " p2 test data failed"

let p2data yday = yday ^ " p2 actual data failed"

let verify_p1_test yday = verify yday p1test

let verify_p1_data yday = verify yday p1data

let verify_p2_test yday = verify yday p2test

let verify_p2_data yday = verify yday p2data
