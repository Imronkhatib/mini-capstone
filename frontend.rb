require 'unirest'

# p "Select the page you'd like to view"
# p "[1] All the products"
# p "[2] One of the products"

# user_input = gets.chomp

base_url = "http://localhost:3000/v1"

# if user_input == "1"

  response = Unirest.get("#{base_url}/product-page")

  puts JSON.pretty_generate(response.body) 
# elsif user_input == "2"

# end
