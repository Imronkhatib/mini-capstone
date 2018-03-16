

# supplier2 = Supplier.new(name:"Imron Khatib",email: "imron.k@imron.com", phone_number: "2042055555")

# supplier3 = Supplier.new(name:"Jake Jaco",email: "Jaaaako@imron.com", phone_number: "32213481681")

# supplier3.save

image = Image.all

product_id = [1,2,4]

image.each do |image|

  image.product_id = product_id.sample()
  image.save
end

# image = Image.new(url: 'another image')

# image.save

