
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolicyCustomRow extends StatelessWidget {
  final String name;
  final String routeName;
  const PolicyCustomRow({
    super.key, required this.name, required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, routeName);
                  },
                  child: Icon(Icons.arrow_forward_ios_rounded),
                )
              ],
            ),
            heightBox4,
            Container(
              color: Colors.grey,
              height: 1,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
