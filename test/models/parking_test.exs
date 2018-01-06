defmodule ParkingApp.ParkingTest do
  use ParkingApp.ModelCase

  alias ParkingApp.Parking

  @valid_attrs %{fare: 120.5, name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Parking.changeset(%Parking{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Parking.changeset(%Parking{}, @invalid_attrs)
    refute changeset.valid?
  end
end
