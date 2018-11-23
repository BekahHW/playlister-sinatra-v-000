require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do
    @songs = Song.create(params[:song])
    erb :'/songs/new'  
  end
  
  get '/songs/:slug' do
    @songs = Song.find_by_slug(params[:slug]) 
    erb :'/songs/show'
  end

  post '/songs' do
    # @songs = Song.create(params[:name])
     @songs = Song.create(:name => params['name'])
     @songs.artist = Artist.find_or_create_by(:name => params['artist name'])
     @songs.genre_ids = params[:genre]
     @songs.save
    
     flash[:message] = "Successfully created song."
     redirect("/songs/#{@songs.slug}")
  end
  
  get '/songs/:slug/edit' do
    @songs = Song.find_by_slug(params[:slug])
   erb :'/songs/edit'
  end
    
  patch '/songs/:slug' do
   @songs = Songs.find_by_slug(params[:slug])
   @songs.update(params[:song])
   @songs.name = params[:name]
   @songs.genre = params[:genre]
   @songs.artist = params[:artist]
   @songs.save
   
    flash[:message] = "Successfully created song."
  redirect to "/songs/#{@songs.slug}"

  end
end