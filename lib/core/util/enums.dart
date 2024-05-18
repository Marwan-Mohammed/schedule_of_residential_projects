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
