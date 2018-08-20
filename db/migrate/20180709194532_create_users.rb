class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string 'username'
      t.string 'name'
      t.string 'password_digest'
      t.string 'address'
      t.timestamps
    end
  end
end
