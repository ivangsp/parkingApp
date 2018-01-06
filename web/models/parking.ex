defmodule ParkingApp.Parking do
  use ParkingApp.Web, :model

  schema "parkings" do
    field :name, :string
    field :fare, :float
    field :size,  :integer
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :fare, :size])
    |> validate_required([:name, :fare, :size])
  end
end
