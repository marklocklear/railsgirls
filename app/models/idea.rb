class Idea < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :completed, :range

  #
  # Validations
  #

  validates :name, :presence => true
  validates :description, :presence => true
  validates :range, :presence => true
  validates :range, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }

  #
  # Associations
  #

  has_many :tasks

  #
  # Attachments
  #

  mount_uploader :picture, PictureUploader

  #
  # Scopes
  #

  scope :random, order("random()")
  scope :crazy_query, where("range = 8").order("created_at ASC").limit(5)
  scope :timely, -> { where(["created_at <= ?", Time.now]) }
  scope :ranged, lambda { |range| where(:range => range) if range }

end












