class CreateYourenmas < ActiveRecord::Migration
  def change
    create_table :yourenmas do |t|
      t.belongs_to :yrm_topic
      t.string :place
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
    add_index :yourenmas, :yrm_topic_id
    add_index :yourenmas, :user_id
  end
end
