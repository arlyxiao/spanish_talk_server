class User < ActiveRecord::Base
  validates :name, 
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
end
