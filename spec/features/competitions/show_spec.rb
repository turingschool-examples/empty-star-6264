require 'rails_helper'

RSpec.describe 'competitions show page' do
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

    @comp_1 = Competition.create!(name: "Winter Classic", location: "Lake Tahoe", sport: "hockey")
    @comp_2 = Competition.create!(name: "Stanley Cup", location: "Denver",sport: "hockey")

    TeamComp.create!(team: @team_1, competition: @comp_1)
    TeamComp.create!(team: @team_2, competition: @comp_1)

    visit "/competitions/#{@comp_1.id}"
  end

  it 'lists all teams in competition' do
    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
  end

  it 'gives the average age of all players in competition' do
    expect(page).to have_content("Average Age: 19.5")
  end

  it 'registers a new team' do
    fill_in "Nickname", with: (@team_3.nickname)
    click_on "Submit"
    expect(current_path).to eq("/competitions/#{@comp_1.id}")
    save_and_open_page
    expect(page).to have_content(@team_3.nickname)
  end
end