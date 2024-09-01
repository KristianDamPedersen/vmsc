# VMSC - VM's for School Chromebooks
> Pronounced "Wimsy"

## Purpose
To combat the ever-increasing lock-in forced on students across the world.
This project aims to provide login-free browser based access to fully fledged Linux virtual machines,
to be used in classrooms and other educational settings.

## Getting started with local development
To get started developing locally, first make sure you have the prerequisite Docker, Elixir and Erlang/OTP runtimes installed.
We start by installing the dependencies for the project:
```bash
mix deps.get
```

We then need to configure the appropriate environment variables.
First create the .env file, by copying the provided template:
```bash
cp .dev.env.template .dev.env
```

The postgres settings should be set as follows:
```bash
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=vmsc_dev
```
> This is obviously just for local development, we use proper secrets in production.

The `DATABASE_URL` is a combination of some of the information above, and for local development is set as such:
```bash
DATABASE_URL=ecto://postgres:postgres@db/vmsc_dev
```
Lastly we need to generate a secret key that gets used for some encryption behind the scenes, to get the key you can run
```bash
mix phx.gen.secret
```
This secret can then be copied into the `SECRET_KEY_BASE` field in the environment file. After this you should be able to
compose the application by running `docker compose -f docker-compose-dev.yml up -d`.

### Using hot reloading
It is often more convenient to develop the application outside of Docker, in order to take advantage of hot reloading, debugging and other non-production features.
To do this you have to export all the variables we defined into your shell, and then you should be able to run the following command to run the server.
```bash
mix phx.server
```

## Installation and setup
To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
