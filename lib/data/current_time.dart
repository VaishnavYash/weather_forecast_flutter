class CurrentTime {
  DateTime? realTime;

  CurrentTime({this.realTime});

  factory CurrentTime.fromJson(DateTime timeDate) {
    return CurrentTime(
      realTime: timeDate,
    );
  }
}
