defmodule Clhn.Formatter do
  @max_columns 150

  def print_one_story(story) do
    title = [:orange, :bright, "(#{story["score"]}) ", story["title"]]
    url = ["|>  ", story["url"]]
    lines = [title, url]

    print_lines lines
  end

  def max_width do
    term_width = Clhn.Utils.get_term_width
    min(term_width, @max_columns)
  end

  def print_lines lines do
    Enum.map(lines, &Bunt.puts/1)
    IO.puts "\n\r"
    :ok
  end

end
