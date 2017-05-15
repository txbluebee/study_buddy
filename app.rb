require("bundler/setup")
Bundler.require(:default)
require("pry")

ENV['RACK_ENV'] = 'development'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#Login
get('/') do
  erb(:index)
end

get ('/user_login') do
  erb(:user_login)
end

post ('/log_in') do
  login = params.fetch('login')
  password = params.fetch('password')
  @user = User.new({:login => login, :password => password})
  @user.save()
  binding.pry
  @languages = @user.languages()
  erb(:languages)
end




#Language
post ('/:user_id/add_language/') do
  user_id = params.fetch('user_id').to_i
  @user = User.fing(user_id)
  name = params[:name]
  @language = @user.languages().create({:name => name})
  @languages = @user.languages()
  erb(:languages)
end

get('/user/:user_id/languages/:id') do
  new_language_id = params.fetch('id').to_i()
  @language = Language.find(new_language_id)
  erb(:language)
end


#Tag group
get ('/users/:user_id/languages/:language_id/tags') do
  user_id = params.fetch('user_id').to_i
  @user = User.find(user_id)
  language_id = params.fetch('language_id').to_i
  @language = Language.find(language_id)
  @tags = @language.tags()
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

#Project group
get('/projects/new') do
  erb(:project_form)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

post('/projects/new') do
  name = params.fetch('name')
  date = params.fetch('date')
  description = params.fetch('description')
  github = params.fetch('github')
  @project = Project.create({:name => name, :date => date, :description => description, :github => github})
  redirect('/projects')
end

#Tips
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
