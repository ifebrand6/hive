class TransactionsController < ApplicationController
  layout 'admin'

  def index
    if current_user.admin_role == true
       @transactions = Transaction.all
       @talent_assignment = TalentAssignment.with_deleted
    elsif current_user.customer_role == true
      @transactions = current_user.transactions
      @talent_assignment = TalentAssignment.with_deleted
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @talent_assignment = TalentAssignment.find(params[:id])
    @transaction = Transaction.new(transaction_params)
    if @transaction.save!
      @talent_assignment.destroy
      redirect_to thank_you_path
      flash[:notice] = 'Payment Successful'
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
    @talent_assignment = TalentAssignment.with_deleted.find_by(finalized_request_id: @transaction.finalized_request_id)
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
