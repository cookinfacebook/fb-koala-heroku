A facebook app template using sinatra and koala on the heroku cedar stack.

Usage:

<pre>
$ git clone
$ heroku create --stack cedar
$ git push heroku master
$ heroku config:add FACEBOOK_APP_ID=YOUR_APP_ID FACEBOOK_SECRET=YOUR_APP_SECRET
$ heroku open
</pre>