class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: 200
  end
  
  #Register new User
  
  def create
   user = User.new(user_params)
   if user.save
    render json: user, status: 201 #created
    #render json: { message: "User details has been created successfully" }, status: :created #201
   else
    render json: {
      error: "Unable to create details"
    }
   # render json: { error: users.errors.full_messages }, status: :unprocessable_entity #422
   end 
  end

#login for the users

  def login
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      token = SecureRandom.hex(10)
      expire_at = Time.now + 15.minutes
      user.update(token: token, expire_at: expire_at, logged_in: true)
      render json:{token: token, message:"Login has been done successfully"}, status: :ok #200
    else
      render json: {
        error: "Invalid login credentials"
      }, status: :unauthorized  #401    
    end  
  end

  # forget password

  def forget_password
    user = User.find_by(email: params[:email])
    if user
      token = SecureRandom.hex(10)
      expire_at = Time.now + 15.minutes
      user.update(token: token, expire_at: expire_at)
      render json: {token: token, message: "Your new password link has been sent to your Email"}, status: :ok #200
    else
      render json: {error: "Email id is wrong"}
    end  
  end  

  #Reset Password

  def reset_password
    user = User.find_by(token: params[:token]) 
    if user && user.expire_at > Time.now
      user.update(password: params[:password])
      render json: {message: "Password reset successful"}, status: :ok #200
    elsif user && user.expire_at <= Time.now
      render json: {error:"Reset password link has expired"}, status: :unprocessable_entity #422
    else 
      render json: {error:"Invalid reset password token"},  status: :unprocessable_entity #422
    end  
  end   

  #logout 
  def logout
   user = User.find_by(email: params[:email])
   if user
   user.update(logged_in: false)
    render json: {message:"Logout successful"}, status: :ok #200
   else
    render json: {error:"Invalid email"}, status: 401   #401
   end
  end


  def user_params
    params.require(:user).permit([:name, :email, :password, :password_confirmation])
  end  

end
