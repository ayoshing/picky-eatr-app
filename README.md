# Picky Eatr

> An app to help you and your friends decide what to eat.

Picky Eatr was created with Ruby on Rails and was intended to solve an age old question. "What should we eat?" Powered by Yelp's API, with Picky Eatr, users are only a few clicks away from tasty yums around their area.

## Installation

OS X & Linux:

```sh
bundle install
rails db:migrate
rails s
```

Additional installation steps:

1.  You need to have an API key from Yelp.
2.  Create a .env file in the project root directory and add API_KEY into an ENV variable.

```sh
API_KEY="whatever_your_yelp_api_key_is"
```

> inside the .env file

## Usage example

First signup for an account or login.

![picky-demo-1](https://github.com/ayoshing/picky-eatr-app/tree/master/public/demo/picky-eatr-demo-1.gif)

Users can pick as many cuisine preferences as they like. After selecting all the interested cuisines, Picky Eatr generate a match between preferences to vote on.

![picky-demo-2](https://github.com/ayoshing/picky-eatr-app/tree/master/public/demo/picky-eatr-demo-2.gif)

After the last vote, Picky Eatr will bring the user to the top 5 restaurants around their location recommended by Yelp. On selection of the restaurant, it'll link the user to the restaurant's Yelp page.

[Video Demo](https://youtu.be/JiDseL77Noo)

## Release History

- 0.0.1
  - Pre-alpha release (demo)

## Meta

Shing Wong – [@ayoshing](https://twitter.com/ayoshing) – shing2487@gmail.com

Changmin Lim –
https://www.imchorong.com/ - cl2534@nyu.edu

Distributed under the MIT license. See `LICENSE` for more information.

[https://github.com/ayoshing/picky-eatr-app](https://github.com/ayoshing/picky-eatr-app)

## Contributing

1.  Fork it (<https://github.com/ayoshing/picky-eatr-app/fork>)
2.  Create your feature branch (`git checkout -b feature/fooBar`)
3.  Commit your changes (`git commit -am 'Add some fooBar'`)
4.  Push to the branch (`git push origin feature/fooBar`)
5.  Create a new Pull Request

<!-- Markdown link & img dfn's -->
