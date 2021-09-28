require 'rails_helper'
# User Story 2 - Competition Show Page
#
# As a user
# When I visit a competition's show page
# Then I see the competition's name, location, and sport
# And I see the nickname and hometown of all teams in this competition
# And I see the average age of all players in the competition
RSpec.describe 'show page' do
  it "shows the competition's attributes and all of the players in the competition" do
    competition = Competition.create!(name: 'Wimbledon', location: 'England', sport: 'Tennis')
    competition2 = Competition.create!(name: 'US Open', location: 'California', sport: 'Badminton')
    team = Team.create!(nickname: 'Badgers', hometown: 'Wisconsin')
    team2 = Team.create!(nickname: 'Cubs', hometown: 'Chicago')
    team3 = Team.create!(nickname: 'Cubs', hometown: 'Chicago')
    player = Player.create!(name: 'Ted', age: 23, team_id: team.id)
    player = Player.create!(name: 'Bob', age: 25, team_id: team.id)
    player = Player.create!(name: 'Matt', age: 27, team_id: team2.id)
    CompetitionTeam.create!(competition_id: competition.id, team_id: team.id)
    CompetitionTeam.create!(competition_id: competition2.id, team_id: team2.id)

    visit "/competitions/#{competition.id}"

    expect(page).to have_content(competition.name)
    expect(page).to have_content(competition.location)
    expect(page).to have_content(competition.sport)
    expect(page).not_to have_content(competition2.name)
    expect(page).not_to have_content(competition2.location)
    expect(page).not_to have_content(competition2.sport)
    expect(page).to have_content(team.nickname)
    expect(page).to have_content(team.hometown)
    expect(page).to have_content('24')

  end

#   User Story 3 - Register a Team
#
# As a user
# When I visit a competition's show page
# Then I see a text field to enter a team nickname
# When I fill in this field with the nickname of an existing team
# And I click the submit button
# Then the team with the nickname that I submitted is associated with this competition
# And I am redirected back to the competition's show page
# And I see that the team is now listed among the other teams in the competition
#
# (Note: you do not need to handle any sad paths, for example if the nickname entered does not match an existing team)

  it "shows the competition's attributes and all of the players in the competition" do
    competition = Competition.create!(name: 'Wimbledon', location: 'England', sport: 'Tennis')

    team = Team.create!(nickname: 'Badgers', hometown: 'Wisconsin')
    player = Player.create!(name: 'Ted', age: 23, team_id: team.id)
    CompetitionTeam.create!(competition_id: competition.id, team_id: team.id)


    visit "/competitions/#{competition.id}"

    fill_in 'nickname', with: 'Badgers'

    click_button 'Submit'

    expect(page).to have_content('Badgers')
    expect(current_path).to eq("/competitions/#{competition.id}")
  end
end
