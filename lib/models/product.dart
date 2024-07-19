class Product {
  int id;
  int categoryId;
  String productName;
  String quantityPerUnit;
  double unitPrice;
  int unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrice, this.unitsInStock);

// Factory method to create Product instance from JSON map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json["id"] is int ? json["id"] : int.parse(json["id"].toString()),
      json["categoryId"] is int ? json["categoryId"] : int.parse(json["categoryId"].toString()),
      json['productName'] as String,
      json['quantityPerUnit'] as String,
      json["unitPrice"] is double ? json["unitPrice"] : double.parse(json["unitPrice"].toString()),
      json["unitsInStock"] is int ? json["unitsInStock"] : int.parse(json["unitsInStock"].toString()),
    );
  }

  // Method to convert Product object to JSON map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock,
    };
  }
}
