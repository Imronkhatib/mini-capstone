require 'unirest'

  response = Unirest.post("http://localhost:3000/v1/products", parameters{
    name_input: "Peanuts",
    price_input: 0,
    image_url_input: "there isn't one",
    description_input: "This is something a lot of people are alergic to, and that sucks."
  }
  )

  puts json: response.body 