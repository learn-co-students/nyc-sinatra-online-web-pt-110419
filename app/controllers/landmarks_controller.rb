class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all.sort_by(&:name)
    erb :'landmarks/index'
  end

end
