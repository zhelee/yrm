class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :topic
      t.string :name
      t.belongs_to :user
      t.text :description

      t.timestamps
    end
    add_index :events, :topic_id
    add_index :events, :user_id
  end
end
