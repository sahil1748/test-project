class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :username
      t.text :password
      t.text :email
      t.text :phoneno
      t.text :address

      t.timestamps
    end
  end
end
