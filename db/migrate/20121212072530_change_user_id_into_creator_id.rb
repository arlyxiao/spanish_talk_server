class ChangeUserIdIntoCreatorId < ActiveRecord::Migration
  def change
    rename_column :questions, :user_id, :creator_id
  end
end
