class TeamsController < ApplicationController

  def create
    team = Team.new
    team.name = params[:name]
    team.save

    redirect_to(teams_path)
  end

  def destroy
    team = Team.find(params[:name])
    team.destroy

    redirect_to(teams_path)
  end

  def index
    @teams = Team.all
  end
end
