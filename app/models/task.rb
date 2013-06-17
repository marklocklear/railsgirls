class Task < ActiveRecord::Base
	has_many :ideas
  attr_accessible :name, :notes, :team_members
end
