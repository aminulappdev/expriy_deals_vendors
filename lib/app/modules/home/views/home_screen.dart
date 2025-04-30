import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Monthly Sales Chart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
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
                      position: graphic.Varset('month') * graphic.Varset('value'),
                      color: graphic.ColorEncode(
                        variable: 'type',
                        values: [
                          const Color(0xfffb5c00), // deep orange
                          const Color(0xffff7f24), // orange
                          const Color(0xffffb27f), // light orange
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


