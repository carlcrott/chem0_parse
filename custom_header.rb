# http://stackoverflow.com/questions/587559/ruby-how-to-make-an-http-get-with-modified-headers
require 'uri'
require 'net/http'


process = "To a solution of 3-bromobenzophenone (1.00 g, 4 mmol) in MeOH (15 mL) was added sodium borohydride (0.3 mL, 8 mmol) portionwise at rt and the suspension was stirred at rt for 1-24 h. The reaction was diluted slowly with water and extracted with CH2Cl2. The organic layer was washed successively with water, brine, dried over Na2SO4, and concentrated to give the title compound as oil (0.8 g, 79%), which was used in the next reaction without further purification. MS (ESI, pos. ion) m/z: 247.1 (M-OH)."


uri = URI("http://localhost:3000/parse")
http = Net::HTTP.new(uri.host, uri.port)
headers = { 'Process' => process }

codified_process = []

http.get(uri.path, headers) do |chunk|
    codified_process << chunk
end

puts codified_process.join("\n") # DB this shit!

