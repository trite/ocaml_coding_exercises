let read_file file = In_channel.with_open_bin file In_channel.input_all

let read_lines file =
  let contents = In_channel.with_open_bin file In_channel.input_all in
  String.split_on_char '\n' contents
