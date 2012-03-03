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
$ curl -v -H "Content-Type: application/xml; charset=utf-8" --data-ascii @new.xml http://127.0.0.1:3000/users.xml

# returns all employees
$ curl http://localhost:3000/users.xml

# returns a single employee
$ curl http://localhost:3000/users/1.xml

# deletes employee 3
$ curl --request DELETE http://localhost:3000/users/3.xml






#removed the employee from DB
$ rake db:migrate VERSION=0 # drops DB back to before first migration
# deleted the employee migration

$ bundle exec rake db:migrate
# all golden w/o employee in DB








# ------------------------ Handled by heroku JVM / sinatra API --------------------------

# fire up the rails console:
$ rails c

# create a new instance
> u = Chemoinformatic.new # Chemoinformatic ... not "Chemoinformatics"

# Run that PARSE
> u.oscar_parse

# --------------------------------------------------------------------------------------




## Began UI work

# added UI gemfiles
gem 'haml'
gem 'sass'
gem 'compass'

# rename .erb to .haml
app/views/account/login.html.erb → app/views/account/login.html.haml





# for testing purposes run rails on diff port
rails s -p 9191


# controller actions work ...
# got this error:

PG::Error: ERROR:  value too long for type character varying(255)


# dropped db back
$ rake db:migrate VERSION=0

# edited migrations:
      t.text :input_process
      t.text :output_process



# remigrate w the new expanded 
$ bundle exec rake db:migrate


CREATING NEW CHEMOINFORMATIC PROCESSES WORKS!!!!!

"To a solution of 3-bromobenzophenone (1.00 g, 4 mmol) in MeOH (15 mL) was added sodium borohydride (0.3 mL, 8 mmol) portionwise at rt and the suspension was stirred at rt for 1-24 h. The reaction was diluted slowly with water and extracted with CH2Cl2. The organic layer was washed successively with water, brine, dried over Na2SO4, and concentrated to give the title compound as oil (0.8 g, 79%), which was used in the next reaction without further purification. MS (ESI, pos. ion) m/z: 247.1 (M-OH)."































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




