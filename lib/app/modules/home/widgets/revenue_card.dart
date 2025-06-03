import 'package:expriy_deals_vendors/app/modules/home/widgets/percentage_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RevenueCard extends StatelessWidget {
  final String selectedMonth;
  final ValueChanged<String?> onMonthChanged;
  final String revenue;
  final List<String> monthList;
  final Color dropdownColor;
  final Color highlightColor;
  final String name;

  const RevenueCard({
    super.key,
    required this.selectedMonth,
    required this.onMonthChanged,
    required this.revenue,
    required this.monthList,
    required this.dropdownColor,
    required this.highlightColor,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 126,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                  ),
                  Container(
                    height: 24.h,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: dropdownColor,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedMonth,
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_sharp,
                          size: 12,
                          color: Colors.white,
                        ),
                        dropdownColor: dropdownColor,
                        style: const TextStyle(color: Colors.white),
                        items: monthList
                            .map((month) => DropdownMenuItem(
                                  value: month,
                                  child: Text(
                                    month,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ))
                            .toList(),
                        onChanged: onMonthChanged,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                revenue,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ShowPercentageButton(highlightColor: highlightColor, val: '10'),
              const Text(
                'From the last month',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
