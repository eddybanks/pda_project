class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
  end

  def edit
  end

  def delete
  end
end
