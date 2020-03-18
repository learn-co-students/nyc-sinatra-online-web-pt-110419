class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all.sort_by {|landmark| landmark.year_completed.to_i}
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all.sort_by(&:name)
    erb :'landmarks/new'
  end

  post '/landmarks' do

      @landmark = Landmark.create(params[:landmark])
        redirect "landmarks/#{@landmark.id}"
    end

end
