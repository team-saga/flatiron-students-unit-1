require_relative '../config/environment'

class SiteGenerator

  # index = ERB.new(File.open('lib/views/index.erb').read)
  # students = Student.all

  # File.open('_site/index.html', 'w+') do |f|
  #   f << index.result(binding)
  # end

  # show = ERB.new(File.open('lib/views/show.erb').read)

  # student.each do |student|
  #   File.open("_site/students/#{student.url}.html", 'w+') do |f|
  #     f << show.result(binding)
  #   end
  # end


  # @@student_names = [
  # "Alex Chiu",
  # "Amanda Himmelstoss",
  # "Anders Ramsay",
  # "Bana Malik",
  # "Brendan Manley",
  # "Charlotte Chang",
  # "Christopher Lee",
  # "Daniel Chang",
  # "David Bella",
  # "Edina Vath",
  # "Emily Xie",
  # "Greg Eng",
  # "Ian Miller",
  # "Iris Lee",
  # "Ivan Brennan",
  # "James Tong",
  # "Jeanne Roniger",
  # "Joe O'Conor",
  # "John Richardson",
  # "Joshua Scaglione",
  # "Kyle Shike",
  # "Logan Hasson",
  # "Manuel Neuhauser",
  # "Margaret Lee",
  # "Matt Campbell",
  # "Michael Polycarpou",
  # "Mike Spangler",
  # "Raymond Gan",
  # "Rosanne Hoyem",
  # "Sam Yang",
  # "Samuel Owens",
  # "Saron Yitbarek",
  # "Scott Luptowski",
  # "Vivian Zhang",
  # "Sonja Hall",
  # "Stephanie Oh",
  # "Theo Vora",
  # "Thomas Surgent",
  # "Tiffany Peon",
  # "Trevor McKendrick",
  # "Vinney Cavallo"
  # ]

  # Student.create_table

  # @@student_names.each do |x|
  #   Student.new.tap do |s|
  #     s.name = x
  #     s.save
  #   end
  # end


  index = ERB.new(File.open('../lib/views/practice_index.erb').read)
  students = Student.all

  File.open('../_site/index.html', 'w+') do |f|
    f << index.result(binding)
  end

  show = ERB.new(File.open('../lib/views/practice_show.erb').read)
  # For each dog, first, cast the dog into instance var

  students.each do |student|
    File.open("../_site/students/#{student.url}.html", 'w+') do |f|
      f << show.result(binding)
    end
  end

end