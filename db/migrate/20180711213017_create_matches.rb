class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :cuisine_id
      t.integer :challenger_id
      t.timestamps
    end
  end
end
