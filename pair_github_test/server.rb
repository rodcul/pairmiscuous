require 'sinatra'
require 'rest-client'
require 'json'
require 'byebug'

CLIENT_ID = ENV['GITHUB_ID']
CLIENT_SECRET = ENV['GITHUB_SECRET']

use Rack::Session::Pool, :cookie_only => false

def authenticated?
  session[:access_token]
end

def authenticate!
  erb :index, :locals => {:client_id => CLIENT_ID}
end

get '/' do
  if !authenticated?
    authenticate!
  else
    access_token = session[:access_token]
    scopes = []

    begin
      auth_result = RestClient.get('https://api.github.com/user',
                                   {:params => {:access_token => access_token},
                                    :accept => :json})
    rescue => e
      # request didn't succeed because the token was revoked so we
      # invalidate the token stored in the session and render the
      # index page so that the user can start the OAuth flow again

      session[:access_token] = nil
      return authenticate!
    end

    # the request succeeded, so we check the list of current scopes
    if auth_result.headers.include? :x_oauth_scopes
      scopes = auth_result.headers[:x_oauth_scopes].split(', ')
    end

    auth_result = JSON.parse(auth_result)

    if scopes.include? 'user:email'
      auth_result['private_emails'] =
        JSON.parse(RestClient.get('https://api.github.com/user/emails',
                       {:params => {:access_token => access_token},
                        :accept => :json}))
    end

    erb :index, :locals => auth_result
  end
end

get '/callback' do
  # get temporary GitHub code...
  session_code = request.env['rack.request.query_hash']['code']

  # ... and POST it back to GitHub
  result = RestClient.post('https://github.com/login/oauth/access_token',
                          {:client_id => CLIENT_ID,
                           :client_secret => CLIENT_SECRET,
                           :code => session_code},
                           :accept => :json)

  # extract token and granted scopes
  access_token = JSON.parse(result)['access_token']
  scopes = JSON.parse(result)['scope'].split(',')

  # check if we were granted user:email scope
  has_user_email_scope = scopes.include? 'user:email'

  # fetch user information
  @auth_result = JSON.parse(RestClient.get('https://api.github.com/user',
                                          {:params => {:access_token => access_token},
                                           :accept => :json}))

  # if the user authorized it, fetch private emails
  if has_user_email_scope
    @auth_result['private_emails'] =
      JSON.parse(RestClient.get('https://api.github.com/user/emails',
                                {:params => {:access_token => access_token},
                                 :accept => :json}))
  end

  session[:access_token] = JSON.parse(result)['access_token']

  erb :index
end