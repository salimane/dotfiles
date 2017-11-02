timestamp = fn -> 
  {_date, {hour, minute, _second}} = :calendar.local_time
  [hour, minute]
  |> Enum.map(&(String.pad_leading(Integer.to_string(&1), 2, "0")))
  |> Enum.join(":")
end

Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(default_prompt: "\r" <>
  IO.ANSI.blue    <> "λ" <>
  IO.ANSI.cyan    <> "(%counter)" <>
  IO.ANSI.magenta <> ":" <> IO.ANSI.reset)

IEx.configure(alive_prompt: "\r" <>
  IO.ANSI.green   <> "%node:" <>
  IO.ANSI.blue    <> "λ" <>
  IO.ANSI.cyan    <> "(%counter)" <>
  IO.ANSI.magenta <> ":" <> IO.ANSI.reset)

IEx.configure(
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_black,
      boolean: :red, 
      nil: [:magenta, :bright],
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
    eval_result: [:green, :bright] ,
    eval_error: [[:red,:bright,"Bug Bug ..!!"]],
    eval_info: [:yellow, :bright ],
  ],
  default_prompt: 
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset} " <>
    "[#{IO.ANSI.magenta}#{timestamp.()}#{IO.ANSI.reset} " <>
    ":: #{IO.ANSI.cyan}%counter#{IO.ANSI.reset}] >",
  alive_prompt: 
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset} " <>
    "(#{IO.ANSI.yellow}%node#{IO.ANSI.reset}) " <>
    "[#{IO.ANSI.magenta}#{timestamp.()}#{IO.ANSI.reset} " <>
    ":: #{IO.ANSI.cyan}%counter#{IO.ANSI.reset}] >",
  history_size: 5000,
  inspect: [
    pretty: true, 
    limit: :infinity,
    width: 80
  ],
  width: 80
)
