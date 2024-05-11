import 'package:flutter/material.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

class FloorFiguresRadioListTile extends StatelessWidget {
  final Widget protrusion;
  final dynamic value;
  final dynamic groupValue;
  final void Function() onTap;
  const FloorFiguresRadioListTile(
      {super.key,
      required this.protrusion,
      required this.value,
      required this.groupValue,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Theme.of(context).primaryColor.withOpacity(0.1),
      hoverColor: Theme.of(context).primaryColor.withOpacity(0.1),
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            value == groupValue
                ? Icon(
                    Icons.check_circle,
                    color: Theme.of(context).primaryColor,
                    size: 25.sp,
                  )
                : Icon(
                    Icons.circle_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 25.sp,
                  ),
            SizedBox(
              width: 5.w,
            ),
            protrusion,
          ],
        ),
      ),
    );
  }
}
