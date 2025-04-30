import 'dart:math';
import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Data {
  Data({required this.stringValue, required this.intValue});
  final String stringValue;
  final int intValue;
}

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late DaviModel<Data> _model;

  @override
  void initState() {
    super.initState();
    final random = Random();
    final rows = List.generate(
      10,
      (i) => Data(
        stringValue: random.nextInt(0xFFFFFF).toRadixString(16).toUpperCase(),
        intValue: random.nextInt(100),
      ),
    );

    _model = DaviModel<Data>(
      rows: rows,
      columns: [
        DaviColumn(name: 'Color Code', cellValue: (p) => p.data.stringValue),
        DaviColumn(name: 'Value', cellValue: (p) => p.data.intValue),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
            SizedBox(height: 12.h),
            
            Expanded(child: Davi<Data>(_model)),
          ],
        ),
      ),
    );
  }
}
