defmodule ParkingApp.Repo.Migrations.CreateBooking do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :parkings_id, references(:parkings, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:bookings, [:parkings_id])
    create index(:bookings, [:user_id])
  end
end
