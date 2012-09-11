class AddAcsUidToUser < ActiveRecord::Migration
  def change
    add_column :users, :acs_uid, :string
  end
end
