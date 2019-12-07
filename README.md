# RSS Reader Made in Sinatra

This is a RSS Reader application or RSS feeds aggregator 

What is RSS?

RSS means Really Simple Syndication which allows users and applications to access updates to websites in a standardized, computer-readable format. These feeds can, for example, allow a user to keep track of many different websites in a single news aggregator. The news aggregator will automatically check the RSS feed for new content, allowing the content to be automatically passed from website to website or from website to user.

[Watch this video to understand how this app works!](https://youtu.be/GZ-u9Bk6_mE)

## Usage

This app is hosted on Heroku https://catchup-rss.herokuapp.com using heroku free plan.

**App might take time to load sometimes. The reason is that heroku puts apps which are on free plan to sleep after 30 minutes of inactivity. So when you visit the website, the app is waked from sleep which takes a little time!**

## Development

Try this app in your local environment, clone and run following command inside this project's directory

    $ bundle && bundle exec rake db:migrate

For interactive console

    $ bundle exec rake console

OR

    $ bundle exec tux

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aurangzaib-danial/sinatra-rss-reader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License

Everyone interacting in the SinatraRSSReader project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aurangzaib_danial/todo_lists/blob/master/CODE_OF_CONDUCT.md).