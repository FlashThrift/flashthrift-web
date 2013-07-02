class UsersController < ApplicationController
  
  # Show form to make a new user
  def new
    @user = User.new
  end

  # List all the users
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json => @users }
    end
  end

  # Creates a new user
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  # Gets/Shows the deatils of a specific user
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /users/1/edit
  def edit 
    @user = User.find(params[:id])
  end


end
