class ArtistsController < ApplicationController
  
  get '/artists' do
    @artist = Artist.all
    erb :'/artists/index'
  end
  
 get '/artists/:slug' do
    @artists = Artist.find_by_slug(params[:artist]) 
    erb :'/artists/show'
  end
  
  post '/artists' do
    @artist = Artist.create(params[:artist])
    if !params['artist']['name'].empty?
        @artist.name = Artist.create(name: params['artist']['name'])
    end
    redirect "/artists/#{@artist.slug}"
  end
end
