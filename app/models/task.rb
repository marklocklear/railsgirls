class Task < ActiveRecord::Base
  attr_accessible :completed, :idea_id, :name, :notes, :team_members, :due_date

  #
  # Validations
  #

  validates :name, :presence => true

  #
  # Associations
  #

  belongs_to :idea

end