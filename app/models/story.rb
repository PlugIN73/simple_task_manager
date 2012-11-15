class Story < ActiveRecord::Base
  attr_accessible :author_id, :description, :state, :title, :user_id
end
