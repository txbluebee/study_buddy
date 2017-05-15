ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    User.all().each do |user|
      user.destroy()
    end
    Tip.all().each do |tip|
      tip.destroy()
    end
    Project.all().each do |project|
      project.destroy()
    end
    Language.all().each do |language|
    language.destroy()
    end
  end
end
