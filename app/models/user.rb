class User < ActiveRecord::Base
  attr_accessible :age, :name

  after_save :do_after_save

  def self.search(term)
    matches = Soulmate::Matcher.new('users').matches_for_term(term, :limit => 20)
    matches.collect { |match| { "id" => match['id'], 'label' => match['term'], 'value' => match['term'] } }
  end

  private

  def do_after_save
    loader = Soulmate::Loader.new('users')
    loader.add('term' => name, 'id' => id)
  end
end
