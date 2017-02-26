defmodule Clhn.API do

  @base_hn_url "https://hacker-news.firebaseio.com/v0/"
  @item_url @base_hn_url <> "item/"
  @topstories "topstories.json"
  @beststories "beststories.json"
  @newstories "newstories.json"

  def get_stories {type, count} do
    url = @base_hn_url <> get_type(type)
    IO.puts loading_message({type, count})
    {:ok, response} = HTTPoison.get(url)
    {:ok, best_ids} = Poison.decode(response.body)
    best_ids
    |> Enum.take(count)
    |> Clhn.Utils.pmap(&get_one_item/1)  # make sure we fetch them asynchronously
  end

  def loading_message {type, count} do
    case type do
      "top" -> "Fetching #{count} top stories..."
      "new" -> "Fetching #{count} new stories..."
      "best" -> "Fetching #{count} best stories..."
    end
  end

  def get_type type do
    case type do
      "top" -> @topstories
      "new" -> @newstories
      "best" -> @beststories
    end
  end

  def make_item_url(id) when is_integer(id) do
    @item_url <> Integer.to_string(id) <> ".json"
  end
  def make_item_url(id) when is_binary(id) do
    @item_url <> id <> ".json"
  end

  def get_one_item(id) do
    url = make_item_url(id)
    {:ok, response} = HTTPoison.get(url)
    {:ok, body} = Poison.decode(response.body)
    body
  end

end
