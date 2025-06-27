import 'package:flutter/material.dart';
import 'package:flutter_getx_task/core/constants/app_colors.dart';
import 'package:flutter_getx_task/core/constants/app_dimensions.dart';
import 'package:flutter_getx_task/core/constants/app_text_styles.dart';
import 'package:flutter_getx_task/data/models/order_model.dart';
import 'package:flutter_getx_task/modules/orders/views/orders-widgets/circle_icon.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.contentPadding / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order: ${order.status}", style: AppTextStyles.value),
              Text(order.date, style: AppTextStyles.value),
            ],
          ),
          Divider(
            color: AppColors.kSalmonColor,
          ),
          ListTile(
            leading: Image.network(
              order.imgUrl,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    order.title,
                    style: AppTextStyles.label,
                  ),
                ),
                Row(
                  children: [
                    CircleIcon(
                      icon: Icons.delete_forever_outlined,
                      bgColor: AppColors.kPrimaryColor,
                      color: AppColors.kSalmonColor,
                      borderColor: AppColors.kSalmonColor,
                      borderWidth: 2,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleIcon(
                      icon: Icons.add,
                      bgColor: AppColors.kSalmonColor,
                      color: AppColors.kPrimaryColor,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${order.quantity}x'),
                  Text('\$${order.price.toStringAsFixed(2)}'),
                  Text(
                    'Total: \$${order.total.toStringAsFixed(2)}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
