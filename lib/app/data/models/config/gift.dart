class Gift {
  Gift({
    this.name,
    this.image,
  });

  final String? name;
  final String? image;

  Gift copyWith({
    String? name,
    String? image,
  }) =>
      Gift(name: name, image: image);

  factory Gift.fromJson(Map<String, dynamic> json) => Gift(
        name: json.containsKey('name') ? json["name"] : null,
        image: json.containsKey('image') ? json["image"] : null,
      );

  @override
  String toString() {
    return '''

    name: $name
    image: $image

''';
  }
}
