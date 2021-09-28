require 'rails_helper'

RSpec.describe 'team index page' do
  before :each do
    @team_1 = Team.create!(hometown: "Colorado", nickname: "Avalanche")
    @team_2 = Team.create!(hometown: "Las Vegas", nickname: "Knights")
    @team_3 = Team.create!(hometown: "Carolina", nickname: "Hurricanes")

    @player_1 = @team_1.players.create!(name: "John", age: 19)
    @player_2 = @team_1.players.create!(name: "Bob", age: 21)
    @player_3 = @team_2.players.create!(name: "Steve", age: 16)
    @player_4 = @team_2.players.create!(name: "Kurt", age: 22)
    @player_5 = @team_3.players.create!(name: "Brian", age: 12)
    @player_6 = @team_3.players.create!(name: "Tyler", age: 8)

    visit '/teams'
  end

  it 'lists all hometowns and nicknames of each team' do
    Team.all.each do |team|
      expect(page).to have_content(team.hometown)
      expect(page).to have_content(team.nickname)
    end
  end

  it 'lists all players for each team' do
    Team.all.each do |team|
      team.players.each do |player|
        expect(page).to have_content(player.name)
        expect(page).to have_content(player.age)
      end
    end
  end
end