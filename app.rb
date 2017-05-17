require("bundler/setup")
Bundler.require(:default)
require("pry")

ENV['RACK_ENV'] = 'test'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

############################
####### Home Page ##########
############################

get('/') do
  erb(:index)
end

############################
####### User login #########
############################

#link to register page
get ('/user/signup') do
  erb(:user_signup)
end

#User Sign in
get('/user/login') do
  erb(:user_login)
end

#User Sign Up
post ('/users/new') do
  sign_up_name = params.fetch('sign_up_name')
  user_name = params.fetch('user_name')
  password = params.fetch('password')
  @new_user = User.new({:name => sign_up_name, :password => password, :login => user_name })
  if @new_user.save()
    redirect('/')
  else
    @errors = @new_user
    erb(:user_signup)
  end
end

#User Login
post ('/users_login') do
  @user_input_name = params.fetch('login_name')
  @password = params.fetch('password')
  @user = User.find_by(login: @user_input_name)
  if @user_input_name && @user == nil
    erb(:user_login)
  elsif @user.password() == @password
    redirect('/users/'.concat((@user.id).to_s) + '/languages')
  else
    erb(:user_login)
  end
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
  erb(:dashboard)
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
get('/users/:user_id/languages/:language_id/tips/new') do
  @user = User.find(params.fetch("user_id").to_i())
  @language = Language.find(params.fetch("language_id").to_i())
  erb(:tip_form)
end

get('/users/:user_id/languages/:language_id/tips') do
  @user = User.find(params.fetch("user_id").to_i())
  @language = Language.find(params.fetch("language_id").to_i())
  @tips = @language.tips.all()
  erb(:tips)
end

post('/users/:user_id/languages/:language_id/tips/new') do
  @user = User.find(params.fetch("user_id").to_i())
  @language = Language.find(params.fetch("language_id").to_i())
  tip_name = params.fetch('name')
  tip_description = params.fetch('description')
  @tip = Tip.create({:name => tip_name, :description => tip_description, :language_id => @language.id()})
  redirect('/users/'.concat((@user.id).to_s) + '/languages/'.concat((@language.id).to_s)+'/tips')
end
