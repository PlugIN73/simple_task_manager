class Story < ActiveRecord::Base
  attr_accessible :author_id, :description, :state, :title, :user_id

  belongs_to :user, class_name: :User
  belongs_to :author, class_name: :User

  validates :user, presence:true
  validates :title, presence:true

  state_machine initial: :new do
    event :accept do
      transition [:new, :rejected] => :accepted
    end

    event :reject do
      transition :new => :rejected
    end

    event :start do
      transition :accepted => :started
    end

    event :finish do
      transition all => :finished
    end
  end
end

