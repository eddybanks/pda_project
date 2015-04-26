class ReviewsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if params[:search].nil?
      @reviews = Review.order(sort_column + " " + sort_direction).paginate(:per_page => 4, :page => params[:page])
    else
      conditions = {}
      conditions[:order] = :id if params[:order].present? && params[:order][:order] == "id"
      conditions[:order] = 'id desc' if params[:order].present? && params[:order][:order] == "id" && params[:asc][:asc] == "desc"
      conditions[:order] = :comment if params[:order].present? && params[:order][:order] == "comment"
      conditions[:order] = 'comment desc' if params[:order].present? && params[:order][:order] == "comment" && params[:asc][:asc] == "desc"
      conditions[:order] = :rating if params[:order].present? && params[:order][:order] == "rating"
      conditions[:order] = 'rating desc' if params[:order].present? && params[:order][:order] == "rating" && params[:asc][:asc] == "desc"
      conditions[:per_page] = 8
      conditions[:page] = params[:page]
      @reviews = Review.search(params[:search], conditions)
      @count = Review.search_count params[:search]
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
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
    @review = Review.find_by_id(params[:id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @review = Review.find_by_id(params[:id])
  end

  def destroy
    review = Review.find_by_id(params[:id]).destroy
    flash[:notice] = "The review with review number '#{review.id}' was deleted successfully!"
    redirect_to(:action => 'index')
  end

  private

    def review_params
      params.require(:review).permit(:id, :name, :comment, :rating, :visitor_id, :attraction_number)
    end

    def sort_column
      Review.column_names.include?(params[:sort]) ? params[:sort] : "Number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
