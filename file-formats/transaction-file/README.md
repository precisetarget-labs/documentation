# Transaction File #

This document specifies the requirements for transaction files.

### File Specifications ###

- Must be a comma-separated value (CSV) file - fields delimited by commas (,)
- Rows separated by newline (\n) characters
- - All non-numeric fields encapsulated with double quotation (") character
- UTF-8 encoding
- Include header ("EmailHash", "TransactionDate", "SKU", "UPC", "Quantity", "RetailPrice", "Price", "ZipCode") as first line of file (see [File Contents](#file-contents) for description of each field)


### File Contents ###

Each row should describe a transactional purchase for a customer broken down into individual products (i.e. unique combinations of email hash, transaction date, and SKU).  If a customer buys three different products in one transaction, it should result in three different rows.  If a customer buys three different products but overall buys five items, it should result in three different rows and the duplicate products should be reflected in the quantity.

Below is a detailed description of each field (see [Transaction File Sample](./examples/transaction_file_sample.csv) for sample file):


Header Name | Type | Description | Required?
--------- | ---- | -----------|--------
EmailHash | string | Hashed customer email (see [Email Hashing documentation](https://github.com/precisetarget-labs/documentation/blob/master/email-hashing/README.md) for details about hashing requirements and examples) | Yes
TransactionDate | string | Date of transaction in YYYY-MM-DD format (ex. "2018-08-31")| Yes
SKU | string | Stock Keeping Unit for purchased item (uniquely identifies a product within a company but not necessarily universal across companies - generally alphanumeric code of varying length) | Yes
UPC | string | Unique Product Code for purchased item (consistent across different companies - generally 12 digits) | No
Quantity | int | Number of same item purchases of SKU by customer for that transaction | No
RetailPrice | decimal | Retail price or non-sale price (must be equal to or greater than Price field) for product, retail price should not be multiplied by quantity (ex. 2.99) | No
Price | decimal | Price that customer paid for individual item, price should not be multiplied by quantity (ex. 2.99) | No
ZipCode | int | Zip code where transaction occurred | No
