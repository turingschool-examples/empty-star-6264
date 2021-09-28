class CompetitionsController < ApplicationController
  def show
    @competition = Competition.find(params[:competition_id])
  end

  def update
    @competition = Competition.find(params[:competition_id])

    redirect_to "/competitions/#{@competition.id}"
  end
end