class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])

    if @user.update(params[:id])
      redirect_to new_user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end
  def create
    # @user = User.new(user_params)
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, status: unprocessable_entity
    end
  end

  private
  def user_params
    params.expect(user: [ :username, :email, :password ])
  end
end
