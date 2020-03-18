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

    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
    end

    get '/landmarks/:id/edit' do

      @landmark = Landmark.find(params[:id])
      @figures =Figure.all.sort_by(&:name)
      erb :'landmarks/edit'
    end

    patch '/landmarks/:id' do

      @landmark = Landmark.find(params[:id])
      @landmark.update(params[:landmark])
      #if !params[:title][:name].empty?
      #  @title = Title.create(params[:title])
      #  @landmark.titles << @title
      #end

      #  if !params[:landmark][:name].empty?
      #    @landmark = Landmark.create(params[:landmark])
      #    @landmark.landmarks << @landmark
      #  end

      redirect "/landmarks/#{@landmark.id}"
    end


end
