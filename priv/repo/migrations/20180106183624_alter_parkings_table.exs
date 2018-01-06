defmodule ParkingApp.Repo.Migrations.AlterParkingsTable do
  use Ecto.Migration

  def change do
    alter table(:parkings) do
      add :occupied, :integer, default: 0
    end
  end
end
