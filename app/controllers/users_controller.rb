class UsersController < ApplicationController

  # GET /contents
  def index
    @users = User.all
    render :index
  end

  # GET /contents/1
  def show
    @user = User.find(params[:id])
    if current_user == nil 
      redirect_to sign_in_path
    else
      render :show
    end
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
      login(@user)
      # @content = Content.find(4)
      # UserBoozt.boozt_email(@user).deliver
      flash[:success] = "Welcome to BooztMe!"
      redirect_to @user
    else
      redirect_to new_user_path, flash: {error: @user.errors.full_messages.to_sentence}
    end
  end

  # PATCH/PUT /contents/1
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
  	if @user.update(user_params)
    	redirect_to @user
  	else
    	render :edit
  	end
  end

  # DELETE /contents/1
  def destroy
    @user = User.find(params[:id])
    session.delete(:user_id)
    @user.destroy
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
