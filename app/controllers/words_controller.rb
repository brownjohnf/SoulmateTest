class WordsController < ApplicationController
  def index
  end

  def autocomplete
    render :json => Word.search(params['term'])
  end
end
