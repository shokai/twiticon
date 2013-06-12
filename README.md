Twit Icon
=========
Twitter Profile Icon with simple URL "http://twiticon.herokuapp.com/USER_NAME"

- http://twiticon.herokuapp.com
- https://github.com/shokai/twiticon


Install Dependencies
--------------------

    % gem install bundler
    % bundle install



Setup Twitter
-------------

### set CONSUMER_KEY and CONSUMER_SECRET

[Register Application](https://dev.twitter.com/apps/new) on Twitter and get CONSUMER_KEY and CONSUMER_SECRET.

    % export CONSUMER_KEY=1234asdfjiolkdfoi
    % export CONSUMER_SECRET=hogehugahujiko842934


### set ACCESS_TOKEN and ACCESS_SECRET

use following tool and ACCESS_TOKEN and ACCESS_SECRET.

    % ruby bin/get_twitter_oauth_keys.rb
    open http://api.twitter.com/oauth/authorize?oauth_token=foauefoaiwjaopwhwe9ur2reu
    input PIN Number: 29483

set

    % export ACCESS_TOKEN=9876abcdefghijk
    % export ACCESS_SECRET=6a5b4c3d2e1f


Run
---

    % memcached -vv -p 11211 -U 11211
    % foreman start

=> http://localhost:5000


Deploy
------

    % heroku create --stack cedar
    % heroku addons:add memcachier:dev
    % heroku config:set CONSUMER_KEY=1234asdfjiolkdfoi
    % heroku config:set CONSUMER_SECRET=hogehugahujiko842934
    % heroku config:set ACCESS_TOKEN=9876abcdefghijk
    % heroku config:set ACCESS_SECRET=6a5b4c3d2e1f
    % git push heroku master
    % heroku open
