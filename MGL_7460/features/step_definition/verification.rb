require_relative '../../main/user_info'

Given(/^Input user name by the user$/) do
  @mp = UserInformation.new()
end

When(/^verify the user's name with the database information$/) do
  @name = @mp.enter_name()
  @name_db = @mp.retrieve_info()

  if (@name == @name_db)
    @result ='OK'
  else
    @result ='NO'
  end
end

Then(/^show the result$/) do
  if (@result == 'OK')
    puts "the name exist in our database"
  else
    puts "the name doesn't exist in our database"
  end
  # if the entered user name is in the database write successful else write failed
end