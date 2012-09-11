class AddAcsPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :acs_password, :string
  end
end
