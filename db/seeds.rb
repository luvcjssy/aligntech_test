# Admin data
Admin.create(email: 'admin@example.com', password: 'password')

# Products data
[{name: 'Cafe', price: '2'},
 {name: 'Coke', price: '1'},
 {name: 'Tea', price: '5'},
 {name: 'Water', price: '3'},
 {name: 'Beer', price: '10'}].each do |product|
  Product.find_or_create_by(product)
end

# Seed customer data
10.times do
  cus = Customer.create(email: Faker::Internet.email, password: Faker::Internet.password)
  [1, 2].sample.times do |i|
    idx = i + 1
    product_attr = Product.all.take(idx).map do |product|
      {product_id: product.id, price: product.price, quantity: idx}
    end

    cus.orders.create(shipping_address: Faker::Address.full_address, order_email: cus.email, order_details_attributes: product_attr)
  end
end