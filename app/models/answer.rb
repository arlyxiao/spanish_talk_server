class Answer < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id
  belongs_to :question, :class_name => 'Question', :foreign_key => :question_id

  default_scope order('id DESC')

  def hash_in_android
    return {
      :id         => self.id,
      :creator_id => self.creator_id,

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
      base.has_many :answers, :class_name => 'Answer', :foreign_key => :creator_id
      base.send(:include, InstanceMethod)
    end
    
    module InstanceMethod
      
    end
  end
end
