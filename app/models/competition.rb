class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def average_age_of_players
    teams.joins(:players).average(:age)
  end
end
