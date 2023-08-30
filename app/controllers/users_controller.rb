class UsersController < ApplicationController
  before_action :authorize_request, only: []
  before_action :find_user, only: []
  def new
    @marine = User.new
  end

  def show
    @marine = User.find(params[:id])
  end

  def index
    check_logged_in
    @marines = User.all
    puts @marines
  end

  def create
    @user = User.new(user_params)
    if @user.save
      puts 'saved'
      redirect_to action: 'show_dashboard'
    else
      puts @user.errors.full_messages
      flash[:notice] = @user.errors.full_messages.join(" \n")

      render 'new'
    end
  end

  def show_dashboard
    check_logged_in
    @marine = helpers.current_user.name
    # find top pirates according to bounty
    @top_pirates = Pirate.all.order(bounty: :desc).limit(10)
    crew = Crew.find_by(name: 'solo')
    # find top crews except solo pirates
    @top_crews = Crew.all.excluding(crew).order(bounty: :desc).limit(10)
  end

  private

  def check_logged_in
    if !helpers.logged_in?
      flash[:notice] = 'You need to login to view the requested page'
      redirect_to ''
    else
      puts helpers.current_user.position
      @position = helpers.current_user.position
    end
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :position, :image)
  end

  def find_user
    @user = User.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'user not found' }, status: :not_found
  end
end
