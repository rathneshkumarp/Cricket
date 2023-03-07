class TeamperformancesController < ApplicationController
  def index
    teamperformances = Teamperformance.all
    render json: teamperformances, status:200
  end

  def show
    teamperformance = Teamperformance.find_by(id: params[:id])
    if teamperformance
      render json: teamperformance, status:200
    else
      render json: "Unable to find the team performance"
    end    
  end

  def create
    teamperformance = Teamperformance.new(
      matches_played: tep_params[:matches_played],
      won: tep_params[:won],
      loss: tep_params[:loss],
      points: tep_params[:points],
      team_id: tep_params[:team_id]
    )
    if teamperformance.save
      render json: teamperformance, status:200
    else
      render json: {
        error: "Unable to create teamperformance details in record"
      }
    end               
  end

  def update
    teamperformance = Teamperformance.find_by(id: params[:id])

    if teamperformance
      teamperformance.update(
        matches_played: params[:matches_played],
        won: params[:won],
        loss: params[:loss],
        points: params[:points],
        team_id: params[:team_id]
      )
      render json: "Team performance details updated sucessfully"
    else
      render json: {
        error: "Unable to find players details in record"
      }
    end  
  end

  def destory
    teamperformance = Teamperformance.find_by(id: params[:id])
    if teamperformance
      teamperformance.destory
      render json: "Team performance details deleted sucessfully"
    end  
  end

  def tep_params 
    params.require(:teamperformance).permit([
      :matches_played,
      :won,
      :loss,
      :points,
      :team_id
    ])
  end  
end
