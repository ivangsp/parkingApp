defmodule ParkingApp.User do
  use ParkingApp.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :ecrypted_password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :password, :ecrypted_password])
    |> validate_required([:username, :email, :password, :ecrypted_password])
  end
end
