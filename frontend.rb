require 'unirest'

# response = Unirest.post("http://localhost:3000/v1/products", parameters:{ 
#     name: "", 
#     price: 0,
#     stock: "true", 
#     image_url: "there isn't one", 
#     description: ""
#   }

# puts json: response.body 



# response = Unirest.patch("http://localhost:3000/v1/products/2",parameters:{ 
#     name: "Candy", 
#     price: 1.0,
#     stock: "true", 
#     image_url: "there isn't one", 
#     description: "This is some random candy, you could eat it and who knows... maybe it'll fix your frontend.rb"
#   }
#   )
# puts json: response.body 
# p 'What do you want to search?'
# search_term = gets.chomp

# response = Unirest.get("http://localhost:3000/v1/products?search=#{search_term}")

# puts json: response.body

# p 'What do you want to search?'
# search_term = gets.chomp

# response = Unirest.get("http://localhost:3000/v1/products?search=#{search_term}")

# puts json: response.body

# response = Unirest.post("http://localhost:3000/v1/users", parameters: 
#   {
#     name: "Michael",
#     email: "michael.jordan@gmail.com",
#     password: "password",
#     password_confirmation: "password"
#   }
# )
# p response.body 


# response = Unirest.post("http://localhost:3000/user_token", parameters: 
#   {
#     auth: {
#       email: "michael.jordan@gmail.com",
#       password: "password"
#   }
#   }
# )

# p response.body

# jwt =  response.body["jwt"]

# Unirest.default_header("Authorization"), "Bearer #{jwt}")
puts 'Please make a selection'
puts '[1] Log in'
puts '[2] Show all products'
puts '[3] Create an order'

input_option = gets.chomp.to_i

if input_option == 2
  response = Unirest.get("http://localhost:3000/v1/products")
  products = response.body
  p "hello"
  puts products
elsif input_option == 3
  puts 'What is the product ID?'
  input_id = gets.chomp.to_i
  puts 'How many do you want?'
  input_quantity = gets.chomp.to_i
  response = Unirest.post("http://localhost:3000/v1/orders",
    parameters:
      {
        user_id: input_id,
        product_id: 2,
        quantity: input_quantity,
        subtotal: 3,
        tax: 3 * 0.065,
        total: 3 + (3 * 0.065)
      }
    )
  p response.body
end