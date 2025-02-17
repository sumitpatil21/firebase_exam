class FireModal {
  double? amount;
  String?  category, date;
  int? income, id;

  FireModal(
      {required this.amount,
      required this.category,
      required this.date,
      required this.income,
      required this.id});

  factory FireModal.fromjson(Map m1) {
    return FireModal(
        amount: m1['amount'],
        category: m1['category'],
        date: m1['date'],
        income: m1['income'],
        id: m1['id']);
  }
}
