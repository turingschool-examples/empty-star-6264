class Competition < ApplicationRecord

  has_many :team_comps

  has_many :teams, through: :team_comps
  has_many :players, through: :teams

end
