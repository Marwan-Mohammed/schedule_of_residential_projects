enum ProtrusionPosition {
  l('ل'),
  w('ع'),
  ll('ل ل'),
  ww('ع ع'),
  wl('ع ل'),
  llw('ل ل ع'),
  wwl('ع ع ل'),
  llww('ل ل ع ع');

  const ProtrusionPosition(this.name);
  final String name;
}

enum OptionsToDisplayResults {
  undergroundWorks(null, 'أعمال ماتحت الأرض'),
  groundFloor(1, 'الدور الأرضي'),
  firstFloor(2, 'الدور المتكرر الأول'),
  secondFloor(3, 'الدور المتكرر الثاني'),
  thirdFloor(4, 'الدور المتكرر الثالث'),
  fourthFloor(5, 'الدور المتكرر الرابع'),
  attachedFloor(null, 'الدور الملحق');

  const OptionsToDisplayResults(this.orderNo, this.name);
  final int? orderNo;
  final String name;
}
