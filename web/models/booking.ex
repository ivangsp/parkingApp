defmodule ParkingApp.Booking do
  use ParkingApp.Web, :model

  schema "bookings" do
    belongs_to :parkings, ParkingApp.Parking, foreign_key: :parkings_id
    belongs_to :users, ParkingApp.User, foreign_key: :users_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
