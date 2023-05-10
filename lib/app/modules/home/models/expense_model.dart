class ExpenseModel {
  final String description;
  final double value;

  ExpenseModel({
    required this.description,
    required this.value
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'value': value
    };
  }

  ExpenseModel toModel(Map<String, dynamic> map) {
    return ExpenseModel(
      description: map['description'], 
      value: map['value']
    );
  }
} 