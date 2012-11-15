class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
      t.integer :story_id
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
