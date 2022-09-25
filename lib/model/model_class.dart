class Public {
  int id;
  String email;
  String firstName;
  String lastName;
  String image;

  Public({
    required this.image,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.id,
  });
  factory Public.fromJson(Map<String, dynamic> json) {
    return Public(
      image: json["avatar"],
      email: json["email"],
      lastName: json["last_name"],
      firstName: json["first_name"],
      id: json["id"],
    );
  }
}
