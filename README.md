# Study Buddy

#### Created by: Brian Fan, Dan Jacob, Anatoliy Klots, Anna Horodetska

# Description
Study Buddy is a program designed to assist students with studying. Users will be able to organize their studying in a very uniform manner. Some typical studying methods that students rely on are featured in Study Buddy, such as flashcards, collecting resources, referencing past projects, and jotting down tips.


## Prerequisites

###### To run this application, you must have postgres, Ruby, Sinatra, and the specific gems required listed in the Gemfile installed on your local device

## Installing

##### Before viewing this application it is imperative to follow the instructions below

 1. In the terminal, change into the desktop, and clone this repository, after cloning/download is complete run bundle to download all gems

```
cd desktop
git clone https://github.com/txbluebee/study_buddy.git
bundle
```
2. After this step is complete, you should open a new tab in the terminal (Alt +T) and run the following command

```
postgres
```
*At this point you should have postgres running in the background, postgres will not require any further action*


3. Next, you must create the local database required to run this application, users will not be expected to manually create local databases as the ActiveRecord gem handles this functionality. Simply, type in these commands in order. (Revert back to the original window)

```
rake db:create
rake db:migrate
rake db:test:prepare
```
4. Preferably in a new tab in the terminal, but not mandatory, users should now run one last command in the terminal to get a local server running, by simply typing in
```
ruby app.rb
```
*After these steps are complete you can view the application by navigating to your preferred browser and typing (or pasting) in the URL bar the "link" listed below*

```
localhost:4567
```
## Support and contact details

Should any issues occur contact Brian, and only Brian

## Technologies Used
 HTML, CSS, Bootstrap, Ruby, Sinatra, Capybara, Postgres, PSQL, ActiveRecord,

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
