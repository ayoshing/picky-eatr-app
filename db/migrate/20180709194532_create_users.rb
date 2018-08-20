class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
<<<<<<< HEAD
      t.string :name
      t.string :user_name
      t.string :address
      t.string :password_digest
=======
      t.string 'username'
      t.string 'name'
      t.string 'password_digest'
      t.string 'address'
>>>>>>> final-countdown
      t.timestamps
    end
  end
end
