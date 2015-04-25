class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all.paginate(:per_page => 8, :page => params[:page])
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

    params[:ticket][:attraction_numbers] ||= []

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
      params.require(:ticket).permit(:id, :date, :type, :price, :visitor_id, :attraction_numbers => [])
    end

end
