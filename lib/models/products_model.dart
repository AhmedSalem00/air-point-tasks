class ProductsModel {
  String? id;
  String? name;
  String? groups;
  String? barcode;
  String? price;

  ProductsModel({this.id, this.name, this.groups, this.barcode, this.price});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    groups = json['groups'];
    barcode = json['barcode'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['groups'] = this.groups;
    data['barcode'] = this.barcode;
    data['price'] = this.price;
    return data;
  }
}




