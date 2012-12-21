class Question < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id
  has_many :answers, :class_name => 'Answer', :foreign_key => :question_id, :dependent => :destroy


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
      :answers => self.answers.map {|answer| answer.hash_in_android},
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
