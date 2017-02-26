defmodule Clhn.CLI do
  @defaultcount 10
  @defaulttype "top"

  def parse_args argv do
    clean_args(argv)
  end

  def clean_args([]) do
    {@defaulttype, @defaultcount}
  end

  def clean_args(argv) when length(argv) > 2 do
    IO.puts """
    ERROR
    -----
    Too many options passed.

    USAGE
    -----
    $ ./hn [top | best | new] [count | 10]

    EXAMPLES
    --------
    $ ./hn
    $ ./hn top  # Default to 10
    $ ./hn top 5
    """
    System.halt(0)
  end

  def clean_args(argv) when length(argv) == 1 do
    [ one | _ ] = argv
    case Integer.parse(one) do
      :error ->      {one, @defaultcount}
      {count, _} -> {@defaulttype, count}
    end
  end

  def clean_args(argv) when length(argv) == 2 do
    [ one , two ] = argv
    case Integer.parse(one) do
      :error -> {one, String.to_integer(two)}
      {count, _} -> {two, count}
    end
  end


end
