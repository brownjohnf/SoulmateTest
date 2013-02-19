class Word < ActiveRecord::Base
  attr_accessible :word

  after_save :do_after_save

  def self.search(term)
    matches = Soulmate::Matcher.new('word').matches_for_term(term, :limit => 20, :cache => Rails.env.production?)
    matches.collect { |match| { "id" => match["id"], "label" => match["term"], "value" => match["term"] } }
  end

  private

  def do_after_save
    loader = Soulmate::Loader.new('word')
    loader.add('term' => word, 'id' => id)
  end
end
