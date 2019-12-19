require 'open-uri'
require 'json'
require 'uri'
require 'sqlite3'

class UserInformation
  def enter_name
    puts 'enter a name and then press Enter:'
      #@aa = gets.chop()
      @user_entered_name ='Peter Graham'
    #puts @name
  end

  def calling_API
      request_uri = "https://api.github.com/users/6"
      buffer = open(request_uri).read

      result=JSON[buffer]
      @name = result['name']
      @type = result['type']
        creating_database(@name, @type)
  end

  def creating_database(name, type)
    begin
      db = SQLite3::Database.open "user_info.db"

      db.execute "CREATE TABLE IF NOT EXISTS users(Id INTEGER PRIMARY KEY,
        name TEXT, type INT)"
      db.execute "INSERT INTO users VALUES(1, \'#{name}\', \'#{type}\')"

      rescue SQLite3::Exception => e

        puts "Exception occurred"
        puts e

      ensure
        db.close if db
    end
  end

  def retrieve_info
    begin
      db = SQLite3::Database.open "user_info.db"
      db.execute 'SELECT * FROM users' do |row|
        @ndb = row[1]
          #puts @ndb
          #p row[1]
      end
    rescue SQLite3::Exception => e

      puts "Exception occurred"
      puts e

    ensure
      db.close if db
    end
    @ndb
  end
end

mp = UserInformation.new()
mp.enter_name()
#mp.calling_API()
#mp.retrieve_info()