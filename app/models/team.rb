class Team < ApplicationRecord
  has_many :players
  has_many :team_comps
  has_many :competitions, through: :team_comps
end
