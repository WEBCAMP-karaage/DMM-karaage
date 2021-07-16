class ChangeGenrusToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_table :genrus, :genres
  end
end
