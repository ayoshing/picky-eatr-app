class AddCuisineIdsToPreferences < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :cuisine_ids, :string, array: true
  end
end
