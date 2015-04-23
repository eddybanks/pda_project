class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
  end

  def edit
  end

  def delete
  end
end
