class PlayerperformancesController < ApplicationController
  def index
    playerperformances = Playerperformance.all
    render json: playerperformances status: 200
  end

  def show
    playerperformance = Playerperformance.find_by(id: params[:id])
    if playerperformance
      render json: playerperformance, status: 200
    else
      render json: "unable to playerperformance details"
    end    
  end

  def create
    playerperformance = Playerperformance.create(
      matches_played: pep_params[:matches_played],
      runs: pep_params[:runs],
      fifties: pep_params[:fifties],
      average: pep_params[:average],
      team_id: pep_params[:team_id]
    )
    if playerperformance.save
      render json: playerperformance, status:200
    else
      render json: {
        error: "Unable to create playerperformance details in record"
      }  
    end 
  end

  def update
    playerperformance = Playerperformance.find_by(id: params[:id])

    if playerperformance
      playerperformance.update(
      matches_played: pep_params[:matches_played],
      runs: pep_params[:runs],
      fifties: pep_params[:fifties],
      average: pep_params[:average],
      team_id: pep_params[:team_id]
      )
      render json: "Playerperformance Details updated sucessfully"
      else
        render json:{
          error: "Unable to find Playerperformance details in record"
        }
      end 
  end

  def destory
    playerperformance = Playerperformance.find_by(id: params[:id])

    if playerperformance
      playerperformance.destory
      render json: "The tournaament details has been deleted"
    end  
  end

  def pep_params
    :matches_played,
    :runs,
    :fifties,
    :average,
    :team_id
  end
    
end
