ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

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
    Tag.all().each() do |tag|
      tag.destroy()
    end
    Flashcard.all().each() do |flascard|
      flascard.destroy()
    end
  end
end
