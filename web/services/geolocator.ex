defmodule ParkingApp.Geolocator do
  @http_client Application.get_env(:parking_app, :http_client)

  def durations_for(origins, destination) do
    origins = origins
              |> Enum.map(fn loc -> loc<>" Tartu Estonia" end) # Complete taxi location
              |> Enum.join("|") # Concatenate all the taxi locations with "|" as separator
    destination = destination <> " Tartu Estonia" # Complete pickup address
    url = URI.encode("http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origins}&destinations=#{destination}")
    %{body: body} = @http_client.get!(url)

    # Parse the body of the HTTP response (JSON)
    %{"rows" => rows} = Poison.Parser.parse!(body) # We are interested only in the rows
    Enum.map(rows, fn row ->
      duration = Map.get(row, "elements") |> List.first |> Map.get("duration")
      {duration["text"], duration["value"]}  # We keep both duration as text (minutes) and also as value (secs)
    end)
  end
end