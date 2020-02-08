defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "My first item",
      description: "A tasty item sure to please",
      ends_at: ~N[2020-02-10 00:00:00]
    },
    %Item{
      id: 2,
      title: "Inception BluRay",
      description: "I heard you like movies so I put a movie in your movie.",
      ends_at: ~N[2020-02-02 02:20:02]
    },
    %Item{
      id: 3,
      title: "Blind Guardian - Nightfall in Middle-Earth",
      description: "A tale from the bards in the twilight hall",
      ends_at: ~N[2030-03-03 03:30:03]
    }
  ]

  # Return all Items
  def all(Item), do: @items

  # Return Item by id
  def get!(Item, id) do
    Enum.find(@items, fn item -> item.id === id end)
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn item ->
      Enum.all?(Map.keys(attrs), fn key ->
        Map.get(item, key) === attrs[key]
      end)
    end)
  end
end
