class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all.sort_by(&:name)
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do

      @figure = Figure.create(params[:figure])

      if !params[:title].empty?
        @title = Title.create(params[:title])
        @figure.titles << @title
      end

        if !params[:landmark].empty?
          @landmark = Landmark.create(params[:landmark])
          @figure.landmarks << @landmark
        end
        redirect "figures/#{@figure.id}"
    end

    get '/figures/:id' do

      @figure = Figure.find(params[:id])
      erb :'figures/show'
    end

    get '/figures/:slug/edit' do
      @figure = Figure.find(params[:id])
      erb :'figures/edit'
    end


end
