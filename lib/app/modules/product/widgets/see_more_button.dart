
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    super.key,
    required bool isExpanded,
  }) : _isExpandedProduct = isExpanded;

  final bool _isExpandedProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 84, 92, 118),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _isExpandedProduct
              ? Icon(
                  Icons.arrow_upward_rounded,
                  size: 18.h,
                )
              : Icon(
                  Icons.arrow_downward_rounded,
                  size: 18.h,
                ),
          widthBox4,
          _isExpandedProduct
              ? Text('See less..')
              : Text('See more..')
        ],
      ),
    );
  }
}
