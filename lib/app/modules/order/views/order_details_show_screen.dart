
import 'package:expriy_deals_vendors/app/modules/order/controllers/order_details_screen.dart';
import 'package:expriy_deals_vendors/app/modules/order/model/order_details_model.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final OrderDetailsController orderDetailsController =
      Get.find<OrderDetailsController>();

  // DataGridSource to manage the data
  late OrderDataGridSource _dataGridSource;

  @override
  void initState() {
    super.initState();
    // Fetch order details when the screen initializes
    orderDetailsController.getCart();
    // Initialize the DataGridSource with empty data
    _dataGridSource = OrderDataGridSource(data: []);
    // Update DataGridSource reactively when data changes
    ever(orderDetailsController.orderDetailsModel, (data) {
      if (data != null && data.data != null) {
        _dataGridSource = OrderDataGridSource(data: data);
        _dataGridSource.buildDataGridRows();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => Column(
            children: [
              SizedBox(height: 40.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      child: Row(
                        children: [
                          widthBox8,
                          GestureDetector(
                            onTap: () {
                              // Implement search functionality if needed
                            },
                            child: Container(
                              height: 34.h,
                              width: 34.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.iconButtonThemeColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.search_rounded,
                                  size: 24.h,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          widthBox8,
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                // Implement search filtering if needed
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              heightBox12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Pending',
                        style: TextStyle(color: AppColors.iconButtonThemeColor),
                      ),
                      widthBox8,
                      CircleAvatar(
                        backgroundColor: AppColors.iconButtonThemeColor,
                        radius: 13,
                        child: const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor:
                            AppColors.iconButtonThemeColor.withOpacity(0.10),
                        child: const Icon(
                          Icons.visibility,
                          size: 16,
                        ),
                      ),
                      widthBox8,
                      CircleAvatar(
                        radius: 13,
                        backgroundColor:
                            AppColors.iconButtonThemeColor.withOpacity(0.10),
                        child: const Icon(
                          Icons.delete,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              heightBox12,
              // Display loading, error, or data
              orderDetailsController.inProgress
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : orderDetailsController.errorMessage != null
                      ? Expanded(
                          child: Center(
                            child: Text(
                              orderDetailsController.errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                      : orderDetailsController.addToCartData == null ||
                              orderDetailsController.addToCartData!.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text(
                                  'No order details available',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          : Expanded(
                              child: SfDataGrid(
                                source: _dataGridSource,
                                columns: [
                                  GridColumn(
                                    columnName: 'orderId',
                                    label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Order ID',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'customer',
                                    label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Customer',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'productName',
                                    label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Product Name',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'quantity',
                                    label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Quantity',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'status',
                                    label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Status',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'amount',
                                    label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Amount',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom DataGridSource for OrderDetailsItemModel
class OrderDataGridSource extends DataGridSource {
  List<OrderDetailsItemModel> data = [];

  OrderDataGridSource({required this.data});

  @override
  List<DataGridRow> get rows {
    return data.map<DataGridRow>((order) => DataGridRow(cells: [
          DataGridCell<String>(columnName: 'orderId', value: order.datumId ?? 'N/A'),
          DataGridCell<String>(columnName: 'customer', value: order.user?.name ?? 'N/A'),
          DataGridCell<String>(columnName: 'productName', value: order.product?.name ?? 'N/A'),
          DataGridCell<String>(columnName: 'quantity', value: order.quantity?.toString() ?? '0'),
          DataGridCell<String>(columnName: 'status', value: order.status ?? 'N/A'),
          DataGridCell<String>(columnName: 'amount', value: '\$${order.totalPrice?.toStringAsFixed(2) ?? '0.00'}'),
        ])).toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }

  void buildDataGridRows() {
    notifyListeners();
  }
}