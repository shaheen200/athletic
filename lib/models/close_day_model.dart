// Main model for the entire map
class CloseDayModel {
  final List<Transaction> transactions;
  final double totalIncome;
  final double totalExpenses;
  final double netAmount;

  CloseDayModel({
    required this.transactions,
    required this.totalIncome,
    required this.totalExpenses,
    required this.netAmount,
  });

  // Factory to create CloseDayModel from a map
  factory CloseDayModel.fromMap(Map<String, dynamic> map) {
    return CloseDayModel(
      transactions: (map['Transactions'] as List<dynamic>)
          .map((transaction) => Transaction.fromMap(transaction))
          .toList(),
      totalIncome: map['TotalIncome'],
      totalExpenses: map['TotalExpenses'],
      netAmount: map['NetAmount'],
    );
  }

  // Method to convert CloseDayModel to a map
  Map<String, dynamic> toMap() {
    return {
      'Transactions':
          transactions.map((transaction) => transaction.toMap()).toList(),
      'TotalIncome': totalIncome,
      'TotalExpenses': totalExpenses,
      'NetAmount': netAmount,
    };
  }
}

// Nested model for each transaction
class Transaction {
  final int id;
  final String? userId;
  final String transactionType;
  final double amount;
  final String transactionDate;
  final String description;

  Transaction({
    required this.id,
    required this.userId,
    required this.transactionType,
    required this.amount,
    required this.transactionDate,
    required this.description,
  });

  // Factory to create Transaction from a map
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['Id'],
      userId: map['UserId'],
      transactionType: map['TransactionType'],
      amount: map['Amount'],
      transactionDate: map['TransactionDate'].toString().split('T')[0],
      description: map['Description'],
    );
  }

  // Method to convert Transaction to a map
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'UserId': userId,
      'TransactionType': transactionType,
      'Amount': amount,
      'TransactionDate': transactionDate,
      'Description': description,
    };
  }
}
