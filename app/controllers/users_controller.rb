class UsersController < ApplicationController
  def index
    @user = User.find_by_name(params[:user][:name]) if params[:user]
  end

  def show
    @user = User.find(params[:id])
  end

  def autocomplete
    render :json => User.search(params['term'])
  end
end
