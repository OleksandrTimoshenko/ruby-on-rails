#!/bin/bash

# script for installing 

sudo apt update -y
sudo apt install -y curl g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev
####gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB # This site is no longer available(((
gpg --keyserver keyserver.ubuntu.com --recv-key 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

sudo apt install -y sqlite3
sudo apt install -y nodejs
sudo apt install -y yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
#(relogin to shell)


# after script
source ~/.rvm/scripts/rvm
rvm install 2.5.0
rvm use 2.5.0 --default
ruby -v

gem install rails
rails --version
rails webpacker:install

rails new blog
cd blog
bin/rails server -b 0.0.0.0   # start ruby on 0.0.0.0 adress
# now you can visit http://10.2.2.25:3000

vi ~/blog/config/routes.rb
'''
Rails.application.routes.draw do
  get "/articles", to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
'''
bin/rails generate controller Articles index --skip-routes


vi ~/blog/app/controllers/articles_controller.rb
'''
class ArticlesController < ApplicationController
  def index
  end
end
'''

vi ~/blog/app/views/articles/index.html.erb
'''
<h1>Hello, Rails!</h1>
'''

bin/rails server -b 0.0.0.0
# now you can visit http://10.2.2.25:3000/articles


### Next 4.3 Setting the Application Home Page
### https://guides.rubyonrails.org/getting_started.html

vi ~/blog/config/routes.rb
'''
# add to file
Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"
end
'''
# now you can visit http://10.2.2.25:3000/

#Generating a Model
bin/rails generate model Article title:string body:text
bin/rails db:migrate


# log into railc comsole
bin/rails console
    article = Article.new(title: "Hello Rails", body: "I am on Rails!")
    article.save
    article
    Article.find(1)
    Article.all
    exit

# Showing a List of Articles
vi ~/blog/app/controllers/articles_controller.rb
'''
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end
'''
vi ~/blog/app/views/articles/index.html.erb
'''
<h1>Articles</h1>

<ul>
  <% @articles.each do |article| %>
    <li>
      <%= article.title %>
    </li>
  <% end %>
</ul>

'''

bin/rails server -b 0.0.0.0
# now you can visit http://10.2.2.25:3000/


### Showing a Single Article
vi ~/blog/config/routes.rb
'''
Rails.application.routes.draw do
  get "/articles", to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"
end
'''

vi ~/blog/app/controllers/articles_controller.rb
'''
# add to file
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
'''

touch ~/blog/app/views/articles/show.html.erb 
vi ~/blog/app/views/articles/show.html.erb 
'''
<h1><%= @article.title %></h1>

<p><%= @article.body %></p>
'''

bin/rails server -b 0.0.0.0
# now you can visit http://10.2.2.25:3000/articles/1

vi ~/blog/app/views/articles/index.html.erb
'''
# add
<h1>Articles</h1>

<ul>
  <% @articles.each do |article| %>
    <li>
      <a href="/articles/<%= article.id %>">
        <%= article.title %>
      </a>
    </li>
  <% end %>
</ul>
'''

### Next 6.2 Resourceful Routing
### https://guides.rubyonrails.org/getting_started.html