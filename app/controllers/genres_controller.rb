class GenresController < ApplicationController
  
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end
  
  get '/genres/:slug' do
    @genres = Song.find_by_slug(params[:slug]) 
    erb :'/genres/show'
  end
  
  post '/genres' do
    @genres = Genre.create(:name => params['name']) 
    @genres.artist = Artist.find_or_create_by(:name => params['artist name'])
     @genres.song = Song.find_or_create_by(:name => params['name'])
     @genres.save
    end


  
    
   
end