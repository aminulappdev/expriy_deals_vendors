import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:flutter/material.dart';

class CustomScaffoldBackground extends StatelessWidget {
  const CustomScaffoldBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsPath.background),fit: BoxFit.fill)
        ),
        child: child,
      ),
    ) ;
  }
}