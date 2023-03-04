class TournaamentsController < ApplicationController
  before_action :authenticate_request
    
  def index
    tournaaments = Tournaament.all.paginate(page: params[:page], per_page:4)
    render json: tournaaments, status:200
  end

  # def paginate
  #   tournaament = Tournaament.paginate(page: params[:page], per_page:2)
  #   render json: tournaament, status:200
  # end  
  
  def max_order  
    tournaament = Tournaament.maximum(:matches_played)
    render json:  max_numb_played #{max_numb_played: "maximum match" }
    # puts "rrr #{max_numb_played}"
  end 

  def show
    tournaament = Tournaament.find_by(id: params[:id])
    if tournaament
    render json: tournaament, status:200
    else
      render json: "unable to tournaament details"
    end   
  end

  def create
    tournaament = Tournaament.create(
      no_of_matches: tou_params[:no_of_matches],
      match_no: tou_params[:match_no],
      start_date: tou_params[:start_date],
      end_date: tou_params[:end_date],
      toss: tou_params[:toss],
      match_date: tou_params[:match_date],
      team_id: tou_params[:team_id],
      matches_played: tou_params[:matches_played]
    )
    if tournaament.save
      render json: tournaament, status: 201
    else
      render json: tournaament.errors.details, status: 422
      # {
      #   error: "Unable to create tournaament details in record"
      # }  
    end  
  end

  def update
    tournaament = Tournaament.find_by(id: params[:id])

    if tournaament
      tournaament.update(
        no_of_matches: params[:no_of_matches],
       match_no: params[:match_no],
       start_date: params[:start_date],
       end_date: params[:end_date],
       toss: params[:toss],
       match_date: params[:match_date],
       team_id: params[:team_id],
       matches_played: params[:matches_played]
      )
      render json: "Tournaament Details updated sucessfully"
    else
      render json: {
        error:"Unable to find tournaament details in record"
      }  
    end  
  end

  def destroy
    tournaament = Tournaament.find_by(id: params[:id])

    if tournaament
      tournaament.destroy
      render json: "The tournaament details has been deleted"
    end  
  end

  def tou_params
    params.require(:tournaament).permit([
      :no_of_matches,
      :match_no,
      :start_date,
      :end_date,
      :toss,
      :match_date,
      :team_id,
      :matches_played
    ])
  end  
end
