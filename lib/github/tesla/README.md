# Tesla - Github API Client

```
export github_personal_access_token="your_github_personal_access_token"
echo $github_personal_access_token
```

```
iex -S Mix
```

```elixir
iex> GithubApiWrapper.user_repos("erickbarcenas")
"Erick I Bárcenas M"
```

```elixir
iex> GithubApiWrapper.repo_info("erickbarcenas", "becarios_bunsan_2022_b1")
%{commits: 30, languages: ["Elixir", "Euphoria"], name: "Erick I Bárcenas M"}
```
