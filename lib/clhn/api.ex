defmodule Clhn.API do

  @base_hn_url "https://hacker-news.firebaseio.com/v0/"
  @base_hn_comments_url "https://news.ycombinator.com/item?id="
  @item_url @base_hn_url <> "item/"
  @topstories "topstories.json"
  @beststories "beststories.json"
  @newstories "newstories.json"

  def get_stories {type, count} do
    url = @base_hn_url <> get_type(type)

    [:color202, :bright, loading_message({type, count})]
    |> Bunt.puts

    handle_response(HTTPoison.get(url), count)
  end

  def handle_response({:ok, response}, count) do
    {:ok, story_ids} = Poison.decode(response.body)

    story_ids
    |> Enum.take(count)
    |> Clhn.Utils.pmap(&get_one_item/1)  # make sure we fetch them asynchronously
  end

  def handle_response({:error, _}, _) do
    :error
  end

  def loading_message {type, count} do
    case type do
      "top" -> "Fetching #{count} top stories from Hacker News...\n"
      "new" -> "Fetching #{count} new stories from Hacker News...\n"
      "best" -> "Fetching #{count} best stories from Hacker News...\n"
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

  def build_conversation_url(item_id) when is_integer(item_id) do
    build_conversation_url(Integer.to_string(item_id))
  end

  def build_conversation_url(item_id) do
    @base_hn_comments_url <> item_id
  end

  def get_one_item(id) do
    url = make_item_url(id)
    {:ok, response} = HTTPoison.get(url)
    {:ok, body} = Poison.decode(response.body)

    case Map.get(body, "url") do
      nil -> Map.put(body, "url", build_conversation_url(id))
      _ -> body
    end
  end

end
