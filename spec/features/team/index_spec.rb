require 'rails_helper'

RSpec.describe 'team index' do
 before do
   @competition_1 = Competition.create!(name: 'comp1', location: 'location1', sport: 'sport1')
   @competition_2 = Competition.create!(name: 'comp2', location: 'location2', sport: 'sport2')

   @team_1 = @competition_1.teams.create!(hometown: 'hometown1', nickname: 'nickname1')
   @team_2 = @competition_2.teams.create!(hometown: 'hometown2', nickname: 'nickname2')

   @player_1 = @team_1.teams.players.create!(name: 'player1', age: 12)
   @player_2 = @team_1.teams.players.create!(name: 'player2', age: 22)
   @player_3 = @team_1.teams.players.create!(name: 'player3', age: 32)
   @player_4 = @team_2.teams.players.create!(name: 'player1', age: 12)
   @player_5 = @team_2.teams.players.create!(name: 'player2', age: 22)
   @player_6 = @team_2.teams.players.create!(name: 'player3', age: 32)

   visit teams_path
 end

 it 'when I visit the teams index page' do
    expect(current_path).to eq(teams_path)
  end

  it 'I see a list of all teams with nickname and hometown' do
    within("#team-#{@team_1.id}") do
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content(@team_1.hometown)
    end
    within("#team-#{@team_2.id}") do
      expect(page).to have_content(@team_2.nickname)
      expect(page).to have_content(@team_2.hometown)
    end
  end

  it 'within each team section i see players and ages' do
    within("#team-#{@team_1.id}") do
      expect(page).to have_content(@player_1.name)
      expect(page).to have_content(@player_2.name)
      expect(page).to have_content(@player_3.name)

      expect(page).to have_content(@player_1.age)
      expect(page).to have_content(@player_2.age)
      expect(page).to have_content(@player_3.age)

    end
    within("#team-#{@team_2.id}") do
      expect(page).to have_content(@player_4.name)
      expect(page).to have_content(@player_5.name)
      expect(page).to have_content(@player_6.name)

      expect(page).to have_content(@player_4.age)
      expect(page).to have_content(@player_5.age)
      expect(page).to have_content(@player_6.age)
    end
  end

  it 'under each flight number I see the names of all that flights passengers' do
    within("#flight-#{@flight_1.id}") do
      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)
    end
    within("#flight-#{@flight_2.id}") do
      expect(page).to have_content(@passenger_3.name)
      expect(page).to have_content(@passenger_4.name)
    end
  end
end
