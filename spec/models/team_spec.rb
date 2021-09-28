require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:competition_teams)}
    it { should have_many(:competitions).through(:competition_teams)}
  end
  it "can calculate the average age of the players for a competition" do
    competition = Competition.create!(name: 'Wimbledon', location: 'England', sport: 'Tennis')
    team = Team.create!(nickname: 'Badgers', hometown: 'Wisconsin')
    team3 = Team.create!(nickname: 'Cubs', hometown: 'Chicago')
    player = Player.create!(name: 'Ted', age: 23, team_id: team.id)
    player = Player.create!(name: 'Bob', age: 25, team_id: team.id)
    CompetitionTeam.create!(competition_id: competition.id, team_id: team.id)

    expect(team.players_average_age).to eq(24)
  end
end
