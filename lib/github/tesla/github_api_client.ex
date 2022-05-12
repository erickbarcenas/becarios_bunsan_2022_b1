defmodule GitHubApiWrapper.Client do
  @adapter Tesla.Adapter.Hackney

  defp system_env_token(),
    do:
      Application.get_env(:becarios_bunsan_2022_b1, GitHubApiWrapper.Client)
      |> Enum.at(0)
      |> elem(1)
      |> String.trim()

  def new_client(token \\ system_env_token()) do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.github.com"},
      {Tesla.Middleware.Timeout, timeout: 10000},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers,
       [
         {"Authorization", "token #{token}"},
         {"Content-Type", "application/json"}
       ]}
    ]

    Tesla.client(middleware, @adapter)
  end

  def get(url) do
    Tesla.get(new_client(), url)
  end
end
