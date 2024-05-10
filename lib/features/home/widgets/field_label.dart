import 'package:flutter/material.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

class FieldLabel extends StatelessWidget {
  final String label;
  const FieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold),
    );
  }
}
