Hashtag Battle
================

This application allows users to create Hashtag Battle.  A battle takes two or more twitter hashtags as input and
 displays a counter for each hashtag.  Tweets with matching hashtags are pulled from twitter every 10 minutes and
 the counts are displayed to the user.


Ruby on Rails
-------------

This application requires:

- Ruby 2.1.2
- Rails 4.1.5

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Live Version of this App
-------------------------
The app is currently [Hosted on Heroku](http://hash-tag-battle.herokuapp.com/).

Deployment
-----------
The app can be deployed like a typical Heroku-hosted app, with a 'git push' to a heroku account.  You'll want to add
Heroku's scheduler so that the rake task update_counts can be scheduled to run every 10 minutes.

You'll need to set the following environment variables:

HEROKU_API_KEY -- for the workless gem
WORKLESS_MAX_WORKERS -- for the workless gem (I have it set to 1)
WORKLESS_MIN_WORKERS -- for the workless gem (I have it set to 0)
WORKLESS_WORKERS_RATIO -- for the workless gem (I have it set to 50)
TWITTER_CONSUMER_KEY -- twitter gem
TWITTER_CONSUMER_SECRET -- twitter gem
TWITTER_OAUTH_TOKEN -- twitter gem
TWITTER_OAUTH_TOKEN_SECRET -- twitter gem


If you're deploying to another hosting provider / server you should be able to follow that host's instructions for deploying a Rails app.

Basic Architecture
------------------
On the user-facing side this is a pretty typical Rails app.  Once a user creates a hashtag battle jobs are enqueued into 
delayed_job so that the tweets can be pulled from Twitter.  The workless gem keeps an eye on the delayed job queue and spins
up the appropriate number of background workers when there are jobs in the queue.  When there are no jobs in the queue
workless will kill the final worker, thereby saving on Heroku server costs.

The heroku scheduler (think of it as a cron job) schedules tweets to be pulled every 10 minutes)


