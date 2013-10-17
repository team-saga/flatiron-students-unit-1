require_relative '../config/environment'

class SiteGenerator

  index = ERB.new(File.open('lib/views/index.erb').read)
  students = Student.all

  File.open('_site/index.html', 'w+') do |f|
    f << index.result(binding)
  end

  show = ERB.new(File.open('lib/views/show.erb').read)

  student.each do |student|
    File.open("_site/students/#{student.url}.html", 'w+') do |f|
      f << show.result(binding)
    end
  end


end