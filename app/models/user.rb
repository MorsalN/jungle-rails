class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}


  def self.authenticate_with_credentials(email, password)
    if User.find_by(email: email).try(authenticate: password)
      user
    else
      nil
    end 
  end 


end
