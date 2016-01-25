require 'sinatra'
require 'sinatra/base'
set :root, File.dirname(__FILE__)
set :haml, :format => :html5
SITE_TITLE = "Sean Callahan | Polyglot Pragmatist"
SITE_DESCRIPTION = "UX, UI and Code"


get '/' do

erb :home

end

get '/projects' do

erb :projects

end

get '/resume' do

erb :resume

end

not_found do
  status 404
  'Sorry, but the web page was not found.'

end
