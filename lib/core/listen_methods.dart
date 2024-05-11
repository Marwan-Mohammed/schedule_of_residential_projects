import 'package:flutter/material.dart';

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
