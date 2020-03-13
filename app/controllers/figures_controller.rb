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


end
