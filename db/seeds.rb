# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
require 'net/http'
require 'openssl'


url = URI("https://heisenbug-premier-league-live-scores-v1.p.rapidapi.com/api/premierleague/players?team=Chelsea")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'heisenbug-premier-league-live-scores-v1.p.rapidapi.com'
request["x-rapidapi-key"] = '960edd7367mshe661b9427502c52p11caccjsn8537ebebf6d3'

response = http.request(request)
puts response.read_body

players_array = JSON.parse(response.body)["players"]

players_array.each do |player|
    
    Player.create(
    name: player["playerName"],
    age: player["age"],
    position: player["position"],
    active: player["active"])
   end
  
   puts "seeded"