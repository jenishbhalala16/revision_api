class Public {
  String name;
  String Descriptions;

  Public({
    required this.name,
    required this.Descriptions,
  });
  factory Public.fromJson(Map<String, dynamic> json) {
    return Public(
      name: json["title"],
      Descriptions: json['description'],
    );
  }
}
