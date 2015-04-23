class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:notice] = "Review created successfully!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id]).destroy
    flash[:notice] = "The review with review number '#{review.id}' was deleted successfully!"
    redirect_to(:action => 'index')
  end

  private

    def review_params
      params.require(:review).permit(:id, :name, :size, :address)
    end

end
