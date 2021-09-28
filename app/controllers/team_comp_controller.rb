class TeamCompsController < ApplicationController
  def create
    competition = Competition.find(params[:id])
    team = Team.find_by(nickname: params[:nickname])
    team_comp = TeamComp.new(competition_id: competition.id, team_id: team.id)
    redirect_to competitions_path
  end
end
