defmodule ParkingApp.BookingController do
  use ParkingApp.Web, :controller
  alias ParkingApp.{Repo, Parking, Booking, Geolocator}

  def searchParkings(conn, param) do
    query = from p in Parking ,
            where: p.size > p.occupied
    result = Repo.all(query)
    if(result == nil) do
      parkings =%{}

    else
      distances = Geolocator.getNearestParkings(result, param["destination"])
      result = List.zip([result, distances])

      parkings = Enum.map(result, fn {x, y} ->
        Map.put(%{}, :name, x.name)
        |> Map.put(:spaces, (x.size - x.occupied))
        |> Map.put(:cost, x.fare)
        |> Map.put(:distance, elem(y, 0))
        |> Map.put(:value, elem(y, 1))
      end)
     parkings = Enum.sort_by(parkings, fn x -> x.value  end)

    end

    conn
    |> put_status(200)
    |> json(%{parkings: parkings})
  end
end