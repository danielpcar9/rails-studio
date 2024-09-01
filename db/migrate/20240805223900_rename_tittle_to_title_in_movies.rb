class RenameTittleToTitleInMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :tittle, :title
  end
end
