class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
  end

  def edit
  end

  def delete
  end
end