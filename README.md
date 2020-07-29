# RSS Reader Made in Sinatra

## Description

This is a RSS Reader application or RSS feeds aggregator 

What is RSS?

RSS means Really Simple Syndication which allows users and applications to access updates to websites in a standardized, computer-readable format. These feeds can, for example, allow a user to keep track of many different websites in a single news aggregator. The news aggregator will automatically check the RSS feed for new content, allowing the content to be automatically passed from website to website or from website to user.

[Watch this video to understand how this app works!](https://youtu.be/GZ-u9Bk6_mE)

[Blog Post about this app](https://dev.to/aurangzaibdanial/sinatra-rss-aggregator-app-30ma)

## Built With

* [Ruby 2.6.3](https://www.ruby-lang.org/en/news/2019/04/17/ruby-2-6-3-released/)
* [Sinatra](http://sinatrarb.com/) and [ActiveRecord](https://apidock.com/rails/ActiveRecord/Base) - The Ruby frameworks used
* [SimpleRSS](https://rubygems.org/gems/simple-rss) - Ruby library for parsing raw RSS
* [PostgreSQL](https://www.postgresql.org/) - The relational database used for production
* [SQLITE3](https://www.sqlite.org/) - The relational database used for development
* HTML5 & CSS

## Usage

This app is hosted on Heroku https://catchup-rss.herokuapp.com using heroku free plan.

**App might take time to load sometimes. The reason is that heroku puts apps which are on free plan to sleep after 30 minutes of inactivity. So when you visit the website, the app is waked from sleep which takes a little time!**

## Development

Try this app in your local environment, clone and run following command inside this project's directory

    $ bundle && bundle exec rake db:schema:load

Start up local server

    $ bundle exec shotgun 

For interactive console

    $ bundle exec rake console

OR

    $ bundle exec tux

## Future improvements
* Add confirm password during sign up
* Add pagination for the articles of a feed

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aurangzaib-danial/sinatra-rss-reader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://contributor-covenant.org/) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SinatraRSSReader project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct).
