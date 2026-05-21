// Exercise 2: Bank System

class BankAccount {
  String accName;
  int accNumber;
  double accBalance;

  BankAccount({
    required this.accName,
    required this.accBalance,
    required this.accNumber,
  });

  double balance() => accBalance;

  double withdraw(double amount) {
    if (accBalance - amount < 0) {
      throw Exception("Not enough money.");
    } else {
      accBalance -= amount;
      return accBalance;
    }
  }

  double credit(double amount) => accBalance += amount;
}

class Address {
  String street;
  String city;
  String zipCode;

  Address({required this.street, required this.city, required this.zipCode});
}

class Bank {
  String name;
  Address address;
  double intRate;
  int totalBranch;

  List<BankAccount> accounts = [];

  Bank({
    required this.name,
    required this.address,
    required this.intRate,
    required this.totalBranch,
  });

  BankAccount createAccount(int accNumber, String accName) {
    for (var account in accounts) {
      if (account.accNumber == accNumber) {
        throw Exception("The account number has already been used.");
      }
    }
    BankAccount newAccount = BankAccount(
      accName: accName,
      accBalance: 0.0,
      accNumber: accNumber,
    );

    accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Address bankAddress = Address(
    street: "206",
    city: "Phnom Penh",
    zipCode: "120408",
  );

  Bank myBank = Bank(
    name: "Canadia",
    address: bankAddress,
    intRate: 1.5,
    totalBranch: 10,
  );

  BankAccount user1 = BankAccount(
    accName: "Harry Potter",
    accBalance: 200,
    accNumber: 12345,
  );

  print(
    "${myBank.name} Bank is located at Street ${myBank.address.street}, ${myBank.address.city}, ${myBank.address.zipCode}, has a ${myBank.intRate}% Interest Rate, and have a total of ${myBank.totalBranch} branches.",
  );

  print("${user1.accName}, ${user1.accNumber} has: ${user1.balance()}");

  user1.credit(0);
  print(
    "${user1.accName}, ${user1.accNumber} updated after credits. Now has: ${user1.balance()}",
  );

  user1.withdraw(500);
  print(
    "${user1.accName}, ${user1.accNumber} updated after withdrawal. Now has: ${user1.balance()}",
  );
}
