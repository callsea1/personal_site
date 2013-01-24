require 'sinatra'
require 'sinatra/base'
# require 'data_mapper'
# require 'rack-flash'
# require 'sinatra/redirect_with_flash'
# require 'haml'
# require 'Date'
set :root, File.dirname(__FILE__)
set :haml, :format => :html5
# enable :sessions, :logging, :dump_errors
# use Rack::Flash, :sweep => true
SITE_TITLE = "Sean's Webapp"
SITE_DESCRIPTION = "'Cause working with Sean is pretty great."


# DataMapper::setup(:default, "sqlite://#{Dir.pwd}/seans_site.db")
# class Note
# 	include DataMapper::Resource
# 	property :id, Serial
# 	property :content, Text, :required => true
# 	property :complete, Boolean, :required => true, :default => false
# 	property :created_at, DateTime  
#     property :updated_at, DateTime  
# end
# class User
# 	include DataMapper::Resource
# 	property :id, Serial
# 	property :email, Text, :required => true
# 	property :name, Text, :required => true
# 	property :created_at, DateTime  
#     property :lastlogin_at, DateTime  
# end   
# DataMapper.finalize.auto_upgrade! #updates schema upon change
# helpers do
# 	include Rack::Utils
# 	alias_method :h, :escape_html
# end 

# set :prawn, { :page_layout => :landscape}


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


# post '/question' do
#   @feeling = params["feeling"]
#   haml :question
# end


# get '/notes' do
#   @notes = Note.all :order => :id.desc  
#   @title = 'All Notes'  
#   if @notes.empty?
#   	  flash[:error] = 'No notes found. Add your first below.'
#   end
#   erb :notes_home 
# end

# post '/notes' do
#   n = Note.new
#   n.content = params[:content]
#   n.created_at = Time.now
#   n.updated_at = Time.now
#   if n.save
#   	redirect '/notes', :notice => 'Note created successfully.'
#   else
#   	redirect '/notes', :error => 'Failed to save note.'
#   end
#  end

#  get '/notes_rss.xml' do
# 	@notes = Note.all :order => :id.desc
# 	builder :notes_rss
# end

# get '/notes/:id/delete' do
# 	@note = Note.get params[:id]
# 	@title = "Confirm deletion of note ##{params[:id]}"
# 	if @note  
#         erb :delete_note  
#     else  
#         redirect '/notes', :error => "Can't find that note."  
#     end 
# end

# get '/notes/:id' do
# 	@note = Note.get params[:id]
# 	@title = "Edit note ##{params[:id]}"
# 	if @note
# 		erb :edit_note
# 	else
# 		redirect '/notes', :error => "Can't find that note."
# 	end
# end

# put '/notes/:id' do
# 	n = Note.get params[:id]
# 	unless n
# 		redirect '/notes', :error => "Can't find that note."
# 	end
# 	n.content = params[:content]
# 	n.complete = params[:complete] ? 1 : 0
# 	n.updated_at = Time.now
# 	if n.save
# 		redirect '/notes', :notice => 'Note updated successfully.'
# 	else
# 		redirect '/notes', :error => 'Error updating note.'
# 	end
# end

# delete '/:id' do  
#   n = Note.get params[:id]  
#   if n.destroy  
#      redirect '/notes'  
#   else
#   	redirect '/notes', :error => 'Error deleting note.'
#   end
# end 


# get '/notes/:id/complete' do  
#   n = Note.get params[:id]
#   unless n
#   	redirect '/', :error => "Can't find that note."
#   end
#   n.complete = n.complete ? 0 : 1 # flip it  
#   n.updated_at = Time.now  
#   if n.save
#   	redirect '/', :notice => 'Note marked as complete.'
#   else
#     redirect '/', :error => 'Error marking note as complete.'
#   end 
# end 


# get '/haml' do
#   @weather = "snowy"
#   @temperature = 32
#   haml :new_index
# end



end

