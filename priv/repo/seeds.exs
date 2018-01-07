alias ParkingApp.{Parking, Repo}


[%{name: "Vanemuise 3", size: 4, fare: 1.2},
  %{name: "Raatuse 22", size: 2, fare: 0.6},
%{name: "J. Liivi", size: 1, fare: 0.8},
%{name: "Kaubamaja", size: 3, fare: 1.0},
%{name: "Lõunakeskus", size: 2, fare: 2.0}]
|> Enum.map(fn parking-> Parking.changeset(%Parking{}, parking) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)