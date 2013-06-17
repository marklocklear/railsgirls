class Task < ActiveRecord::Base
  attr_accessible :completed, :idea_id, :name, :notes, :team_members

  #
  # Associations
  #

  belongs_to :idea

end