class Idea < ActiveRecord::Base
	belongs_to :task
	mount_uploader :picture, PictureUploader
  attr_accessible :description, :name, :picture, :completed, :range, :task_id

	validates :name, :presence => true
#	validates :range, :presence => true
#	validates :range, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }

end
