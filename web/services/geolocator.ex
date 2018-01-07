defmodule ParkingApp.Geolocator do
  @http_client Application.get_env(:parking_app, :http_client)

  def getNearestParkings(origins, destination) do
    origins = origins
              |> Enum.map(fn loc -> loc.name<>" Tartu Estonia" end) # Complete taxi location
              |> Enum.join("|") # Concatenate all the taxi locations with "|" as separator
    destination = destination <> " Tartu Estonia" # Complete pickup address
    url = URI.encode("http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origins}&destinations=#{destination}")
    %{body: body} = @http_client.get!(url)

    # Parse the body of the HTTP response (JSON)
    %{"rows" => rows} = Poison.Parser.parse!(body) # We are interested only in the rows

    output = Enum.map(rows, fn row ->
        Map.get(row, "elements")
        |> Enum.map(fn x ->
          result = Map.get(x, "distance")
          {Map.get(result, "text"), Map.get(result, "value")}
        end)
    end)
    IO.inspect output
    output |> List.flatten |> IO.inspect
  end

end