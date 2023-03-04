class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :token
      t.string :expire_at

      t.timestamps
    end
  end
end
