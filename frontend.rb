require 'unirest'


response = Unirest.post("http://localhost:3000/v1/products", parameters:{ 
    name: "", 
    price: 0,
    stock: "true", 
    image_url: "there isn't one", 
    description: ""
  }
  )

puts json: response.body 