# README

## About

* API for merchant information with functionality to import CSV files included under `./db/data`.
* Project created based on the requirements for [Rales Engine](https://backend.turing.io/module3/projects/rails_engine_modified)

* Requirements: Ruby 2.4.1, Rails 5.2.3

* Gems: Factory Bot, Capybara, SimpleCov, ActiveDesign, Faker, FastJSON


### How to run the application
1. Clone repository
2. Run `bundle install`
3. Run `rake db:{drop,create,migrate}` to create database
4. Run `rake import:all` to import all CSV files under `./db/data`
5. Run `rails s` to load server
6. Visit `http://localhost:3000` in Chrome browser and include endpoints below to see data

### How to run the test suite 
* Enter `rspec` into the terminal command line in the root of the directory

## Endpoints

### Records Endpoints
##### Merchant
* `GET /api/v1/merchants` returns all merchants
* `GET /api/v1/merchants/:id` returns a single merchant
* `GET /api/v1/merchants/find?id=x` returns first merchant with id equal to x
* `GET /api/v1/merchants/find?name=x` returns first merchant with name equal to x
* `GET /api/v1/merchants/find?created_at=x` returns first merchant with created_at equal to x
* `GET /api/v1/merchants/find?updated_at=x` returns first merchant with updated_at equal to x
* `GET /api/v1/merchants/find_all?id=x` returns all merchants with id equal to x
* `GET /api/v1/merchants/find_all?name=x` returns all merchants with name equal to x
* `GET /api/v1/merchants/find_all?created_at=x` returns all merchants with created_at equal to x
* `GET /api/v1/merchants/find_all?updated_at=x` returns all merchants with updated_at equal to x
* ` GET api/v1/merchants/random` returns one random merchant record
##### Customer
* `GET /api/v1/customers` returns all customers
* `GET /api/v1/customers/:id` returns a single customer
* `GET /api/v1/customers/find?id=x` returns first customer with id equal to x
* `GET /api/v1/customers/find?first_name=x` returns first customer with first_name equal to x
* `GET /api/v1/customers/find?last_name=x` returns first customer with last_name equal to x
* `GET /api/v1/customers/find?created_at=x` returns first customer with created_at equal to x
* `GET /api/v1/customers/find?updated_at=x` returns first customer with updated_at equal to x
* `GET /api/v1/customers/find_all?id=x` returns all customers with id equal to x
* `GET /api/v1/customers/find_all?first_name=x` returns all customers with first_name equal to x
* `GET /api/v1/customers/find_all?last_name=x` returns all customers with last_name equal to x
* `GET /api/v1/customers/find_all?created_at=x` returns all customers with created_at equal to x
* `GET /api/v1/customers/find_all?updated_at=x` returns all customers with updated_at equal to x
* `GET api/v1/customers/random` returns one random customer record
##### Item
* `GET /api/v1/items` returns all items
* `GET /api/v1/items/:id` returns a single item
* `GET /api/v1/items/find?id=x` returns first item with id equal to x
* `GET /api/v1/items/find?name=x` returns first item with name equal to x
* `GET /api/v1/items/find?description=x` returns first item with description equal to x
* `GET /api/v1/items/find?unit_price=x` returns first item with unit_price equal to x
* `GET /api/v1/items/find?created_at=x` returns first item with created_at equal to x
* `GET /api/v1/items/find?updated_at=x` returns first item with updated_at equal to x
* `GET /api/v1/items/find_all?id=x` returns all items with id equal to x
* `GET /api/v1/items/find_all?name=x` returns all items with name equal to x
* `GET /api/v1/items/find_all?unit_price=x` returns all items with unit_price equal to x
* `GET /api/v1/items/find_all?description=x` returns all items with description equal to x
* `GET /api/v1/items/find_all?created_at=x` returns all items with created_at equal to x
* `GET /api/v1/items/find_all?updated_at=x` returns all items with updated_at equal to x
* `GET api/v1/items/random` returns one random item record
##### Invoice
* `GET /api/v1/invoices` returns all invoices
* `GET /api/v1/invoices/:id` returns a single invoice
* `GET /api/v1/invoices/find?id=x` returns first invoice with id equal to x
* `GET /api/v1/invoices/find?customer_id=x` returns first invoice with customer_id equal to x
* `GET /api/v1/invoices/find?merchant_id=x` returns first invoice with merchant_id equal to x
* `GET /api/v1/invoices/find?status=x` returns first invoice with status equal to x
* `GET /api/v1/invoices/find?created_at=x` returns first invoice with created_at equal to x
* `GET /api/v1/invoices/find?updated_at=x` returns first invoice with updated_at equal to x
* `GET /api/v1/invoices/find_all?id=x` returns all invoices with id equal to x
* `GET /api/v1/invoices/find_all?customer_id=x` returns all invoices with customer_id equal to x
* `GET /api/v1/invoices/find_all?status=x` returns all invoices with status equal to x
* `GET /api/v1/invoices/find_all?merchant_id=x` returns all invoices with merchant_id equal to x
* `GET /api/v1/invoices/find_all?created_at=x` returns all invoices with created_at equal to x
* `GET /api/v1/invoices/find_all?updated_at=x` returns all invoices with updated_at equal to x
* `GET api/v1/invoices/random` returns one random invoice record
##### Invoice Item
* `GET /api/v1/invoice_item_items` returns all invoice_items
* `GET /api/v1/invoice_items/:id` returns a single invoice_item
* `GET /api/v1/invoice_items/find?id=x` returns first invoice_item with id equal to x
* `GET /api/v1/invoice_items/find?item_id=x` returns first invoice_item with item_id equal to x
* `GET /api/v1/invoice_items/find?invoice_id=x` returns first invoice_item with invoice_id equal to x
* `GET /api/v1/invoice_items/find?quantity=x` returns first invoice_item with quantity equal to x
* `GET /api/v1/invoice_items/find?unit_price=x` returns first invoice_item with unit_price equal to x
* `GET /api/v1/invoice_items/find?created_at=x` returns first invoice_item with created_at equal to x
* `GET /api/v1/invoice_items/find?updated_at=x` returns first invoice_item with updated_at equal to x
* `GET /api/v1/invoice_items/find_all?id=x` returns all invoice_items with id equal to x
* `GET /api/v1/invoice_items/find_all?item_id=x` returns all invoice_items with item_id equal to x
* `GET /api/v1/invoice_items/find_all?invoice_id=x` returns all invoice_items with invoice_id equal to x
* `GET /api/v1/invoice_items/find_all?quantity=x` returns all invoice_items with quantity equal to x
* `GET /api/v1/invoice_items/find_all?unit_price=x` returns all invoice_items with unit_price equal to x
* `GET /api/v1/invoice_items/find_all?created_at=x` returns all invoice_items with created_at equal to x
* `GET /api/v1/invoice_items/find_all?updated_at=x` returns all invoice_items with updated_at equal to x
* `GET api/v1/invoice_items/random` returns one random invoice_item record
##### Transactions
* `GET /api/v1/transaction_items` returns all transactions
* `GET /api/v1/transactions/:id` returns a single transaction
* `GET /api/v1/transactions/find?id=x` returns first transaction with id equal to x
* `GET /api/v1/transactions/find?credit_card_numbeer=x` returns first transaction with credit_card_numbeer equal to x
* `GET /api/v1/transactions/find?invoice_id=x` returns first transaction with invoice_id equal to x
* `GET /api/v1/transactions/find?credit_card_expiration_date=x` returns first transaction with credit_card_expiration_date equal to x
* `GET /api/v1/transactions/find?result=x` returns first transaction with result equal to x
* `GET /api/v1/transactions/find?created_at=x` returns first transaction with created_at equal to x
* `GET /api/v1/transactions/find?updated_at=x` returns first transaction with updated_at equal to x
* `GET /api/v1/transactions/find_all?id=x` returns all transactions with id equal to x
* `GET /api/v1/transactions/find_all?credit_card_numbeer=x` returns all transactions with credit_card_numbeer equal to x
* `GET /api/v1/transactions/find_all?invoice_id=x` returns all transactions with invoice_id equal to x
* `GET /api/v1/transactions/find_all?credit_card_expiration_date=x` returns all transactions with credit_card_expiration_date equal to x
* `GET /api/v1/transactions/find_all?result=x` returns all transactions with result equal to x
* `GET /api/v1/transactions/find_all?created_at=x` returns all transactions with created_at equal to x
* `GET /api/v1/transactions/find_all?updated_at=x` returns all transactions with updated_at equal to x
* `GET api/v1/transactions/random` returns one random transaction record


### Relationship Endpoints

##### Merchants
* `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders
##### Invoices
* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/invoices/:id/items` returns a collection of associated items
* `GET /api/v1/invoices/:id/customer` returns the associated customer
* `GET /api/v1/invoices/:id/merchant` returns the associated merchant
##### Invoice Items
* `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
* `GET /api/v1/invoice_items/:id/item` returns the associated item
##### Items
* `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/items/:id/merchant` returns the associated merchant
##### Transactions
* `GET /api/v1/transactions/:id/invoice` returns the associated invoice
##### Customers
* `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices
* `GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

### Business Intelligence 

No business intelligence endpoints available


