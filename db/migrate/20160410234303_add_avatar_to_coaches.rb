class AddAvatarToCoaches < ActiveRecord::Migration
  def self.up
    add_attachment :coaches, :avatar
  end

  def self.down

    remove_attachment :coaches, :avatar
  end
end
