
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

class ShowPercentageButton extends StatelessWidget {
  const ShowPercentageButton({
    super.key,
    required this.highlightColor,
    required this.val,
  });

  final Color highlightColor;
  final String val;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: highlightColor.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.trending_up,
            size: 16,
            color: Colors.green,
          ),
          widthBox4,
          Text(
            val,
            style: const TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
