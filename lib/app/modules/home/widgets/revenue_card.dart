
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RevenueCard extends StatelessWidget {
  final String selectedMonth;
  
  final String revenue;
  
  
  final Color highlightColor;
  final String name;

  const RevenueCard({
    super.key,
    required this.selectedMonth,
    
    required this.revenue,
    
    
    required this.highlightColor,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 90.h,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
              ),
              Text(
                revenue,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
