part of openapi.api;

class Order {

  int? id;

  int? petId;

  int? quantity;

  DateTime? shipDate;

  /* Order Status */
  String? status;

  //enum statusEnum {  placed,  approved,  delivered,  };{

  bool? complete = false;

  Order();

  @override
  String toString() {
    return 'Order[id=$id, petId=$petId, quantity=$quantity, shipDate=$shipDate, status=$status, complete=$complete, ]';
  }

  Order.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['petId'] == null) {
      petId = null;
    } else {
      petId = json['petId'];
    }
    if (json['quantity'] == null) {
      quantity = null;
    } else {
      quantity = json['quantity'];
    }
    if (json['shipDate'] == null) {
      shipDate = null;
    } else {
      shipDate = DateTime.parse(json['shipDate']);
    }
    if (json['status'] == null) {
      status = null;
    } else {
      status = json['status'];
    }
    if (json['complete'] == null) {
      complete = null;
    } else {
      complete = json['complete'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (petId != null)
      json['petId'] = petId;
    if (quantity != null)
      json['quantity'] = quantity;
    if (shipDate != null)
      json['shipDate'] = shipDate == null ? null : shipDate!.toIso8601String();
    if (status != null)
      json['status'] = status;
    if (complete != null)
      json['complete'] = complete;
    return json;
  }

  static List<Order> listFromJson(List<dynamic> json) {
    return json.map((value) => Order.fromJson(value)).toList();
  }

  static Map<String, Order> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Order>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Order.fromJson(value));
    }
    return map;
  }
}

