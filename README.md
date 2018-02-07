## ContentParser

An Api only app (using rails 5 api features) to parse the text of `<h1>`, `<h2>`, `<h3>` and `<a>` tag if given a valid URL to the api endpoint

## Setup
1. Install ruby 2.5.0
1. Clone the project and cd into it
1. Run `$ bin/setup`
1. Start the server `$ rails server`

## Documentation
Parsing of URL has been done using `gem nokogiri`. And the bulk create to database has been handled using gem `activerecord-import`.

Nokogiri parser code can be found in `/lib/parser.rb`, there you can edit `@parsable_tags` variable in case you want to add more HTML tags to be parsed for its text contents.

## API Docs
Example curl command to parse the content of given URL

```curl -H "Content-Type: application/json" -X POST -d '{"url":"https://www.lipsum.com/"}' http://localhost:3000/api/v1/index_contents```

Example curl command to get the list of previously parsed url with their contents

```curl -H "Content-Type: application/json" http://localhost:3000/api/v1/index_contents```

## Testing
All the unit test has been written using `rspec-rails`, to run rpsec use this command `$ bundle exec rspec`
