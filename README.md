# README

## How to replicate base
```
sudo apt install postgresql
sudo apt install libpq-dev
rails new graphql-library --api -d postgresql

bundle add graphql
rails generate graphql:install

(after Gemfile modifications)
bundle _2.5.23_ exec tapioca init
bundle _2.5.23_ exec tapioca dsl
rails db:create
```

### Gemfile
```
gem 'faker'
gem 'sorbet', :group => :development
gem 'sorbet-runtime'
gem "sprockets-rails"
gem "graphiql-rails"
```

### application.rb
```
require "sprockets/railtie"
```

### routes.rb
add into Rails.application.routes.draw
```
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
```


### app/assets/config/manifest.js
```
//= link graphiql/rails/application.css
//= link graphiql/rails/application.js
```

## Start server
```
rails server
```

=> localhost:3000

=> localhsot:3000/graphiql

## Typecheching

bundle \_2.5.23\_ exec srb tc
