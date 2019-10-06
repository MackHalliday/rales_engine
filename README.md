# README

## About

* Requirements: Ruby 2.4.1, Rails 5.2.3

* System dependencies

* Configuration

## How to run the test suite
1. Clone repository
2. Run `bundle install`
3. Run `rake db:{drop,create,migrate}`
4. Run `rails s` to load server

## Enpoints

### Records
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
##### Invoice
##### Invoice Item
##### Transactions

### Relationships

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


