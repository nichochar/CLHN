defmodule Clhn.Utils do
  def pmap iterable, func do
    iterable
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&Task.await/1)
  end

  @doc"""
  Usually you can simply call :io.columns, but this doesn't work
  with the escript compilation for some reason, see bug here:
  http://stackoverflow.com/questions/42463316/why-does-io-columns-fail-when-running-through-the-escript
  
  Solution is to call the :os.cmd directly
  """
  def get_term_width do
    { result, 0 } = System.cmd("tput", ["cols"])
    result
    |> String.split("\n")
    |> List.first
    |> String.to_integer
  end
end
