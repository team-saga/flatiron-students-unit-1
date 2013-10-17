require '../../config/environment'

class Scraper
  attr_accessor :url, :name, :image, :quote, :cities, :bio, :personal_projects

  def initialize(scrape_source)
    @scraped_content = Nokogiri::HTML(open(scrape_source))
    @students_hash = {}
    @social_media_array = []
  end

  def crawl_student_pages(student_page)
    url = Nokogiri::HTML(open(student_page))
  end

  def get_student_list
    students_list = @scraped_content.css('.home-blog ul')
    student_list_item = students_list.css('.blog-thumb a')
  end

  def get_student_images
    image = url.css('.student_pic').first.attributes["src"].value || "image"
    #  student_images = @scraped_content.css('.home-blog .blog-thumb .prof-image')
  end

  def get_student_names
    name = url.css('.ib_main_header').children[0].text || "name"
    # student_names = @scraped_content.css('.home-blog .blog-title .big-comment h3 a').text
  end

  def get_links_to_student_pages
    urlmap = links_to_crawl.map { |link| "http://students.flatironschool.com/" + link  }
    links_to_crawl = student_list_item.map { |i| i.attributes["href"].value  }
  end

  def get_student_quotes
    quote = url.css('.textwidget h3')[0].children.text.strip || "quote"
  end

  def get_student_cities
    cities =  url.css('h3')[-3].parent.parent.children[5].children.map { |city| city.text.strip || "cities" }.reject(&:empty?)
  end

  def get_student_bios
    bio = url.css('h3')[1].parent.parent.children[5].text.strip || "bio"
  end

  def get_student_personal_projects
    personal_projects = url.css('h3')[-4].parent.parent.children[5].text.strip || "projects"
  end

  def get_coder_cred
    url.css(".coder-cred a").each do |instance|
      social_media_array << instance.attributes["href"].value
    end
  end

  def get_coder_cred
    url.css(".social-icons a").each do |link|
      social_media_array << link.attributes["href"].value
    end
  end

  def get_social_media
    social_media_array = social_media_array.uniq || "social media"
  end

  def add_to_db
    db = SQLite3::Database.new( "test.db" )
    db.execute(" create table if not exists student (
    student_name varchar2(30),
    image varchar2(30),
    quote text,
    biography text
    )
    ;")

    db.execute( "insert into student values ( ?, ?,?,? )",
    *student_name,*image,*quote, *biography )
  end
 end

scraper = Scraper.new
scraper("http://students.flatironschool.com")

 binding.pry

