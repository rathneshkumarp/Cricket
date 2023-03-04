class AddNewFieldToTournaaments < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaaments, :match_date, :text
  end
end
