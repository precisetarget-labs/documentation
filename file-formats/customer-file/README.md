# Customer Email Hash File #

This document specifies the requirements for customer email hash files.

### File Specifications ###

- Must be a comma-separated value (CSV) file - fields delimited by commas (,)
- Rows separated by newline (\n) characters
- All non-numeric fields encapsulated with double quotation (") character
- UTF-8 encoding
- Include header ("EmailHash") as first line of file (see [File Contents](#file-contents) for description of each field)


### File Contents ###

Each row should be a unique customer email hash.

Below is a detailed description of each field (see [Customer File Sample](./examples/customer_file_sample.csv) for sample file):


Header Name | Type | Description | Required?
--------- | ---- | -----------|--------
EmailHash | string | Hashed customer email (see [Email Hashing documentation](https://github.com/precisetarget-labs/documentation/blob/master/email-hashing/README.md) for details about hashing requirements and examples) | Yes
