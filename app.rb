require("bundler/setup")
Bundler.require(:default)
require("pry")

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end

get ('/user_login') do
  erb(:user_login)
end

post ('/log_in') do
  login = params[:login]
  password = params[:password]
  @user = User.create({:login => login, :password => password})
  @languages = Language.all()
  erb(:languages)
end

post ('/add_language') do
  name = params[:name]
  @language = Language.create({:name => name})
  @languages = Language.all()
  erb(:languages)
end

get('/languages/:id') do
  new_language_id = params.fetch('id').to_i()
  @language = Language.find(new_language_id)
  erb(:language)
end
get ('/tags') do
  @tags = Tag.all()
  erb (:tags)
end

get('/projects/new') do
  erb(:project_form)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
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

post('/projects/new') do
  name = params.fetch('name')
  date = params.fetch('date')
  description = params.fetch('description')
  github = params.fetch('github')
  @project = Project.create({:name => name, :date => date, :description => description, :github => github})
  redirect('/projects')
end

get('/tips/new') do
  erb(:tip_form)
end

get('/tips') do
  @tips = Tip.all()
  erb(:tips)
end

post('/tips/new') do
  name = params.fetch('name')
  description = params.fetch('description')
  @tip = Tip.create({:name => name, :description => description})
  redirect('/tips')
 end
