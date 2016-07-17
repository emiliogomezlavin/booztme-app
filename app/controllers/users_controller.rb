class UsersController < ApplicationController

  # GET /contents
  def index
    @users = User.all
    render :index
  end

  # GET /contents/1
  def show
    @user = User.find(params[:id])
    render :show
  end

  # GET /contents/new
  def new
    @user = User.new
    render :new
  end

  # GET /contents/1/edit
  def edit
    @user = User.find(params[:id])
    render :edit
  end

  # POST /contents
  def create
  	@user = User.new(user_params)
  	if @user.save
    	redirect_to @user
  	else
    	render :new
  	end
  end

  # PATCH/PUT /contents/1
  def update
  	if @user.update(user_params)
    	redirect_to @user
  	else
    	render :edit
  	end
  end

  # DELETE /contents/1
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
    end
end
