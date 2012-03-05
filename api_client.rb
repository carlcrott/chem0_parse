require './lib/api.rb' #this might be loaded by default?
require 'nokogiri'
 
# CRUD example with an api
 
def list_employees(api_object)
  puts "Current Employees:"
  doc = Nokogiri::XML.parse api_object.read
  names = doc.xpath('employees/employee/name').collect {|e| e.text }
  puts names.join(", ")
  puts ""
end

def list_processes(api_object)
  puts "Current Employees:"
  doc = Nokogiri::XML.parse api_object.read
  names = doc.xpath('chemoinformatics/chemoinformatic/output_process').collect {|e| e.text }
  puts names.join(", ")
  puts ""
end

 
api = Api.new
puts "Placing a new process"
api.create_oscar "To a solution of 3-bromobenzophenone (1.00 g, 4 mmol) in MeOH (15 mL) was added sodium borohydride (0.3 mL, 8 mmol) portionwise at rt and the suspension was stirred at rt for 1-24 h. The reaction was diluted slowly with water and extracted with CH2Cl2. The organic layer was washed successively with water, brine, dried over Na2SO4, and concentrated to give the title compound as oil (0.8 g, 79%), which was used in the next reaction without further purification. MS (ESI, pos. ion) m/z: 247.1 (M-OH)."



# ----------------------- old calls ----------------------------
#list_employees(api)
# 
## Create
#puts "Creating someone..."
#api.create "Bobby Flay", 1999
#list_employees(api)
# 
## Read one and do nothing with it
#api.read 1
# 
## Read all and get valid IDs
#doc = Nokogiri::XML.parse api.read
#ids = doc.xpath('employees/employee/id').collect {|e| e.text }
# 
## Update last record
#puts "Updating last record ..."
#api.update ids.last, "Robert Flaid", 2001
#list_employees(api)
# 
## Delete
#puts "deleting last record ..."
#api.delete ids.last
#list_employees(api)
