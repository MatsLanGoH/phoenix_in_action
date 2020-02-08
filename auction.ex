defmodule Auction.Item do
  defstruct [:id, :title, :description, :ends_at]
end

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
end

defmodule Auction do
  alias Auction.{FakeRepo, Item}

  @repo FakeRepo
  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end
end
