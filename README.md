# Dependencies

* Ruby 2.4.1
* Rails 5.1.1
* SQLite 3.x

# How to prepare to the application run
```
git clone git@github.com:eoliveiramg/viva_challenge.git
cd viva_challenge/

gem install bundler

bundle install

rails s
```

#### Before you start registering the new property, you need to import the city map
Execute the API:
`POST /api/v1/provinces`
with body disponible in `/public/city_map.json`

### Good! Now you are prepared to register yours properties
