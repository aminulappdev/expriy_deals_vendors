import 'package:flutter/material.dart';

class AgreeConditionCheck extends StatefulWidget {
  const AgreeConditionCheck({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;

  @override
  State<AgreeConditionCheck> createState() => _AgreeConditionCheckState();
}

class _AgreeConditionCheckState extends State<AgreeConditionCheck> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
            widget.onChanged(isChecked); // notify parent
          },
        ),
        Flexible(
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Terms & Conditions ',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
