defmodule Clhn.Formatter do
  @max_columns 220

  def print_one_story(story) do
    metadata = make_first_line(story)

    separator = separator_line("-")
    full_separator = separator_line("-", true)

    title = make_line("(#{story["score"]}) " <> story["title"])
    url = make_line(story["url"])
    lines = [title, url]

    print_lines lines
  end

  def separator_line(separator, full \\ false)
  def separator_line(separator, full) when full do
    width = max_width()
    String.duplicate(separator, width - 1)
  end

  def separator_line(separator, _) do
    width = max_width()
    middle = String.duplicate(separator, width - 5)
    make_line(middle)
  end

  def max_width do
    term_width = Clhn.Utils.get_term_width
    min(term_width, @max_columns)
  end

  def make_line(field) when not is_list field do
    make_line [field]
  end

  def make_line fields_list do
    stuff = Enum.join(fields_list, " | ")
    left = "| " <> stuff
    right_padding = max_width() - String.length(left) - 1
    right = 
      cond do
        right_padding < 0 -> ""
        true -> String.pad_leading("|", right_padding)
      end
    left <> right
  end

  def make_first_line story do
    score = "Score: " <> Integer.to_string story["score"]
    time = "Date: " <> prettify_time story["time"]
    author = "Author: " <> story["by"]
    make_line [score, time, author]
  end

  def prettify_time unix_time do
    {:ok, t} = DateTime.from_unix unix_time
    DateTime.to_string t
  end

  def print_lines lines do
    Enum.map(lines, &IO.puts/1)
    IO.puts "\n\r"
    :ok
  end

end
