class Idea < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :completed, :range, :task_id

  #
  # Validations
  #

  validates :name, :presence => true
#  validates :range, :presence => true
#  validates :range, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }

  #
  # Associations
  #

  has_many :tasks

  #
  # Attachments
  #

  mount_uploader :picture, PictureUploader

end