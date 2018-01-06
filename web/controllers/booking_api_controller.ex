defmodule ParkingApp.BookingController do
  use ParkingApp.Web, :controller
  alias ParkingApp.{Repo, Parking, Booking}

  def searchParkings(conn, param) do
    query = from p in Parking ,
            where: p.size > p.occupied
    Repo.all(query) |> IO.inspect

    
  end
end