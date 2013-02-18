class WordsController < ApplicationController
  # GET /words
  def index
  end

  # GET /words/:id
  def show
    @word = Word.find_by_word(params[:word])
  end

  # GET /words/autocomplete?term=term
  def autocomplete
    render :json => Word.search(params['term'])
  end
end
