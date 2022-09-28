# Sweater Weather


## Overview
Welcome to Sweather Weather! This Ruby on Rails API application helps plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

In this service-oriented architecture, the (theoretical) front-end team will communicate with this back-end application through an API. Sweater Weather exposes the API that satisfies the front-end team’s requirements.

## Configuration
  - Clone this repo
  - Run `bundle`
  - Run `bundle exec figaro install`
  - Open your `config/application.yml` file in your code editor (You may have to open it manually). Then, add to the bottom of the `config/application.yml` file **your** api keys:
```
open_weather_api_key: <your_open_weather_api_key>
mapquest_api_key: <your_mapquest_api_key>
unsplash_api_key: Client-ID <your_unsplash_api_key>
```

## Database Creation
  - Run `rails db:{create,migrate}`

## How to Run the Test Suite
### RSpec:
- Delete spec/fixtures/vcr_cassettes, then run `bundle exec rspec`
### Postman:
- In Terminal, run `rails s`
- In Postman, set appropriate HTTP verb, append endpoint URI to `http://localhost:3000/`, and select `SEND`.
- NOTE: For `post` requests, send a JSON payload in the body of the request in Postman. Under the address bar, click on `Body`, select `raw`, and from the dropdown that probably says `Text` in it, choose `JSON`.

### <ins>Contributor</ins>

👤  **Drew MacNicholas**
- Github: [Github](https://github.com/dmacnicholas)
- LinkedIn: [LinkedIn](https:/https://www.linkedin.com/in/drew-macnicholas-20b75660/)
