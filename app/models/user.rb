class User < ActiveRecord::Base
  validates :username, 
    :presence => true,
    :length => 2..20,
    :uniqueness => { :case_sensitive => false },
    :format => /^([A-Za-z0-9一-龥]+)$/
  
  validates :email,
    :presence => true,
    :uniqueness => { :case_sensitive => false },
    :format => /^([A-Za-z0-9_]+)([\.\-\+][A-Za-z0-9_]+)*(\@[A-Za-z0-9_]+)([\.\-][A-Za-z0-9_]+)*(\.[A-Za-z0-9_]+)$/
  
  validates :password,
    :presence => { :on => :create },
    :confirmation => true,
    :length => { :in => 4..32 }


  def self.check_login(email, password)
    user = User.where(:email => email, :password => password).first
    return false if user.nil?
    return user
  end


  include Question::UserMethods
end
