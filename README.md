# ExWaca

Elixir Whatsapp Cloud API SDK

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_waca` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_waca, "~> 0.1.0"}
  ]
end
```

Get the dependencies:

```bash
mix deps.get
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_waca>.

## Quick Start

Setup ENV variables

```bash
cp .env.sample .env
```

```bash
iex -S mix
```

```elixir
access_token = "TODO: Set me up"
sender_id = "TODO: Set me up"
recipient_number = "TODO: Set me up"

client = ExWaca.Client.client(access_token)
ExWaca.APIs.Messages.send_text(
  sender_id: sender_id,
  recipient_number: recipient_number,
  message: "Hello from ExWaca",
  client: client
)
```

## Generate docs

```bash
mix docs
```

Host the docs:

```bash
npx serve doc
```

## Run tests

```bash
source .env.sample
mix test --cover
```

Host the coverage:

```bash
npx serve cover
```
