class Mood < ActiveRecord::Base
  
  attr_accessible :description, :mood_picture, :name
  
  mount_uploader :mood_picture, MoodPictureUploader
end
