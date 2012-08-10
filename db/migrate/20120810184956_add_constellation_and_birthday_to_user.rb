class AddConstellationAndBirthdayToUser < ActiveRecord::Migration
  def change
    add_column :users, :constellation, :integer
    add_column :users, :birthday, :date
  end
end
