class RemoveTeamperformanceFromRecord < ActiveRecord::Migration[7.0]
  def change
    remove_teamperformances :matches_played, :won, :loss, :points, :team, foreign_key: true
  end
end
