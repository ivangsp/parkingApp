defmodule ParkingApp.SessionController do

  use ParkingApp.Web, :controller
  alias ParkingApp.{User, Repo, Authentication}

  def login(conn, %{:username => "", :password => ""}) do
    conn
    |> put_status(400)
    |> json(%{error: "username and password can not be empty"})
  end


  def login(conn, %{:username => username, :password => password}) do
    user = Repo.get_by(User, username: username)
    case Authentication.check_credentials(conn, user, password) do
      {:ok, _} ->

        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :token)
        conn
        |> put_status(201)
        |> json(%{token: jwt})

      {:error, _} ->
        IO.inspect "error"
        conn
        |> put_status(400)
        |> json(%{message: "Invalid username or password"})
    end
  end

  def logout(conn, _params) do
    {:ok, claims} = Guardian.Plug.claims(conn)
    conn
    |> Guardian.Plug.current_token
    |> Guardian.revoke!(claims)

    conn
    |> put_status(200)
    |> json(%{msg: "successfully logged out"})
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(403)
    |> json(%{msg: "You are not logged in"})
  end

end