

# Cliente del API de Github
```
iex -S Mix
```

```
iex> Github.                                  
becarios_bunsan_2022_b1/0
...
```

```
iex> Map.get(repo, "html_url")            
"https://github.com/erickbarcenas/becarios_bunsan_2022_b1"
```

```
iex> repo = Github.becarios_bunsan_2022_b1
%{
  "labels_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/labels{/name}",
  "keys_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/keys{/key_id}",
  "fork" => false,
  "owner" => %{
    "avatar_url" => "https://avatars.githubusercontent.com/u/42219451?v=4",
    "events_url" => "https://api.github.com/users/erickbarcenas/events{/privacy}",
    "followers_url" => "https://api.github.com/users/erickbarcenas/followers",
    "following_url" => "https://api.github.com/users/erickbarcenas/following{/other_user}",
    "gists_url" => "https://api.github.com/users/erickbarcenas/gists{/gist_id}",
    "gravatar_id" => "",
    "html_url" => "https://github.com/erickbarcenas",
    "id" => 42219451,
    "login" => "erickbarcenas",
    "node_id" => "MDQ6VXNlcjQyMjE5NDUx",
    "organizations_url" => "https://api.github.com/users/erickbarcenas/orgs",
    "received_events_url" => "https://api.github.com/users/erickbarcenas/received_events",
    "repos_url" => "https://api.github.com/users/erickbarcenas/repos",
    "site_admin" => false,
    "starred_url" => "https://api.github.com/users/erickbarcenas/starred{/owner}{/repo}",
    "subscriptions_url" => "https://api.github.com/users/erickbarcenas/subscriptions",
    "type" => "User",
    "url" => "https://api.github.com/users/erickbarcenas"
  },
  "hooks_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/hooks",
  "id" => 466216025,
  "teams_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/teams",
  "full_name" => "erickbarcenas/becarios_bunsan_2022_b1",
  "git_commits_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/git/commits{/sha}",
  "default_branch" => "main",
  "downloads_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/downloads",
  "stargazers_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/stargazers",
  "blobs_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/git/blobs{/sha}",
  "collaborators_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/collaborators{/collaborator}",
  "node_id" => "R_kgDOG8nkWQ",
  "watchers_count" => 0,
  "notifications_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/notifications{?since,all,participating}",
  "compare_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/compare/{base}...{head}",
  "trees_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/git/trees{/sha}",
  "clone_url" => "https://github.com/erickbarcenas/becarios_bunsan_2022_b1.git",
  "has_downloads" => true,
  "subscription_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/subscription",
  "url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1",
  "statuses_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/statuses/{sha}",
  "milestones_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/milestones{/number}",
  "svn_url" => "https://github.com/erickbarcenas/becarios_bunsan_2022_b1",
  "events_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/events",
  "updated_at" => "2022-03-04T17:39:29Z",
  "created_at" => "2022-03-04T17:38:37Z",
  "html_url" => "https://github.com/erickbarcenas/becarios_bunsan_2022_b1",
  "archived" => false,
  "allow_forking" => true,
  "pulls_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/pulls{/number}",
  "mirror_url" => nil,
  "has_projects" => true, 
  "has_wiki" => true,
  "topics" => [],
  "language" => "Elixir",
  "contributors_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/contributors",
  "issue_events_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/issues/events{/number}",
  "forks" => 0,
  "merges_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/merges",
  "deployments_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/deployments",
  "visibility" => "public",
  "assignees_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/assignees{/user}",
  "git_url" => "git://github.com/erickbarcenas/becarios_bunsan_2022_b1.git",
  "forks_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/forks",
  "tags_url" => "https://api.github.com/repos/erickbarcenas/becarios_bunsan_2022_b1/tags",
  "open_issues" => 0,
  "size" => 51,
  ...
}
```

```
iex> Map.get(repo, "html_url")            
"https://github.com/erickbarcenas/becarios_bunsan_2022_b1"
```

```
iex> Github.go(:becarios_bunsan_2022_b1)
Launching browser to https://github.com/erickbarcenas/becarios_bunsan_2022_b1...
[45309:45309:0316/141120.222066:ERROR:sandbox_linux.cc(377)] InitializeSandbox() called with multiple threads in process gpu-process.
  {"Opening in existing browser session.\n", 0}
```