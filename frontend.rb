require 'unirest'

response = Unirest.get("http://localhost:3000/product-page")

p response.body