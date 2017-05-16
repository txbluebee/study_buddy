require("bundler/setup")
Bundler.require(:default)
require("pry")

ENV['RACK_ENV'] = 'test'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

####### Home Page ##########

get('/') do
  erb(:home)
end

####### User login ########
get ('/user_login') do
  erb(:user_login)
end

get('/dashboard') do
  erb(:index)
end
####### Selete Languages #######

#teamone
post ('/users/new') do
  name = params.fetch('name')
  password = params.fetch('password')
  new_user = User.create({:name => name, :password => password})
  redirect('/users/'.concat((new_user.id).to_s) + '/languages')
end

get('/users/:user_id/languages') do
  @user = User.find(params.fetch('user_id').to_i)
  @languages = @user.languages
  erb(:languages)
end


# Add New Language
post ("/users/:user_id/languages/new") do
  user_id = params.fetch('user_id').to_i
  @user = User.find(user_id)
  name = params.fetch('name')
  @language = Language.create({:name => name, :user_id => user_id})
  @languages = @user.languages()
  erb(:languages)
end


#User select language to study

post ('/users/:user_id/languages/') do
  user_id = params.fetch('user_id').to_i
  @user = User.find(user_id)
  language_id = params.fetch('language_id').to_i
  redirect('/users/'.concat((user_id).to_s) + '/languages/'.concat((language_id).to_s))
end

#dashboard
get('/users/:user_id/languages/:language_id') do
  user_id = params.fetch('user_id').to_i
  @user = User.find(user_id)
  language_id = params.fetch('language_id').to_i
  @language = Language.find(language_id)
  erb(:index)
end

#Flashcard group
#flashcards home page
get('/flashcards') do
  @flashcards = Flashcard.all()
  erb(:flashcards)
end


# get('/users/:user_id/languages/:language_id/flashcards') do
#   user_id = params.fetch('user_id').to_i
#   @user = User.find(user_id)
#   language_id = params.fetch('language_id').to_i
#   @language = Language.find(language_id)
#   @flashcards = @language.flashcards()
#   erb(:flashcards)
# end
#add a new flashcard

get('/flashcards/new') do
  erb(:flashcard_form)
end

post('/flashcards/new') do
  question = params.fetch('question')
  answer = params.fetch('answer')
  @flashcard = Flashcard.create({:question => question, :answer => answer})
  redirect('/flashcards')
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
