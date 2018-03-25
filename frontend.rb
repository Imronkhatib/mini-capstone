require 'unirest'

# p 'What do you want to search?'
# search_term = gets.chomp

# response = Unirest.get("http://localhost:3000/v1/products?search=#{search_term}")

# puts json: response.body

# p 'What do you want to search?'
# search_term = gets.chomp

# response = Unirest.get("http://localhost:3000/v1/products?search=#{search_term}")

# puts json: response.body



require 'unirest'

while true

puts 'Please make a selection'
puts '[1] Sign Up'
puts '[2] Log in'
puts '[3] Create a new product'
puts '[4] Update a product'
puts '[5] Destory a product'
puts '[6] Make a new order'
puts '[7] View existing orders'

input_option = gets.chomp.to_i

  if input_option == 1
    p 'What is your name?'
      input_name = gets.chomp
    p 'What is your email address?'

      input_email = gets.chomp
    p 'What is your password?'
      input_password = gets.chomp
    p 'Confirm your password.'
      input_password_confirmation = gets.chomp

      response = Unirest.post("http://localhost:3000/v1/users", parameters: 
  {
    name: "#{input_name}",
    email: "#{input_email}",
    password: "#{input_password}",
    password_confirmation: "#{input_password_confirmation}"
  }
)
  puts json: response.body
  elsif input_option == 2

    p 'What is your email?'
      input_email = gets.chomp
    p 'What is your password?'
      input_password = gets.chomp
      response = Unirest.post("http://localhost:3000/user_token", parameters: 
  {
    auth: {
            email: "#{input_email}",
            password: "#{input_password}"
          }
  }
  )
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  elsif input_option == 3

    p 'What is the name of your product'
      input_name = gets.chomp
    p 'What price is it'
      input_price = gets.chomp.to_i
    p 'Is it in stock?'
      input_stock = gets.chomp
    p 'What is this product like (enter in a description)'
      input_description = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/products", parameters:
    { 
      name: "#{input_name}", 
      price: "#{input_price}",
      stock: "#{input_stock}", 
      description: "#{input_description}"
    }
    )
    puts json: response.body
  elsif input_option == 4
    p 'Which product would you like to update?'
      input_id = gets.chomp.to_i
    p 'What is the updated name of your product'
      input_name = gets.chomp
    p 'What is the updated price'
      input_price = gets.chomp.to_i
    p 'Is it still in stock?'
      input_stock = gets.chomp
    p 'Enter in a description'
      input_description = gets.chomp
    response = Unirest.patch("http://localhost:3000/v1/products/#{input_id}",parameters:{ 
    name: "#{input_name}", 
    price: "#{input_price}",
    stock: "#{input_stock}",  
    description: "#{input_description}"
  }
  )
puts json: response.body 

elsif input_option == 6
  p "What product would you like?"
  input_id = gets.chomp.to_i
  p "How many would you like?"
  input_quantity = gets.chomp.to_i
  response = Unirest.post("localhost:3000/v1/orders", parameters: {
      product_id: 3,
      quantity: 10
    }
  )
  p response.body

  end
end