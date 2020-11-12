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
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
  end
 
end
