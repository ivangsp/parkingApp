defmodule ParkingApp.Repo.Migrations.AlterUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :password
    end

  end
end
