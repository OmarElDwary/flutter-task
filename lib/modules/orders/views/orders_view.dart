import 'package:flutter/material.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_text_styles.dart';
import 'package:flutter_getx_task/modules/orders/controllers/orders_controller.dart';
import 'package:flutter_getx_task/modules/orders/views/orders-widgets/order_card.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrdersController());
    if (controller.orders.isEmpty) {
      controller.fetchOrders();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          "My Orders",
          style: AppTextStyles.title.copyWith(color: AppColors.kSalmonColor),
        ),
      ),
      body: Obx(
        () => controller.orders.isEmpty
            ? Center(child: Text("No Previous orders"))
            : CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final order = controller.orders[index];
                        return OrderCard(order: order);
                      },
                      childCount: controller.orders.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
