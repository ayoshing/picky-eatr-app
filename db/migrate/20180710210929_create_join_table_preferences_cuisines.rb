class CreateJoinTablePreferencesCuisines < ActiveRecord::Migration[5.1]
  def change
    create_join_table :preferences, :cuisines do |t|
      t.index [:preference_id, :cuisine_id]
      t.index [:cuisine_id, :preference_id]
    end
  end
end
