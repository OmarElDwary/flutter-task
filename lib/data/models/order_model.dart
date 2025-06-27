class OrderModel {
  final String title;
  final String imgUrl;
  final int quantity;
  final double price;
  final String date;
  final String status;

  OrderModel(
      {required this.title,
      required this.imgUrl,
      required this.quantity,
      required this.price,
      required this.date,
      required this.status});

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
        title: map['title'] ?? 'Unknown',
        imgUrl: map['imgUrl'] ?? '',
        quantity: (map['quantity'] as num).toInt(),
        price: (map['price'] as num).toDouble(),
        date: map['date'] ?? '',
        status: map['status'] ?? 'Pending');
  }
  double get total => quantity * price;
}
