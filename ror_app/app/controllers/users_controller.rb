#Controller for model Users, you have to fit the http authentification method to edit, create, or destroy user
class UsersController < ApplicationController
  # GET /users
  # GET /users.json

	#http_basic_authenticate_with :name => "sam", :password => "sam", :except => [:index, :show]

  #invoke to show index and and fetch params 'search' if there is 
  def index
    @users = User.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  #invoke to show an individual user
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  #invoke to instanciate an user
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  #invoke to edit an user with parameters fetch from the formular
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  #invoke to create a user with parameters fetch from the formular and send the welcome mail
  def create
    @user = User.new(params[:user])
	
    respond_to do |format|
      if @user.save
        if(@user.email!="")
          UserMailer.welcome_email(@user).deliver
        end
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  #invoke to update a user with parameters fetch from the formular
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  #invoke to destroy a user with parameters fetch from the formular & put the anonymous user as owner
  def destroy
    #We need to remove the owner id from his uploads to put them anonymous
    Upload.switchToAnonymous(params[:id])

    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
