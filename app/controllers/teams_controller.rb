class TeamsController < ApplicationController

  def create
    @team = Team.new team_params
    respond_to do |format|
      if @team.save
        format.html { redirect_to teams_path }
        format.js   {}
      else
        format.html { redirect_to teams_path }
      end
    end
  end

  def new
    @team = Team.new
  end

  def update
    @team = Team.find(params[:id])
    if @team.update team_params
      respond_to do |format|
        format.html { redirect_to teams_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def index
    @teams = Team.all
    @team = Team.new
  end

private

  def team_params
    params.require(:team).permit(:name, :synonyms)
  end
end

