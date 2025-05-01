import 'package:expriy_deals_vendors/app/modules/home/widgets/percentage_button.dart';
import 'package:expriy_deals_vendors/app/modules/home/widgets/revenue_card.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphic/graphic.dart' as graphic;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> chartData = [
    {'month': 'Jan', 'value': 4000, 'type': 'A'},
    {'month': 'Jan', 'value': 3000, 'type': 'B'},
    {'month': 'Jan', 'value': 3000, 'type': 'C'},
    {'month': 'Feb', 'value': 5000, 'type': 'A'},
    {'month': 'Feb', 'value': 4000, 'type': 'B'},
    {'month': 'Feb', 'value': 3000, 'type': 'C'},
    {'month': 'Mar', 'value': 3000, 'type': 'A'},
    {'month': 'Mar', 'value': 4000, 'type': 'B'},
    {'month': 'Mar', 'value': 3000, 'type': 'C'},
    {'month': 'Apr', 'value': 2000, 'type': 'A'},
    {'month': 'Apr', 'value': 4000, 'type': 'B'},
    {'month': 'Apr', 'value': 3000, 'type': 'C'},
    {'month': 'May', 'value': 3000, 'type': 'A'},
    {'month': 'May', 'value': 4000, 'type': 'B'},
    {'month': 'May', 'value': 3000, 'type': 'C'},
    {'month': 'Jun', 'value': 3500, 'type': 'A'},
    {'month': 'Jun', 'value': 4000, 'type': 'B'},
    {'month': 'Jun', 'value': 3000, 'type': 'C'},
    {'month': 'Jul', 'value': 4000, 'type': 'A'},
    {'month': 'Jul', 'value': 5000, 'type': 'B'},
    {'month': 'Jul', 'value': 3000, 'type': 'C'},
    {'month': 'Aug', 'value': 3500, 'type': 'A'},
    {'month': 'Aug', 'value': 4000, 'type': 'B'},
    {'month': 'Aug', 'value': 3000, 'type': 'C'},
    {'month': 'Sep', 'value': 3200, 'type': 'A'},
    {'month': 'Sep', 'value': 4200, 'type': 'B'},
    {'month': 'Sep', 'value': 3100, 'type': 'C'},
    {'month': 'Oct', 'value': 3300, 'type': 'A'},
    {'month': 'Oct', 'value': 4100, 'type': 'B'},
    {'month': 'Oct', 'value': 3100, 'type': 'C'},
    {'month': 'Nov', 'value': 3200, 'type': 'A'},
    {'month': 'Nov', 'value': 4200, 'type': 'B'},
    {'month': 'Nov', 'value': 3100, 'type': 'C'},
    {'month': 'Dec', 'value': 3300, 'type': 'A'},
    {'month': 'Dec', 'value': 4100, 'type': 'B'},
    {'month': 'Dec', 'value': 3100, 'type': 'C'},
  ];

  final List<String> months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  final List<String> years = [
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2020',
    '2025'
  ];

  String selectedMonth = 'Jan';
  String selectedYar = '2025';

  final Map<String, String> monthlyRevenue = {
    'Jan': '\$18,562',
    'Feb': '\$17,200',
    'Mar': '\$19,000',
    'Apr': '\$15,300',
    'May': '\$20,450',
    'Jun': '\$21,300',
    'Jul': '\$22,000',
    'Aug': '\$20,100',
    'Sep': '\$19,700',
    'Oct': '\$18,900',
    'Nov': '\$20,350',
    'Dec': '\$21,000',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage(AssetsPath.headphone),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffFB6000).withOpacity(0.10),
                    ),
                    child: const Icon(Icons.notifications),
                  )
                ],
              ),
              heightBox12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RevenueCard(
                    selectedMonth: selectedMonth,
                    onMonthChanged: (val) {
                      if (val != null) {
                        setState(() {
                          selectedMonth = val;
                        });
                      }
                    },
                    revenue: monthlyRevenue[selectedMonth] ?? '\$0',
                    monthList: months,
                    dropdownColor: AppColors.iconButtonThemeColor,
                    highlightColor: Colors.green,
                  ),
                   RevenueCard(
                    selectedMonth: selectedMonth,
                    onMonthChanged: (val) {
                      if (val != null) {
                        setState(() {
                          selectedMonth = val;
                        });
                      }
                    },
                    revenue: monthlyRevenue[selectedMonth] ?? '\$0',
                    monthList: months,
                    dropdownColor: AppColors.iconButtonThemeColor,
                    highlightColor: Colors.green,
                  ),
                ],
              ),
              heightBox12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Earning Summery',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),
                  
                  ),
                  Column(
                    children: [
                      Text('Yearly Revenue'),
                      heightBox4,
                      ShowPercentageButton(highlightColor: Colors.green.shade100, val: '10'),
                    ],
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
                        value: selectedYar,
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
                        onChanged:  (val) {
                      if (val != null) {
                        setState(() {
                          selectedYar = val;
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
                child: graphic.Chart(
                  data: chartData,
                  variables: {
                    'month': graphic.Variable(
                      accessor: (Map map) => map['month'] as String,
                    ),
                    'value': graphic.Variable(
                      accessor: (Map map) => map['value'] as num,
                    ),
                    'type': graphic.Variable(
                      accessor: (Map map) => map['type'] as String,
                    ),
                  },
                  marks: [
                    graphic.IntervalMark(
                      position:
                          graphic.Varset('month') * graphic.Varset('value'),
                      color: graphic.ColorEncode(
                        variable: 'type',
                        values: [
                          const Color(0xfffb5c00),
                          const Color(0xffff7f24),
                          const Color(0xffffb27f),
                        ],
                      ),
                      modifiers: [graphic.StackModifier()],
                    ),
                  ],
                  axes: [
                    graphic.Defaults.horizontalAxis,
                    graphic.Defaults.verticalAxis,
                  ],
                  coord: graphic.RectCoord(transposed: false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
