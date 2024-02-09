class RemoveMovieIdFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :movie_id
  end
end
