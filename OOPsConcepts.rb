class Account
  attr_accessor :balance
  attr_reader :account_number, :owner_name

  def initialize(account_number, owner_name, balance = 0)
    @account_number = account_number
    @owner_name = owner_name
    @balance = balance
  end

  def deposit(amount)
    if amount > 0
      @balance += amount
      puts "Deposited #{amount}. New balance is #{@balance}."
    else
      puts "Invalid deposit amount."
    end
  end

  def withdraw(amount)
    if amount > 0 && amount <= @balance
      @balance -= amount
      puts "Withdrew #{amount}. New balance is #{@balance}."
    else
      puts "Insufficient balance or invalid withdrawal amount."
    end
  end

  def account_type
    raise NotImplementedError, 'You must implement the account_type method'
  end
end

class SavingsAccount < Account
  attr_reader :interest_rate

  def initialize(account_number, owner_name, balance = 0, interest_rate = 0.03)
    super(account_number, owner_name, balance)
    @interest_rate = interest_rate
  end

  def account_type
    "Savings Account"
  end

  def calculate_interest(period, custom_rate = @interest_rate)
    interest = @balance * custom_rate * period
    puts "Interest for #{period} years at #{custom_rate * 100}% rate is #{interest}."
    interest
  end
end

class CurrentAccount < Account
  attr_reader :overdraft_limit

  def initialize(account_number, owner_name, balance = 0, overdraft_limit = 500)
    super(account_number, owner_name, balance)
    @overdraft_limit = overdraft_limit
  end

  def account_type
    "Current Account"
  end

  def withdraw(amount)
    if amount > 0 && (amount <= @balance + @overdraft_limit)
      @balance -= amount
      puts "Withdrew #{amount}. New balance is #{@balance}."
    else
      puts "Insufficient balance or overdraft limit exceeded."
    end
  end
end

class Bank
  def initialize
    @accounts = []
  end

  def add_account(account)
    @accounts << account
    puts "Account added: #{account.owner_name} - #{account.account_type}"
  end

  def display_accounts
    @accounts.each do |account|
      puts "Account Number: #{account.account_number}, Owner: #{account.owner_name}, Type: #{account.account_type}, Balance: #{account.balance}"
    end
  end
end

bank = Bank.new

savings_account = SavingsAccount.new("001", "Sajid", 1000)
savings_account.deposit(500)
savings_account.calculate_interest(2)
savings_account.calculate_interest(2, 0.05)
savings_account.withdraw(700)

current_account = CurrentAccount.new("002", "Ali", 500)
current_account.deposit(300)
current_account.withdraw(1000)

bank.add_account(savings_account)
bank.add_account(current_account)

bank.display_accounts
