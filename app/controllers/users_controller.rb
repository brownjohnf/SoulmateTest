class UsersController < ApplicationController
  # GET /users
  def index
    @user = User.find_by_name(params[:user][:name]) if params[:user]
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # GET /users/autocomplete
  def autocomplete
    render :json => User.search(params['term'])
  end
end
