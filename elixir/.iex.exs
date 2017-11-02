
Application.put_env(:elixir, :ansi_enabled, true)

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
    eval_error: [[:red,:bright]],
    eval_info: [:yellow, :bright ],
  ],
  default_prompt: 
    "\r" <>
    IO.ANSI.magenta <> "λ☿" <>
    IO.ANSI.magenta <> "⚡ " <> IO.ANSI.reset,
  alive_prompt: 
    "\r" <>
    IO.ANSI.green <> "%node" <>
    "\n" <>
    IO.ANSI.magenta <> "λ☿" <>
    IO.ANSI.magenta <> "⚡ " <> IO.ANSI.reset,
  history_size: 5000,
  inspect: [
    pretty: true, 
    limit: :infinity,
    width: 80
  ],
  width: 80
)
