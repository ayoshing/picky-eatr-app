class RemoveCuisineIdFromPreferences < ActiveRecord::Migration[5.1]
  def change
    remove_column :preferences, :cuisine_id
  end
end
