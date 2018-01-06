defmodule ParkingApp.UserTest do
  use ParkingApp.ModelCase

  alias ParkingApp.User

  @valid_attrs %{"": "some ", ecrypted_password: "some ecrypted_password", email: "some email", password: "some password", username: "some username"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
