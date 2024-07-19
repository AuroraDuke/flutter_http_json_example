class Category {
  int id;
  String categoryName;
  String seoUrl;

// Constructor
  Category(this.id, this.categoryName, this.seoUrl);

// Factory method to create Category instance from JSON map
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      int.parse(json["id"]),
      json["categoryName"] as String,
      json["seoUrl"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "categoryName": categoryName, "seoUrl": seoUrl};
  }
}
