class TicketsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if params[:search].nil?
      @tickets = Ticket.order(sort_column + " " + sort_direction).paginate(:per_page => 8, :page => params[:page])
    else
      conditions = {}
      conditions[:order] = :id if params[:order].present? && params[:order][:order] == "id"
      conditions[:order] = 'id desc' if params[:order].present? && params[:order][:order] == "id" && params[:asc][:asc] == "desc"
      conditions[:order] = :date if params[:order].present? && params[:order][:order] == "date"
      conditions[:order] = 'date desc' if params[:order].present? && params[:order][:order] == "date" && params[:asc][:asc] == "desc"
      conditions[:order] = :type if params[:order].present? && params[:order][:order] == "type"
      conditions[:order] = 'type desc' if params[:order].present? && params[:order][:order] == "type" && params[:asc][:asc] == "desc"
      conditions[:order] = :price if params[:order].present? && params[:order][:order] == "price"
      conditions[:order] = 'price desc' if params[:order].present? && params[:order][:order] == "price" && params[:asc][:asc] == "desc"
      conditions[:per_page] = 8
      conditions[:page] = params[:page]
      @tickets = Ticket.search(params[:search], conditions)
      @count = Ticket.search_count params[:search]
    end
  end

  def show
    @ticket = Ticket.find_by_id(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    # To replace date_select (i1,i2, ..) values to Date
    ticket = params[:ticket]
    date = Date.new ticket["date(1i)"].to_i, ticket["date(2i)"].to_i, ticket["date(3i)"].to_i
    @ticket.date = date

    if @ticket.save
      flash[:notice] = "Transaction created successfully!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @ticket = Ticket.find_by_id(params[:id])
  end

  def update

    @ticket = Ticket.find_by_id(params[:id])
    # params[:ticket][:attraction_numbers] ||= []

    # To replace date_select (i1,i2, ..) values to Date
    ticket = params[:ticket]
    date = Date.new ticket["date(1i)"].to_i, ticket["date(2i)"].to_i, ticket["date(3i)"].to_i
    ticket.delete("date(1i)")
    ticket.delete("date(2i)")
    ticket.delete("date(3i)")
    ticket[:date] = date

    if @ticket.update_attributes(ticket_params)
      flash[:notice] = "Transaction updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @ticket = Ticket.find_by_id(params[:id])
  end

  def destroy
    ticket = Ticket.find_by_id(params[:id]).destroy
    flash[:notice] = "The transaction '#{ticket.name}' was deleted successfully!"
    redirect_to(:action => 'index')
  end

  private

    def ticket_params
      params.require(:ticket).permit(:id, :date, :type, :price, :visitor_id)
      # params.require(:ticket).permit(:id, :date, :type, :price, :visitor_id, :attraction_numbers => [])
    end

    def sort_column
      Ticket.column_names.include?(params[:sort]) ? params[:sort] : "Number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
