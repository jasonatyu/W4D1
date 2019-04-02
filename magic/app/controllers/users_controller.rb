
class UsersController < ApplicationController

  def index 
    @users = User.all 
    render json: @users, status: 200 
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200 
    else 
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end 

  def show 
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user, status: 200 
    else 
      render json: "No user found.", status: :unprocessable_entity 
    end
  end 

  def update
    @user = User.update(params[:id], user_params)

    if @user 
      render json: @user, status: 200 
    else 
      render json: "User not found", status: 404
    end 
  end

  def destroy
    @user = User.destroy(params[:id])
    render json: @user, status: 200
  end 

  private 
  def user_params 
     params.require(:user).permit(:username)
  end

end
