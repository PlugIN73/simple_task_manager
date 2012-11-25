class StoryComment < ActiveRecord::Base
  attr_accessible :comment, :story_id, :user_id
  belongs_to :story
end
