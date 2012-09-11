class AddAcsIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :acs_id, :string
  end
end
