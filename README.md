### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby 2.7.1
- Rails 6.0.3

##### 1. Check out the repository

```bash
git@github.com:luvcjssy/aligntech_test.git
```

##### 2. Go to project directory

```bash
cd <path_to_project>
```

##### 3. Install gems & libraries
```bash
bundle install
yarn install
```

##### 4. Create database.yml file

Edit the database configuration as required.

```bash
config/database.yml
```

##### 5. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create
rails db:migrate
rails db:seed
```

##### 6. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

And now you can visit the site with the URL http://localhost:3000

### Testing

Run command `rspec` or `bundle exec rspec` to run tests

### Sample data

Admin data: 

- email: admin@example.com | password: password

### Describe database 

**The database for this association**

The purpose of this application is to show the different kinds of relations between models with ActiveRecord

- A model Admin
- A model Customer
- A model Order
- A model OrderDetail
- A model Product

The relationships will be:

- Customer has many orders
- Customer has many order details through orders
- Order belongs to a customer
- Order has many order details
- Order has many products through order details
- Order detail belongs to an order
- Order detail belongs to a product
- Product has many order details