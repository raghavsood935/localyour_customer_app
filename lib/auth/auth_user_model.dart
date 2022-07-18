enum Roles {
  Admin,
  BusinessAdmin,
  BusinessUser,
  User,
}

class LocUser {

  // final int? id;
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? token;


  LocUser(this.id, this.name, this.phone, this.email, this.token);

  factory LocUser.fromJson(Map<String, dynamic> json){

    return LocUser(
      json['id']?.toString() ?? '',
      json['customer_name'] ?? '',
      json['customer_phone'] ?? '',
      json['customer_email'] ?? '',
      json['token'] ?? '',
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'customer_id' : id,
      'customer_name' : name,
      'email' : email,
      'phone' : phone
    };
  }
}