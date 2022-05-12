defmodule GithubApiWrapper do
  @moduledoc """
  Documentation for GithubApiWrapper
  """
  alias GitHubApiWrapper.Client

  def user_repos(username) do
    {_ok, response} = Client.get("/users/#{username}")
    Map.get(response, :body)["name"]
  end

  def repo_info(username, repo_name) do
    {_ok, commits_response} = Client.get("/repos/#{username}/#{repo_name}/commits")

    {_ok, lang_response} = Client.get("/repos/#{username}/#{repo_name}/languages")

    %{
      name: user_repos(username),
      commits: Map.get(commits_response, :body) |> Enum.count(),
      languages: Map.get(lang_response, :body) |> Map.keys()
    }
  end
end
