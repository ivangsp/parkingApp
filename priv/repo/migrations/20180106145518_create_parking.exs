defmodule ParkingApp.Repo.Migrations.CreateParking do
  use Ecto.Migration

  def change do
    create table(:parkings) do
      add :name, :string
      add :fare, :float
      add :size, :integer
      timestamps()
    end

  end
end
