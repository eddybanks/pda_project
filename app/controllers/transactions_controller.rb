class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      flash[:notice] = "Transaction created successfully!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @transaction = Transaction.find_by_id(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update_attributes(transaction_params)
      flash[:notice] = "Transaction updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    transaction = Transaction.find(params[:id]).destroy
    flash[:notice] = "The transaction '#{transaction.name}' was deleted successfully!"
    redirect_to(:action => 'index')
  end

  private

    def transaction_params
      params.require(:transaction).permit(:id, :date, :type, :price, :visitor_id)
    end

end
