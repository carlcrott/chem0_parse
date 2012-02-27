# http://squarism.com/2011/04/01/how-to-write-a-ruby-rails-3-rest-api/

$ rails new rest_api --database=postgresql

# added .rvmrc
# configured Gemfile
# placed config/database.yml

$ rails g scaffold employee name:string extension:integer

$ bundle exec rake db:migrate
# sucessfully created table schema_migrations in postgreSQL


$ rails s


http://localhost:3000/employees
# created new employees

# created:
#    # /new.xml
#    <?xml version="1.0" encoding="UTF-8"?>
#    <employee>
#      <extension type="integer">3456</extension>
#      <name>Randy Rhodes</name>
#    </employee>

# runs the insertion of the Randy Rhodes employee
$ curl -v -H "Content-Type: application/xml; charset=utf-8" --data-ascii @new.xml http://localhost:3000/employees.xml

# returns all employees
$ curl http://localhost:3000/employees.xml

# returns a single employee
$ curl http://localhost:3000/employees/1.xml

# deletes employee 3
$ curl --request DELETE http://localhost:3000/employees/3.xml






#removed the employee from DB
$ rake db:migrate VERSION=0 # drops DB back to before first migration
# deleted the employee migration

$ bundle exec rake db:migrate
# all golden w/o employee in DB










# fire up the rails console:
$ rails c

# create a new instance
> u = Chemoinformatic.new # Chemoinformatic ... not "Chemoinformatics"

# Run that PARSE
> u.oscar_parse

### AWESOME ###


































### ------------ GENERAL NOTES  -------------
interface > ajax > "rails model / controller" > "RJB" > "OSCAR-4" > "model / controller" > "ORM ( activerecord )" > "DB ( postgresql )"

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
  

