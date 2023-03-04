class CreatePlayerperformances < ActiveRecord::Migration[7.0]
  def change
    create_table :playerperformances do |t|
      t.text :matches_played
      t.text :runs
      t.text :fifties
      t.text :average
      t.references :player, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
