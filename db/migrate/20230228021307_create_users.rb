class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.text :password
      t.text :token
      t.datetime :expire_at
      t.boolean :logged_in, default: false
      

      t.timestamps
    end
  end
end
