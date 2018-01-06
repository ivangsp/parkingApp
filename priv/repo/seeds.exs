alias ParkingApp.{Parking, Repo}


[%{name: "Vanemuise 3", size: 4, fare: 1.2},
  %{name: "Raatuse 22", size: 2, fare: 0.6}]
|> Enum.map(fn parking-> Parking.changeset(%Parking{}, parking) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)