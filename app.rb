require("bundler/setup")
Bundler.require(:default)
require("pry")

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end

get('/projects/new')do
  erb(:project_form)
end

get('/projects')do
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

get('/tips/new') do
  erb(:tip_form)
end

get('/tips') do
  @tips = Tip.all()
  erb(:tips)
end

post('/tips/new')do
  name = params.fetch('name')
  description = params.fetch('description')
  @tip = Tip.create({:name => name, :description => description})
  redirect('/tips')
end
