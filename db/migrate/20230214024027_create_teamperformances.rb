class CreateTeamperformances < ActiveRecord::Migration[7.0]
  def change
    create_table :teamperformances do |t|
      t.text :matches_played
      t.text :won
      t.text :loss
      t.text :points
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
