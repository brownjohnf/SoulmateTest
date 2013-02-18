class WordsController < ApplicationController
  # GET /words
  def index
    @word = Word.find_by_word(params[:word][:word]) if params[:word]
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
