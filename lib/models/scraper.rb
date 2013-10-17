require_relative '../../config/environment.rb'

main_page = Nokogiri::HTML(open('http://students.flatironschool.com/'))

students_list = main_page.css('.home-blog ul')
student_list_item = students_list.css('.blog-thumb a')
links_to_crawl = student_list_item.map { |i| i.attributes["href"].value  }

student_images = main_page.css('.home-blog .blog-thumb .prof-image')
student_names = main_page.css('.home-blog .blog-title .big-comment h3 a').text

urlmap = links_to_crawl.map { |link| "http://students.flatironschool.com/" + link  }

def crawl_page(student_page)
  url = Nokogiri::HTML(open(student_page))
  name = url.css('.ib_main_header').children[0].text || "name"
  image = url.css('.student_pic').first.attributes["src"].value || "image"
  quote = url.css('.textwidget h3')[0].children.text.strip || "quote"
  cities =  url.css('h3')[-3].parent.parent.children[5].children.map { |city| city.text.strip || "cities" }.reject(&:empty?) 
  biography = url.css('h3')[1].parent.parent.children[5].text.strip || "bio"
  personal_projects = url.css('h3')[-4].parent.parent.children[5].text.strip || "projects"
  social_media_array = []
 
  url.css(".social-icons a").each do |link|
    social_media_array << link.attributes["href"].value
  end
   
  url.css(".coder-cred a").each do |instance|
    social_media_array << instance.attributes["href"].value 
  end
   
  social_media_array = social_media_array.uniq || "social media"

  # [name,image,quote,cities,social_media_array, biography].inspect

  add_to_db
end

def add_to_db
    db = SQLite3::Database.new( "test.db" )
  db.execute(" create table if not exists student (
  name varchar2(30),
  image varchar2(30),
  quote text,
  biography text
  )
  ;") 

  db.execute( "insert into student values ( ?, ?,?,? )", 
  *name,*image,*quote, *biography )
end