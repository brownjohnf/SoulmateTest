# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open(File.join(Rails.root, "lib", "assets", "wordsEn.txt"), "r") do |file|
  while line = file.gets
    Word.create(:word => line[0..-3])
  end
end
