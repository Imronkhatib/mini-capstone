require 'unirest'

  response = Unirest.post("http://localhost:3000/v1/products", parameters{ 
    name: "Peanuts", 
    price: 0, 
    image_url: "there isn't one", 
    description: "This is something a lot of people are alergic to, and that sucks."
  }
  )

  puts json: response.body 