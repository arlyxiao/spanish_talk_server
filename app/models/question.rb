class Question < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id

  default_scope order('id DESC')


  def hash_in_android
    return {
      :id         => self.id,
      :title      => self.title,
      :content    => self.content,
      
      :creator => {
        :id => self.creator.id,
        :username => self.creator.username
      },
      :created_at => self.created_at
    }

  end

  module UserMethods
    def self.included(base)
      base.has_many :questions, :class_name => 'Question', :foreign_key => :creator_id
      base.send(:include, InstanceMethod)
    end
    
    module InstanceMethod
      
    end
  end

end
