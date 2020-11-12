require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender, @receiver, @amount, @status = sender, receiver, amount, status
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && valid? && sender.balance > amount 
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
    else
      self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    receiver.balance -= amount
    sender.balance += amount
    self.status = "reversed"
    end
  end
 
end
