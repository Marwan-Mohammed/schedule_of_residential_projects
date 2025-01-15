class FloorTerm {
  String name;
  double constant;
  double floorArea;
  int waitingPeriod;
  String workersNoMachine;
  FloorTerm(
      {required this.name,
      required this.constant,
      required this.floorArea,
      required this.waitingPeriod,
      required this.workersNoMachine});
  int netTimePeriod({double? soilConstant}) {
    if (name == 'الحفر') {
      if (constant == 0.02437) //strong soil
      {
        return ((1.0 * floorArea) / 145.8).round() == 0
            ? 1
            : ((1.0 * floorArea) / 145.8).round();
      } else if (constant == 0.01716) //medium soil
      {
        return ((1.50 * floorArea) / 405.0).round() == 0
            ? 1
            : ((1.50 * floorArea) / 405.0).round();
      }
    } else if (name == 'ردم إلى منسوب أسفل الميدة') {
      if (soilConstant == 0.02437) //strong soil
      {
        return ((1.0 * floorArea) / 200.0).round() == 0
            ? 1
            : ((1.0 * floorArea) / 200.0).round();
      } else if (soilConstant == 0.01716) //medium soil
      {
        return ((1.50 * floorArea) / 200.0).round() == 0
            ? 1
            : ((1.50 * floorArea) / 200.0).round();
      }
    } else if (name.startsWith('صب')) {
      return 1;
    }
    return (floorArea * constant).round() == 0
        ? 1
        : (floorArea * constant).round();
  }

  int timePeriodTotal({double? soilConstant}) {
    return netTimePeriod(soilConstant: soilConstant) + waitingPeriod;
  }
}
