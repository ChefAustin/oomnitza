# Oomnitza

Ruby client library for Oomnitza's API.

## Installation

Add this line to your application's Gemfile:

    gem 'oomnitza'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install oomnitza

## Usage

**USE AT YOUR OWN RISK!**

While best efforts have been made to test this gem, I do not take responsibility for any adverse actions that may be performed by it.

```
require 'oomnitza'

# Configure the client
Oomnitza::Client.configure(tenant: 'yourTeantHere', api_key: 'yourApiKeyHere')

# Return array of all assets (where each  objects)
all_assets = Oomnitza::Api::Asset.all

# Create a new asset
Oomnitza::Api::Asset.create({order_number: '001', po_number: 'chefaustin001', invoice_number: '20181205_chefaustin001_001', manufacturer_1: 'Apple', purchase_price_1: '1234.56', serial_number: 'TEST12345', tracking_number: '1Z1234567890', model: 'MacBook Air 2.7GHz', status: 'Purchased', vendor: 'Apple Direct'})

# Find and delete an asset
asset = Oomnitza::Api::Asset.find('bbb5b60bb80f470b8b008b556300916b')
asset.delete!

# Return array of all software
softwares = Oomnitza::Api::Software.all

# Create new software record
Oomnitza::Api::Software.create({name: 'Microsoft SQL Express', license_key: 'foo123bar456', _license_seats: "5"})

# Modify software record
software = softwares[0]
software.modify({_license_seats: "100"})

# Delete software record by known software_id
Oomnitza::Api::Software.delete('a000a00bddaa0cf0ab0000000f0d00b0')

# Iterate through all users and output username, office.
all_users.each do |u|
  puts "#{u.username} works at #{u.office}"
end

```

## Contributing

Improvements needing to be made:

- Error handling
- `.filter` assets function
- Child asset associations CRUD functions
- DRY-up many aspects of `client.rb`
- [Put a bird on it](https://www.youtube.com/watch?v=iHmLljk2t8M)

Bug reports and pull requests (preferred) are welcome on GitHub at https://github.com/chefaustin/oomnitza. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the project’s codebase and issue tracker is expected to follow the [code of conduct](https://github.com/chefaustin/oomnitza/blob/master/CODE_OF_CONDUCT.md).
