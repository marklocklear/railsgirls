class Idea < ActiveRecord::Base
	has_many :tasks
	mount_uploader :picture, PictureUploader
  attr_accessible :description, :name, :picture, :completed, :range

	validates :name, :presence => true
#	validates :range, :presence => true
#	validates :range, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }

end
