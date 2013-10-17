require_relative '../config/environment'

class SiteGenerator

  index = ERB.new(File.open('../lib/views/index.erb').read)
  students = Student.all

  File.open('../_site/index.html', 'w+') do |f|
    f << index.result(binding)
  end

  show = ERB.new(File.open('../lib/views/show.erb').read)

  students.each do |student|
    File.open("../_site/students/#{student.url}.html", 'w+') do |f|
      f << show.result(binding)
    end
  end


  @@student_names = [["Alex Chiu", "http://students.flatironschool.com/./img/alex_chiu_profile_pic.jpg"], ["Amanda Himmelstoss", "http://students.flatironschool.com/img/students/brendan_manley_profile.jpg"], ["Anders Ramsay", "http://students.flatironschool.com/img/students/raymond_gan_profile.jpg"], ["Bana Malik", "http://students.flatironschool.com/img/students/charlotte_chang_profile.png"], ["Brendan Manley", "http://students.flatironschool.com/img/students/vivian-snapshot.png"], ["Charlotte Chang", "http://students.flatironschool.com/img/students/ivanbrennan_index_profile.jpg"], ["Christopher Lee", "http://students.flatironschool.com/img/students/kyleshike_index_profile.jpg"], ["Daniel Chang", "http://students.flatironschool.com/img/students/michaelpolycarpou_index.jpg"], ["David Bella", "http://students.flatironschool.com/https://dl.dropboxusercontent.com/u/88495/sam_profile.jpg"], ["Edina Vath", "http://students.flatironschool.com/img/students/stephanie_index_profile.jpg"], ["Emily Xie", "http://students.flatironschool.com/img/students/davidbella_index_profile.jpg"], ["Greg Eng", "http://students.flatironschool.com/img/students/greg_eng_index_profile.jpg"], ["Ian Miller", "http://students.flatironschool.com/img/students/mike_spangler_index_profile.jpg"], ["Iris Lee", "http://students.flatironschool.com/img/students/anders_ramsay_index_profile.jpg"], ["Ivan Brennan", "http://students.flatironschool.com/img/students/emily_xie_picture.jpg"], ["James Tong", "http://students.flatironschool.com/https://scontent-a-ord.xx.fbcdn.net/hphotos-ash3/995456_10100424239956534_215898244_n.jpg"], ["Jeanne Roniger", "http://students.flatironschool.com/img/students/tpeon.jpg"], ["Joe O'Conor", "http://students.flatironschool.com/img/students/amandahimmelstossphoto.jpg"], ["John Richardson", "http://students.flatironschool.com/img/students/student_name_index_profile.jpg"], ["Joshua Scaglione", "http://students.flatironschool.com/img/students/student_name_index_profile.jpg"], ["Kyle Shike", "http://students.flatironschool.com/img/students/daniel_chang_profile.png"], ["Logan Hasson", "http://students.flatironschool.com/img/students/ian_miller_pic.jpg"], ["Manuel Neuhauser", "http://students.flatironschool.com/img/students/iris_lee_profile.jpg"], ["Margaret Lee", "http://students.flatironschool.com/img/students/student_name_index_profile.jpg"], ["Matt Campbell", "http://students.flatironschool.com/img/students/joe_oconor_index_profile.jpg"], ["Michael Polycarpou", "http://students.flatironschool.com/img/students/jeanneronigerprofile.jpg"], ["Mike Spangler", "http://students.flatironschool.com/img/students/student_name_index_profile.jpg"], ["Raymond Gan", "http://students.flatironschool.com/img/students/josh_index.jpg"], ["Rosanne Hoyem", "http://students.flatironschool.com/img/students/logan_hasson_index_profile.jpg"], ["Sam Yang", "http://students.flatironschool.com/img/students/manuel_neuhauser_index_profile.jpg"], ["Samuel Owens", "http://students.flatironschool.com/img/students/marge_index.jpg"], ["Saron Yitbarek", "http://students.flatironschool.com/img/students/rosiehoyem_index_profile.jpg"], ["Scott Luptowski", "http://students.flatironschool.com/img/students/student_name_index_profile.jpg"], ["Vivian Zhang", "http://students.flatironschool.com/https://si0.twimg.com/profile_images/1865399448/image.jpg"], ["Sonja Hall", "http://students.flatironschool.com/img/students/student_name_index_profile.jpg"], ["Stephanie Oh", "http://students.flatironschool.com/img/students/sonja_hall_profile.jpg"], ["Theo Vora", "http://students.flatironschool.com/http://farm6.staticflickr.com/5441/9925796136_c716cd12f0_n.jpg"], ["Thomas Surgent", "http://students.flatironschool.com/img/students/trevor_mckendrick_index_profile.jpg"], ["Tiffany Peon", "http://students.flatironschool.com/img/students/vinney_cavallo_profile.jpg"], ["Trevor McKendrick", "http://students.flatironschool.com/img/students/patrick_janson_index_profile.jpg"], ["Vinney Cavallo", "http://students.flatironschool.com/img/students/edinav.jpg"]]

  Student.create_table

  @@student_names.each do |x|
    Student.new.tap do |s|
      s.name  = x[0]
      s.image = x[1]
      s.save
    end
  end

end