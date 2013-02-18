class UsersController < ApplicationController
  def index
  end

  def autocomplete
    render :json => User.search(params['term'])
  end
end
