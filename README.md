# Banking System in Ruby

This project is a simple banking system implemented in Ruby, demonstrating key Object-Oriented Programming (OOP) concepts such as Encapsulation, Inheritance, Polymorphism, Method Overriding, and Method Overloading-like behavior.

## Overview

The system consists of a base `Account` class and two derived classes: `SavingsAccount` and `CurrentAccount`. It supports common banking operations like depositing, withdrawing, and calculating interest, and manages different types of bank accounts.

## Features

- **Encapsulation**: Data is encapsulated within classes and accessed through methods.
- **Inheritance**: `SavingsAccount` and `CurrentAccount` inherit from the `Account` base class.
- **Polymorphism**: Method overriding is used for implementing account-specific behaviors.
- **Method Overriding**: The `withdraw` method is overridden in `CurrentAccount` to handle overdraft limits.
- **Method Overloading-like Behavior**: The `calculate_interest` method in `SavingsAccount` supports multiple parameters.

## Classes and Methods

### `Account` Class

- `initialize(account_number, owner_name, balance = 0)`: Initializes an account with a number, owner's name, and optional initial balance.
- `deposit(amount)`: Deposits a specified amount into the account.
- `withdraw(amount)`: Withdraws a specified amount from the account if sufficient balance exists.
- `account_type`: Abstract method to be implemented by derived classes.

### `SavingsAccount` Class

- Inherits from `Account`.
- `initialize(account_number, owner_name, balance = 0, interest_rate = 0.03)`: Initializes a savings account with an optional interest rate.
- `account_type`: Returns "Savings Account".
- `calculate_interest(period, custom_rate = @interest_rate)`: Calculates interest for a specified period and rate.

### `CurrentAccount` Class

- Inherits from `Account`.
- `initialize(account_number, owner_name, balance = 0, overdraft_limit = 500)`: Initializes a current account with an optional overdraft limit.
- `account_type`: Returns "Current Account".
- `withdraw(amount)`: Withdraws an amount considering the overdraft limit.

### `Bank` Class

- Manages multiple accounts.
- `add_account(account)`: Adds a new account to the bank.
- `display_accounts`: Displays details of all accounts.

## Usage

1. Clone the repository.
2. Ensure Ruby is installed on your system.
3. Run the Ruby script to see the banking operations in action.

```bash
ruby banking_system.rb
