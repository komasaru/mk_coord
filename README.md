# MkCoord

## Introduction

This is the gem library which converts coordinates.

## Computable items

* Rectangular position:
  - Equator coordinates -> Ecliptic coordinates (x, y, z)
  - Ecliptic coordinates -> Equator coordinates (x, y, z)
* Polar position:
  - Equator coordinates -> Ecliptic coordinates (lambda, beta)
  - Ecliptic coordinates -> Equator coordinates (alpha, delta)
* Rectangular coordinates -> Polar coordinates (lambda, phi, r)
* Polar coordinates -> Rectangular coordinates (x, y, z)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mk_coord'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mk_coord

## Usage

    require 'mk_coord'
    
    eps = 0.409
    pos_rect = [
       0.99443659220700997281,
      -0.03816291768957833647,
      -0.01655177670960058384
    ]
    pos_pol  = [
       6.24482770879939,
      -0.016630599800372015
    ]
    r = 0.9951686008947793
    p pos_rect
    p pos_pol
    p r
    puts "---"
    p MkCoord.rect_eq2ec(pos_rect, eps)
    p MkCoord.rect_ec2eq(pos_rect, eps)
    p MkCoord.pol_eq2ec(pos_pol, eps)
    p MkCoord.pol_ec2eq(pos_pol, eps)
    p MkCoord.rect2pol(pos_rect)
    p MkCoord.pol2rect(pos_pol, r)

About the units:

* The unit of epsilon(eps) should be radian.
* The unit of polar postion(pos_pol) should be radian.
* Everything is good for the unit of rectangular postion(pos_pol).
* Everything is good for the unit of distance(r).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/komasaru/mk_coord.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

