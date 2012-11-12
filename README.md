Twit Icon
=========
- You can embed Twitter Profile Icon with simple URL "http://twiticon.herokuapp.com/USER_NAME"
- http://twiticon.herokuapp.com


Install Dependencies
--------------------

    % gem install heroku bundler foreman
    % bundle install


Run
---

    % cp sample.config.yml config.yml
    % memcached -vv -p 11211 -U 11211
    % foreman start

=> http://localhost:5000


Deploy
------

    % heroku create --stack cedar


add memcache

    % heroku addons:add memcache:5mb
or
    % heroku addons:add memcachier:dev


deploy

    % git push heroku master
    % heroku open


LICENSE
=======
(The MIT License)

Copyright (c) 2012 Sho Hashimoto

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.