class CategoryModel {
  String name;
  String image;

  /// Constructs a [CategoryModel] instance.
  CategoryModel({required this.name, required this.image});

  /// Constructs a [CategoryModel] instance from a JSON map.
  factory CategoryModel.fromJson(Map<String, dynamic>? map) {
    return CategoryModel(
      name: map!['name'],
      image: map['image'],
    );
  }

  /// Converts the [CategoryModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image};
  }
}
