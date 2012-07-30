class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :topic_type
      t.text :description

      t.timestamps
    end
  end
end
