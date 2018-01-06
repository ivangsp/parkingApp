defmodule ParkingApp.UserController do
  use ParkingApp.Web, :controller
  alias ParkingApp.{User}

  def create(conn, params) do
    changeset =  User.changeset(%User{}, params)

    case Repo.insert(changeset) do
      {:ok, _changeset} ->
        error = false
        status = 200

      {:error, changeset} ->
        eror = true
        status = 401

    end

    conn
    |> put_status(status)
    |> json(%{error: error})
  end


end