class Forecast {
  final String date;
  final String weekday;
  final int max;
  final int min;
  final String description;

  Forecast({
    required this.date,
    required this.weekday,
    required this.max,
    required this.min,
    required this.description,
  });

  factory Forecast.defaultValues() {
    return Forecast(
      date: "01/01",
      weekday: "Unknown",
      max: 0,
      min: 0,
      description: "No data",
    );
  }

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: json['date'],
      weekday: json['weekday'],
      max: json['max'],
      min: json['min'],
      description: json['description'],
    );
  }
}
