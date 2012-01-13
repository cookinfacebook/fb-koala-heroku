require "sinatra"
require "koala"

enable :sessions
# set :raise_errors, false
# set :show_exceptions, false

# Scope defines what permissions that we are asking the user to grant.
# In this example, we are asking for the ability to publish stories
# about using the app, access to what the user likes, and to be able
# to use their pictures.  You should rewrite this scope with whatever
# permissions your app needs.
# See https://developers.facebook.com/docs/reference/api/permissions/
# for a full list of permissions
FACEBOOK_SCOPE = 'user_likes,user_photos,user_photo_video_tags'

# unless ENV["FACEBOOK_APP_ID"] && ENV["FACEBOOK_SECRET"]
#   abort("missing env vars: please set FACEBOOK_APP_ID and FACEBOOK_SECRET with your app credentials")
# end

# before do
#   # HTTPS redirect
#   if settings.environment == :production && request.scheme != 'https'
#     redirect "https://#{request.env['HTTP_HOST']}"
#   end
# end

helpers do
  def oauth
    # @oauth ||= Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"])
    @oauth = Koala::Facebook::OAuth.new("205829302844514", "1ff71a44a070230b3e20dc6678659e90")
  end
end    


get '/' do
  @user = oauth.get_user_info_from_cookies(request.cookies)
  erb :index
end