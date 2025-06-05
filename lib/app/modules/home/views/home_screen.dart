// ignore_for_file: deprecated_member_use

import 'package:expriy_deals_vendors/app/modules/earnings/controllers/earning_dashboard_controller.dart';
import 'package:expriy_deals_vendors/app/modules/home/widgets/revenue_card.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graphic/graphic.dart' as graphic;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final EarningDashboardController earningDashboardController =
      Get.put(EarningDashboardController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    profileController.getProfileData();
    earningDashboardController.getEarningDashboard(selectedYear);
    super.initState();
  }

  // Dynamic chart data from controller
  List<Map<String, dynamic>> getChartData() {
    final monthlyIncome =
        earningDashboardController.earningDashboardData?.monthlyIncome ?? [];
    return monthlyIncome
        .map((income) => {
              'month': income.month ?? '',
              'value': income.income ?? 0,
              'type': 'Income', // Single type for all income data
            })
        .toList();
  }

  final List<String> years = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
    '2032',
    '2033',
    '2034',
    '2035',
  ];

  String selectedYear = '2025';

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(
                child: Obx(() {
                  return controller.inProgress
                      ? const CircularProgressIndicator()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundImage:
                                  controller.profileData?.profile != null
                                      ? NetworkImage(
                                          controller.profileData!.profile!)
                                      : const AssetImage(AssetsPath.appleLogo),
                            ),
                            // Container(
                            //   height: 42,
                            //   width: 42,
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     color: const Color(0xffFB6000).withOpacity(0.10),
                            //   ),
                            //   child: const Icon(Icons.notifications),
                            // )
                          ],
                        );
                }),
              ),
              // GetBuilder<ProfileController>(builder: (controller) {
              //   return Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       // Container(
              //       //   height: 42,
              //       //   width: 42,
              //       //   decoration: BoxDecoration(
              //       //     shape: BoxShape.circle,
              //       //     color: const Color(0xffFB6000).withOpacity(0.10),
              //       //   ),
              //       //   child: const Icon(Icons.notifications),
              //       // )
              //     ],
              //   );
              // }),
              heightBox12,
              GetBuilder<EarningDashboardController>(builder: (controller) {
                if (controller.inProgress) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.earningDashboardModel.value == null) {
                  return const Center(child: Text('No data available'));
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RevenueCard(
                        name: 'Total Revenue',
                        selectedMonth: selectedYear,
                        revenue: controller.earningDashboardData?.totalIncome
                                .toString() ??
                            '\$0',
                        highlightColor: Colors.green,
                      ),
                      RevenueCard(
                        name: 'Total Products',
                        selectedMonth: selectedYear,
                        revenue: controller.earningDashboardData?.totalProducts
                                .toString() ??
                            '\$0',
                        highlightColor: Colors.green,
                      ),
                    ],
                  );
                }
              }),
              heightBox12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Earning Summary',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Container(
                    height: 30.h,
                    width: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.iconButtonThemeColor,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedYear,
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_sharp,
                          size: 24,
                          color: Colors.white,
                        ),
                        dropdownColor: AppColors.iconButtonThemeColor,
                        style: const TextStyle(color: Colors.white),
                        items: years
                            .map((year) => DropdownMenuItem(
                                  value: year,
                                  child: Text(year),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              selectedYear = val;
                              earningDashboardController
                                  .getEarningDashboard(selectedYear);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              heightBox20,
              SizedBox(
                height: 250,
                child: GetBuilder<EarningDashboardController>(
                    builder: (controller) {
                  final chartData = getChartData();
                  if (chartData.isEmpty) {
                    return const Center(
                        child: Text('No earning data available'));
                  }
                  return graphic.Chart(
                    data: chartData,
                    variables: {
                      'month': graphic.Variable(
                        accessor: (Map map) => map['month'] as String,
                      ),
                      'value': graphic.Variable(
                        accessor: (Map map) => map['value'] as num,
                      ),
                    },
                    marks: [
                      graphic.IntervalMark(
                        position:
                            graphic.Varset('month') * graphic.Varset('value'),
                        color: graphic.ColorEncode(
                          value: const Color(
                              0xfffb5c00), // Single color for all bars
                        ),
                        modifiers: [graphic.StackModifier()],
                      ),
                    ],
                    axes: [
                      graphic.Defaults.horizontalAxis,
                      graphic.Defaults.verticalAxis,
                    ],
                    coord: graphic.RectCoord(transposed: false),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
