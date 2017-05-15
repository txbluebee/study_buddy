require("bundler/setup")
Bundler.require(:default)
require("pry")

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ('/user_login') do

  erb(:user_login)
end

post ('/log_in') do
  login = params[:login]
  password = params[:password]
  @user = User.create({:login => login, :password => password})
  erb(:user_dashboard)
end

get ('/tags') do
  @tags = Tag.all()
  erb (:tags)
end

post ('/add_tag') do
  name = params[:name]
  new_tag = Tag.create({:name => name})
  @tags = Tag.all()
  erb(:tags)
end

get('/tags/:id') do
  tag_id = params.fetch('id').to_i()
  @tag = Tag.find(tag_id)
  @flashcards = Flashcard.all()
  erb(:tag)
end
