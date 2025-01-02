# BrowserVM

## Getting started
Before starting, make sure that you have the following:
* Elixir and BEAM installed
* A running local instance of postgres, with credentials matching whats expected inside `config/test.exs`

Now pull the repository and run:

```bash
mix deps.get
```
Followed by:

```bash
mix ash.setup
```
Which will setup the database.

You can now run the application with:
```bash
mix phx.server
```

or the following if you want an interactive shell:

```bash
iex -S mix phx.server
```

You can run tests by executing:
```bash
mix test
```

## Working with the database
This project uses `Ash` as a framework to manage it's resources. Whenever you generate a migration, Ash snapshots the code so that it can calculate a diff for future code changes. After changing your resource code you can generate a migration by running:

```bash
mix ash.codegen $MIGRATION_NAME
```

And then (as we did at the beginning) you can run the following command to get the database up to date:

```bash
mix ash.setup
```