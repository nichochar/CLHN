defmodule Clhn do

  def main(argv) do
    {type, count} = Clhn.CLI.parse_args(argv)
    stories = Clhn.API.get_stories({type, count})
    Enum.map(stories, &Clhn.Formatter.print_one_story/1)
  end

end
