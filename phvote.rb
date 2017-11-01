require 'watir'




def hashTheUsers()
  all = Hash.new
  file = File.open("accounts.txt")
  file.each do |x|
    index = x.index(" ") #results in going to comma
    len = x.length
    username = x[0,index-1] #-1 because of comma
    pw = x[index+1,len] #1 because no space please
    all[username] = pw
    #puts "Hello! x is #{x}. This resulted in #{all[username]}"
  end
  return all
end

def bringTheMasses(users, link)
  users.each do |username, password|
    goOutAndVote(username, password, link)
  end
  puts "Votes Delivered."
end

def goOutAndVote(user, password, link)
  b = Watir::Browser.new
  sleep(2)
  b.goto("producthunt.com/auth/twitter?origin=%2F")
  b.text_field(:name => "session[username_or_email]").set(user)
  b.text_field(:name => "session[password]").set(password)
  #b.button(:type => "submit").click
  sleep(3)
  b.goto(link)
  sleep(2)
  b.span(:class => "arrow_caca7").click
  sleep(2)
  b.div(:text => "get it").click
  sleep(1)
  puts "Finished with #{user}"
end

users = hashTheUsers

bringTheMasses(users, "https://www.producthunt.com/posts/moviepass-locations")
goOutAndVote(usernames, passwords, emails)