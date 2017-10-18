# Parseus

***Legendary Elixir parser to tame all your input enumerables for good***

Features:

- parse nested maps, keyword lists and lists with syntax similar to `Ecto.Changeset`
- compose parsing functions for compact and reusable parser code
- cast a set of allowed fields out of untrusted input data
- parse and validate input data with built-in or custom parsers and checks
- collect and add errors at any level of nested structures
- map and track errors back to original input structures

## Getting Started

Add `parseus` as a dependency to your project in `mix.exs`:

```elixir
defp deps do
  [{:parseus, "~> x.x.x"}]
end
```

Then run `mix deps.get` to fetch it.

## Documentation

Visit documentation on [HexDocs](https://hexdocs.pm/parseus) for a complete API reference.
