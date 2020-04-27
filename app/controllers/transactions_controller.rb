class TransactionsController < ApplicationController
  
  def index
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save!
      redirect_to thank_you_path
      #TODO SEND MAIL TO CUSTOMER
      flash[:notice] = 'Payment Successful'
    end
  end

  def show
  end

  def verify_transaction
    paystackObj =  Paystack.new
    transaction_reference = params[:id]
    transactions = PaystackTransactions.new(paystackObj)
    result = transactions.verify(transaction_reference)
    if result["data"].present? && result["data"]["status"].present? && result["data"]["status"] == "success"
      puts "Transaction successful"
      redirect_to thank_you_path
    else
      render :create, notice: "Transaction was not successful"
      return
    end    
  end

  private
    def transaction_params
      params.require(:transaction).permit(:user_id,:finalized_request_id,:amount)
    
    end
end
