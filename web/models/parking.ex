defmodule ParkingApp.Parking do
  use ParkingApp.Web, :model

  schema "parkings" do
    field :name, :string
    field :fare, :float
    field :lat,  :float
    field :lng,  :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :fare, :lat, :lng])
    |> validate_required([:name, :fare, :lat, :lng])
  end
end
