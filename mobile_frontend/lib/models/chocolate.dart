class Chocolate {
  final String chocolateType;
  final String productionDate;
  final int volume;

  Chocolate({
    required this.chocolateType,
    required this.productionDate,
    required this.volume,
  });

  factory Chocolate.fromJson(Map<String, dynamic> json) {
    return Chocolate(
      chocolateType: json['chocolate_type'],
      productionDate: json['production_date'],
      volume: int.parse(json['volume']),
    );
  }
}
