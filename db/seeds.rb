

# supplier2 = Supplier.new(name:"Imron Khatib",email: "imron.k@imron.com", phone_number: "2042055555")

# supplier3 = Supplier.new(name:"Jake Jaco",email: "Jaaaako@imron.com", phone_number: "32213481681")

# supplier3.save

products = Product.all

supplier_id = [1,2,3]

products.each do |product|

  product.supplier_id = supplier_id.sample()
  product.save
end