class ChangeYrmTopicToTopic < ActiveRecord::Migration
  def change
    drop_table :yrm_topics
    remove_column :yourenmas, :yrm_topic_id
    add_column :yourenmas, :topic_id, :integer
    add_index :yourenmas, :topic_id
  end
end
