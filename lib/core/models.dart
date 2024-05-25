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
  int netTimePeriod() {
    return (floorArea * constant).ceil();
  }

  int timePeriodTotal() {
    return netTimePeriod() + waitingPeriod;
  }
}
