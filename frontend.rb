require 'unirest'

# response = Unirest.post("http://localhost:3000/v1/products", parameters:{ 
#     name: "", 
#     price: 0,
#     stock: "true", 
#     image_url: "there isn't one", 
#     description: ""
#   }

# puts json: response.body 



response = Unirest.patch("http://localhost:3000/v1/products/2",parameters:{ 
    name: "Candy", 
    price: 1.0,
    stock: "true", 
    image_url: "there isn't one", 
    description: "This is some random candy, you could eat it and who knows... maybe it'll fix your frontend.rb"
  }
  )
puts json: response.body 