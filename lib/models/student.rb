class Student
  attr_accessor :id, :name, :image, :link, :bio

  @@db ||= SQLite3::Database.new("../db/#{self.to_s.downcase}s.db")

  def self.table_exists?
    sql = "SELECT name FROM sqlite_master WHERE type='table' AND name='students';"
    results = db.execute sql
    results.flatten.first == 'students'
  end

  def url
    name.downcase.gsub(" ", "-")
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      );
    SQL

    @@db.execute(sql)
  end

  def self.all
    sql = "SELECT * FROM students"
    results = @@db.execute(sql)

    results.collect do |row|
      new_from_db(row)
    end
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS students;
    SQL

    db.execute(sql)
  end

  def self.reset_database
    self.drop_table
    self.create_table
  end

  def self.table_name
    "students"
  end

  def self.new_from_db(row)
    s = Student.new
    s.id = row[0]
    s.name = row[1]
    s.saved!
    s
  end

  def save
    saved? ? update : insert
  end

  def saved!
    @saved = true
  end

  def saved?
    @saved
  end

  def update
    if saved?
      sql = "UPDATE dogs SET name = ?, color = ?, bio = ? WHERE id = ?"
      @@db.execute(sql, self.name, self.color, self.bio, self.id)
    end
  end


  def self.find(id)
    find = "SELECT * FROM students WHERE id = ?"
    result = @@db.execute(find, id)
    Student.new_from_db(result.first)
  end

  def insert
    sql = "INSERT INTO students (name) VALUES (?)"
    @@db.execute(sql, self.name)
    saved!
    find = "SELECT id FROM students WHERE name = ? ORDER BY id DESC LIMIT 1"
    results = @@db.execute(find, self.name)
    @id = results.flatten.first
  end
  
end