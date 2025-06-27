import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_getx_task/data/models/order_model.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final orders = <OrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    final snap = await FirebaseFirestore.instance.collection('orders').get();
    orders.value =
        snap.docs.map((doc) => OrderModel.fromMap(doc.data())).toList();
  }
}
