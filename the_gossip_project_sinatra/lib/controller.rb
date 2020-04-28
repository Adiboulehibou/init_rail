require 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}  
  end

  get '/gossips/:id' do
    erb :show, locals: {gossip: Gossip.find(params['id'].to_i - 1)}  
  end

  get '/gossips/new/' do
    erb :new_gossip 
  end

  post '/gossips/new/' do
    #puts "#{params}"
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/edit' do
    erb :edit
  end

  post '/gossips/:id/edit' do
    
  end
end