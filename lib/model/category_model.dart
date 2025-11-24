class categories {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  categories({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryDescription,
    required this.strCategoryThumb,
  });

  String get id => idCategory;

  factory categories.fromJson(Map<String, dynamic> json) {
    return categories(
      idCategory: json['idCategory'] ?? '',
      strCategory: json['strCategory'] ?? '',
      strCategoryDescription: json['strCategoryDescription'] ?? '',
      strCategoryThumb: json['strCategoryThumb'] ?? '',
    );
  }

}
