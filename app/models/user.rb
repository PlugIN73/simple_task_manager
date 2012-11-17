class User < ActiveRecord::Base
  attr_accessible :email, :name, :password

  def authenticate(email, password)
    user = User.find_by_email(email)
    if user.password == password
      user
    else
      nil
    end
  end
end
