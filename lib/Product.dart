class Product {
  final String id,
      productname,
      productCode,
      image,
      unitPrice,

      totalPrice,
      createAt,
      quantity;


  Product(this.id, this.productname, this.productCode, this.image,
      this.unitPrice, this.totalPrice, this.createAt, this.quantity);

  factory Product.toJson(Map<String, dynamic> e){
    return Product(
      e['_id'],
      e['ProductName'],
      e['ProductCode'],
      e['Img'],
      e['UnitPrice'],

      e['TotalPrice'],
      e['CreatedDate'],
      e['Qty'],);
  }
}
