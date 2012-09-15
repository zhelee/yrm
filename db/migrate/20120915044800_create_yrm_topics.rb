class CreateYrmTopics < ActiveRecord::Migration
  def change
    create_table :yrm_topics do |t|
      t.string :title

      t.timestamps
    end
  end
end
