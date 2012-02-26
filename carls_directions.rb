




$ rails new rest_api --database=postgresql

# added .rvmrc
# configured Gemfile
# placed config/database.yml

# this could be a shitty model migration
$ rails g scaffold employee name:string extension:integers



# This needs verified that its actually interfacing w psql
$ bundle exec rake db:migrate

WARNING: 'require 'rake/rdoctask'' is deprecated.  Please use 'require 'rdoc/task' (in RDoc 2.4.2+)' instead.
    at /home/thrive/.rvm/gems/ruby-1.9.3-p125@restapi/gems/rake-0.9.2.2/lib/rake/rdoctask.rb
WARNING: Global access to Rake DSL methods is deprecated.  Please include
    ...  Rake::DSL into classes and modules which use the Rake DSL methods.
WARNING: DSL method RestApi::Application#task called at /home/thrive/.rvm/gems/ruby-1.9.3-p125@restapi/gems/railties-3.0.5/lib/rails/application.rb:214:in `initialize_tasks'


# sucessfully created table schema_migrations in postgreSQL




































##### BIG QUESTION #########

Jruby + Sinatra + Heroku:
+ native on heroku
- bastiardized gems
process:
  1) build out + connect up user models


--- VRS ---

RoR + RJB + EC2:
+ ec2 experience
+ legitimate gems
- ec2 experience

process:
  1) build out the DB entries
  


interface > ajax > "rails model / controller" > "RJB" > "OSCAR-4" > "model / controller" > "ORM ( activerecord )" > "DB ( postgresql )"








### ------------ GENERAL NOTES  -------------
# these were not run but instead placed here as references

# active-record
http://exposinggotchas.blogspot.com/2011/02/activerecord-migrations-without-rails.html # looks fairly thorough
http://www.blog.bridgeutopiaweb.com/post/activerecord-migrations-for-sinatra/
http://screencasts.org/episodes/configuring-activerecord-in-sinatra


# references
https://github.com/sinatra/sinatra-recipes
http://devcenter.heroku.com/articles/rack
http://sinatra-book.gittr.com/

## NOTE:
<phlebas> "delinquentme: sinatra doesnt know or care about how you manage your database and tables. whether you use a schema or no relational database at all is not sinatra's concern
if you want a schema.rb, write yourself one, if you want config files, put them somewhere and write code to read them
it's not a framework ;)"




db:create_migrations
db:migrate




