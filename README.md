# Proctor-RSpec

__proc·tor__ _/ˈpräktər/_ _noun_: a person appointed to keep watch over students at examinations.

Proctor-RSpec is a client for [Proctor](http://github.com/c00lryguy/proctor) and a RSpec formatter.

## Installation

Simply add Proctor-RSpec to your Gemfile:

```ruby
group :development do
  gem 'proctor-rspec'
end
```

Now run `bundle install`.

Optionally, you can install through RubyGems with `gem install proctor-rspec`.

> Note: `proctor-rspec` depends on `rspec`, so you do not need to add `rspec` to your Gemfile.

## Usage

In your `spec_helper.rb` file, add the following lines:

```ruby
require 'bundler/setup'
require 'proctor-rspec'

ProctorRspec.configure do |c|
  c.project_name = 'My Project Name'
end

RSpec.configure do |c|
  c.formatter = ProctorRspec::Formatter
end
```

Now `bundle install` and `bundle exec rspec spec` to view your specs run live in Proctor.

The formatter has to output in the terminal.  
To use `proctor-rspec` with other formatters for terminal output, simply pass `rspec` the `-f` flag:

    bundle exec rspec spec -f documentation

## Configuration

<table>
  <tr>
    <th>Key</th>
    <th>Required</th>
    <th>Default</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>server.host</td>
    <td>false</td>
    <td>127.0.0.1</td>
    <td>The IP or hostname that the Proctor server is running on.</td>
  </tr>
  <tr>
    <td>server.port</td>
    <td>false</td>
    <td>3000</td>
    <td>The port that the Proctor server is running on.</td>
  </tr>
  <tr>
    <td>project_name</td>
    <td>true</td>
    <td></td>
    <td>The name of your project/application.</td>
  </tr>
</table>
