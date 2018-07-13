require 'http'
require 'json'
require 'pry'

class Yelp

  API_KEY = "yXpW-yoZpxGiysIe4YqNCSEFz5hSdqOdoihT27nwu7W9gaC_2Trs9I-iQNYAcdG8Dp6Z7PDnIe-GcFDgmYjjcfffpOcz8ZW292KSgfQOoetFg_4Jz7wuvhwmDoZDW3Yx"

  API_HOST = "https://api.yelp.com"
  SEARCH_PATH = "/v3/businesses/search"
  BUSINESS_PATH = "/v3/businesses/"

  def self.search_yelp(term, location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: 5
    }

    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    response.parse
  end

  def self.business_yelp(business_id)
    url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"

    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    response.parse
  end

end
