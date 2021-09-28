require 'rails_helper'

RSpec.describe 'index page' do
  it "all of the team's attributes and the player attributes listed beneath each team" do
#     User Story 1 - Team Index
#
# As a user
# When I visit the Team Index
# Then I see the nickname and hometown of all Teams
# And under each team I see the names and ages of all its players
    team = Team.create!(nickname: 'Badgers', hometown: 'Wisconsin')
    team2 = Team.create!(nickname: 'Cubs', hometown: 'Chicago')
    player = Player.create!(name: 'Ted', age: 23, team_id: team.id)
    player1 = Player.create!(name: 'Bob', age: 25, team_id: team.id)
    player2 = Player.create!(name: 'Matt', age: 27, team_id: team2.id)

    visit '/teams'
    
    expect(page).to have_content(team.nickname)
    expect(page).to have_content(team.hometown)
    expect(page).to have_content(team2.nickname)
    expect(page).to have_content(team2.hometown)
    expect(page).to have_content(player.name)
    expect(page).to have_content(player.age)
    expect(page).to have_content(player1.name)
    expect(page).to have_content(player1.age)
    expect(page).to have_content(player2.name)
    expect(page).to have_content(player2.age)
  end
end
