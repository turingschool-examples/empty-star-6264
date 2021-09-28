class CompetitionTeamsController < ApplicationController
  def create
    competition = Competition.find(params[:id])
    team = Team.find_by(nickname: params[:nickname])
    competition_team = CompetitionTeam.new(competition_id: competition.id, team_id: team.id)
    redirect_to "/competitions/#{competition.id}"
  end
end
