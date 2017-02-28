defmodule Clhn.Formatter do
  @max_columns 150

  def print_one_story(story) do
    metadata = make_first_line(story)

    title = make_line("(#{story["score"]}) " <> story["title"])
    url = make_line(story["url"])
    conversation = make_line(conversation_of(story))
    lines = [title, url, conversation]

    print_lines lines
  end

  def conversation_of story do
    "https://news.ycombinator.com/item?id=" <> Integer.to_string(story["id"])
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
    "| " <> stuff
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
