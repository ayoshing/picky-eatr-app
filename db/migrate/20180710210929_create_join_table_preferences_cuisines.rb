class CreateJoinTablePreferencesCuisines < ActiveRecord::Migration[5.1]
  def change
    create_table :cuisines_preferences do |t|
      t.integer :cuisine_id
      t.integer :preference_id
    end 
  end
end
