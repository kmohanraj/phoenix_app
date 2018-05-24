defmodule PhoenixApp.Model.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
