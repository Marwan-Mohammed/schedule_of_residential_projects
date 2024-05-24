import 'package:flutter/material.dart';

import 'util/enums.dart';

listenerOfCalucateBildingTotalAreas(TextEditingController targetCtrl,
    List<TextEditingController> checkedCtrls, int? floorNo) {
  if (floorNo == 1 && checkedCtrls[0].text.trim() != '') {
    targetCtrl.text = int.parse(checkedCtrls[0].text.trim()).toString();
  } else if (floorNo == 2 &&
      checkedCtrls[0].text.trim() != '' &&
      checkedCtrls[1].text.trim() != '') {
    targetCtrl.text = (int.parse(checkedCtrls[0].text.trim()) +
            int.parse(checkedCtrls[1].text.trim()))
        .toString();
  } else if (floorNo == 3 &&
      checkedCtrls[0].text.trim() != '' &&
      checkedCtrls[1].text.trim() != '' &&
      checkedCtrls[2].text.trim() != '') {
    targetCtrl.text = (int.parse(checkedCtrls[0].text.trim()) +
            int.parse(checkedCtrls[1].text.trim()) +
            int.parse(checkedCtrls[2].text.trim()))
        .toString();
  } else if (floorNo == 4 &&
      checkedCtrls[0].text.trim() != '' &&
      checkedCtrls[1].text.trim() != '' &&
      checkedCtrls[2].text.trim() != '' &&
      checkedCtrls[3].text.trim() != '') {
    targetCtrl.text = (int.parse(checkedCtrls[0].text.trim()) +
            int.parse(checkedCtrls[1].text.trim()) +
            int.parse(checkedCtrls[2].text.trim()) +
            int.parse(checkedCtrls[3].text.trim()))
        .toString();
  } else if (floorNo == 5 &&
      checkedCtrls[0].text.trim() != '' &&
      checkedCtrls[1].text.trim() != '' &&
      checkedCtrls[2].text.trim() != '' &&
      checkedCtrls[3].text.trim() != '' &&
      checkedCtrls[4].text.trim() != '') {
    targetCtrl.text = (int.parse(checkedCtrls[0].text.trim()) +
            int.parse(checkedCtrls[1].text.trim()) +
            int.parse(checkedCtrls[2].text.trim()) +
            int.parse(checkedCtrls[3].text.trim()) +
            int.parse(checkedCtrls[4].text.trim()))
        .toString();
  } else {
    targetCtrl.clear();
  }
}

Route createRoute(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      double dx = 1.0;
      var begin = Offset(dx, 0.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.easeInOut;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
