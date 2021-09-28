require 'rails_helper'

RSpec.describe CompetitionTeam, type: :model do
  describe "relationships" do
    it {should belong_to :competition}
    it {should belong_to :team}
  end

  it "can calculate the average age of the players for a competition" do
    competition = Competition.create!(name: 'Wimbledon', location: 'England', sport: 'Tennis')
    team = Team.create!(nickname: 'Badgers', hometown: 'Wisconsin')
    player = Player.create!(name: 'Ted', age: 23, team_id: team.id)
    player = Player.create!(name: 'Bob', age: 25, team_id: team.id)
    CompetitionTeam.create!(competition_id: competition.id, team_id: team.id)

    expect(competition.average_age_of_players).to eq(24)
  end
end
