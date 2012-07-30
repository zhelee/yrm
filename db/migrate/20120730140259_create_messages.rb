class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :from_user
      t.belongs_to :to_user
      t.text :content

      t.timestamps
    end
    add_index :messages, :from_user_id
    add_index :messages, :to_user_id
  end
end
