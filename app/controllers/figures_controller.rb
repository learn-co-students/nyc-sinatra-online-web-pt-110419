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

      if !params[:title][:name].empty?
        @title = Title.create(params[:title])
        @figure.titles << @title
      end

        if !params[:landmark][:name].empty?
          @landmark = Landmark.create(params[:landmark])
          @figure.landmarks << @landmark
        end
        redirect "figures/#{@figure.id}"
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'figures/show'
    end

    get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      @titles = Title.all
      @landmarks = Landmark.all
      erb :'figures/edit'
    end

    patch '/figures/:id' do
      
      @figure = Figure.find(params[:id])
      @figure.update(params[:figure])
      if !params[:title][:name].empty?
        @title = Title.create(params[:title])
        @figure.titles << @title
      end

        if !params[:landmark][:name].empty?
          @landmark = Landmark.create(params[:landmark])
          @figure.landmarks << @landmark
        end

      redirect "/figures/#{@figure.id}"
    end



end
