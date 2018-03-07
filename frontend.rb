require 'unirest'

response = Unirest.get("http://localhost:3000/shoes")

p response.body