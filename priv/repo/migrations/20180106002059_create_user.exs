defmodule ParkingApp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :password, :string
      add :ecrypted_password, :string
      timestamps()
    end
  end
end
