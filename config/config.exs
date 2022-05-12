# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
# import Config

# config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

import Config

config :becarios_bunsan_2022_b1, GitHubApiWrapper.Client,
  github_personal_access_token: System.get_env("github_personal_access_token")
