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
##### Customer
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


