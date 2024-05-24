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
  undergroundWorks('أعمال ماتحت الأرض'),
  groundFloor('الدور الأرضي'),
  firstFloor('الدور المتكرر الأول'),
  secondFloor('الدور المتكرر الثاني'),
  thirdFloor('الدور المتكرر الثالث'),
  fourthFloor('الدور المتكرر الرابع'),
  attachedFloor('الدور الملحق');

  const OptionsToDisplayResults(this.name);
  final String name;
}
