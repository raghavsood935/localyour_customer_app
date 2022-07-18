class Location {
  final int? locationId;
  final String? locationName;

  Location({this.locationId, this.locationName});

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      locationId: json['location_id'],
      locationName: json['location_name'],
    );
  }
}

class SearchedLocation {
  final int? locationId;
  final String? locationName;

  SearchedLocation({this.locationId, this.locationName});

  factory SearchedLocation.fromJson(Map<String, dynamic> json){
    return SearchedLocation(
      locationId: json['location_id'],
      locationName: json['location_name'],
    );
  }
}

class MainServices{

   final int? serviceid;
   final String? servicename;
   final int? parentserviceid;
   final String? serviceslug;
   final int? servicelogoattachmentid;
   final int? serviceimageattachmentid;
   final int? servicebannerattachmentid;
   final String? servicelogourl;
   final String? serviceimageurl;
   final String? servicebannerimageurl;


   MainServices({
     this.serviceid,
     this.servicename,
     this.parentserviceid,
     this.serviceslug,
     this.servicelogoattachmentid,
     this.serviceimageattachmentid,
     this.servicebannerattachmentid,
     this.servicelogourl,
     this.serviceimageurl,
     this.servicebannerimageurl,
});

   factory MainServices.fromJson(Map<String, dynamic> json){
     return MainServices(
       serviceid: json['service_id'],
       servicename: json['service_name'],
       parentserviceid: json['parent_service_id'],
       serviceslug: json['service_slug'],
       servicelogoattachmentid: json['service_logo_attachment_id'],
       serviceimageattachmentid: json['service_image_attachment_id'],
       servicebannerattachmentid: json['service_banner_attachment_id'],
       servicelogourl: json['service_logo_url'],
       serviceimageurl: json['service_image_url'],
       servicebannerimageurl: json['service_banner_image_url'],
     );
   }

}

class ServiceDetailsModel{
  int? serviceId;
  String? serviceBannerUrl;
  String? serviceName;
  String? serviceMetaTitle;
  String? serviceMetaDescription;
  String? serviceDetails;
  String? serviceOverview;
  List<ServiceFaqModel>? serviceFaqModel;
  List<CategoryModel>? categoryModel;
  ServiceDetailsModel({
    this.serviceId,
    this.serviceBannerUrl,
    this.serviceName,
    this.serviceMetaTitle,
    this.serviceMetaDescription,
    this.serviceDetails,
    this.serviceOverview,
    this.serviceFaqModel,
    this.categoryModel,
});
  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json){
    return ServiceDetailsModel(
      serviceId: json['service_id'],
      serviceBannerUrl: json['service_banner_url'],
      serviceName: json['service_name'],
      serviceMetaTitle: json['service_meta_title'],
      serviceMetaDescription: json['service_meta_description'],
      serviceDetails: json['service_details'],
      serviceOverview: json['service_overview'],
      serviceFaqModel: json['service_faqs'] == null ? [] : List<ServiceFaqModel>.from((json['service_faqs'] as List<dynamic>).map((e) => ServiceFaqModel.fromJson(e))),
      categoryModel: json['category'] == null ? [] : List<CategoryModel>.from((json['category'] as List<dynamic>).map((e) => CategoryModel.fromJson(e))),
    );
  }
}

class ServiceFaqModel{
  int? serviceFaqId;
  int? serviceId;
  String? question;
  String? answer;
  String? createdAt;
  String? updatedAt;
  ServiceFaqModel({
    this.serviceFaqId,
    this.serviceId,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt
});
  factory ServiceFaqModel.fromJson(Map<String, dynamic> json){
    return ServiceFaqModel(
      serviceFaqId: json['service_faq_id'],
      serviceId: json['service_id'],
      question: json['question'],
      answer: json['answer'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class CategoryModel{
  int? serviceId;
  int? parentServiceId;
  String? serviceSlug;
  String? metaKey;
  String? metaDescription;
  String? unitName;
  String? note;
  String? smallDescription;
  dynamic serviceLogoAttachmentId;
  dynamic parentCategory;
  String? childCategory;
  dynamic price;
  dynamic discountPercentage;
  dynamic discountPrice;
  String? serviceLogoUrl;
  List<CategoryChildrenModel>? categoryChildrenModel;

  CategoryModel({
    this.serviceId,
    this.parentServiceId,
    this.serviceSlug,
    this.metaKey,
    this.metaDescription,
    this.unitName,
    this.note,
    this.smallDescription,
    this.serviceLogoAttachmentId,
    this.parentCategory,
    this.childCategory,
    this.price,
    this.discountPercentage,
    this.discountPrice,
    this.serviceLogoUrl,
    this.categoryChildrenModel,
});

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      serviceId: json['service_id'],
      parentServiceId: json['parent_service_id'],
      serviceSlug: json['service_slug'],
      metaKey: json['meta_key'],
      metaDescription: json['meta_description'],
      unitName: json['unit_name'],
      note: json['note'],
      smallDescription: json['small_description'],
      serviceLogoAttachmentId: json['service_logo_attachment_id'],
      parentCategory: json['parentcategory'],
      childCategory: json['childcatogory'],
      price: json['price'],
      discountPercentage: json['discount_percentage'],
      discountPrice: json['discount_price'],
      serviceLogoUrl: json['service_logo_url'],
      categoryChildrenModel: json['children'] == null ? [] : List<CategoryChildrenModel>.from((json['children'] as List<dynamic>).map((el) => CategoryChildrenModel.fromJson(el))),
    );
  }

}

class CategoryChildrenModel{
  int? serviceId;
  int? parentServiceId;
  String? serviceSlug;
  String? metaKey;
  String? metaDescription;
  String? unitName;
  String? note;
  String? smallDescription;
  dynamic serviceLogoAttachmentId;
  dynamic parentCategory;
  String? childCategory;
  dynamic price;
  dynamic discountPercentage;
  dynamic discountPrice;
  String? serviceLogoUrl;
  List<ChildOfChildrenModel>? childOfChildrenModel;
  CategoryChildrenModel({
    this.serviceId,
    this.parentServiceId,
    this.serviceSlug,
    this.metaKey,
    this.metaDescription,
    this.unitName,
    this.note,
    this.smallDescription,
    this.serviceLogoAttachmentId,
    this.parentCategory,
    this.childCategory,
    this.price,
    this.discountPercentage,
    this.discountPrice,
    this.serviceLogoUrl,
    this.childOfChildrenModel
});

  factory CategoryChildrenModel.fromJson(Map<String, dynamic> json){
    return CategoryChildrenModel(
      serviceId: json['service_id'],
      parentServiceId: json['parent_service_id'],
      serviceSlug: json['service_slug'],
      metaKey: json['meta_key'],
      metaDescription: json['meta_description'],
      unitName: json['unit_name'],
      note: json['note'],
      smallDescription: json['small_description'],
      serviceLogoAttachmentId: json['service_logo_attachment_id'],
      parentCategory: json['parentcategory'],
      childCategory: json['childcatogory'],
      price: json['price'],
      discountPercentage: json['discount_percentage'],
      discountPrice: json['discount_price'],
      serviceLogoUrl: json['service_logo_url'],
      childOfChildrenModel: json['children'] == null ? [] : List<ChildOfChildrenModel>.from((json['children'] as List<dynamic>).map((el) => ChildOfChildrenModel.fromJson(el))),
    );
  }
}

class ChildOfChildrenModel{
  int? serviceId;
  int? parentServiceId;
  String? serviceSlug;
  String? metaKey;
  String? metaDescription;
  String? unitName;
  String? note;
  String? smallDescription;
  dynamic serviceLogoAttachmentId;
  dynamic parentCategory;
  String? childCategory;
  dynamic price;
  dynamic discountPercentage;
  dynamic discountPrice;
  String? serviceLogoUrl;

  ChildOfChildrenModel({
    this.serviceId,
    this.parentServiceId,
    this.serviceSlug,
    this.metaKey,
    this.metaDescription,
    this.unitName,
    this.note,
    this.smallDescription,
    this.serviceLogoAttachmentId,
    this.parentCategory,
    this.childCategory,
    this.price,
    this.discountPercentage,
    this.discountPrice,
    this.serviceLogoUrl,
  });

  factory ChildOfChildrenModel.fromJson(Map<String, dynamic> json){
    return ChildOfChildrenModel(
      serviceId: json['service_id'],
      parentServiceId: json['parent_service_id'],
      serviceSlug: json['service_slug'],
      metaKey: json['meta_key'],
      metaDescription: json['meta_description'],
      unitName: json['unit_name'],
      note: json['note'],
      smallDescription: json['small_description'],
      serviceLogoAttachmentId: json['service_logo_attachment_id'],
      parentCategory: json['parentcategory'],
      childCategory: json['childcatogory'],
      price: json['price'],
      discountPercentage: json['discount_percentage'],
      discountPrice: json['discount_price'],
      serviceLogoUrl: json['service_logo_url'],
    );
  }
}

class CustomerProfile {
  ProfileInfo? profileInfo;
  List<Addresses>? addresses;

  CustomerProfile({this.profileInfo, this.addresses});

  factory CustomerProfile.fromJson(Map<String, dynamic> json) {

    return CustomerProfile(
      profileInfo: ProfileInfo.fromJson(json['profileinfo']),
      addresses: List<Addresses>.from((json['addresses'] as List<dynamic>).map((el) => Addresses.fromJson(json))),
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.profileInfo != null) {
  //     data['profileinfo'] = this.profileInfo.toJson();
  //   }
  //   if (this.addresses != null) {
  //     data['addresses'] = this.addresses.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProfileInfo {
  int? customerId;
  String? customerName;
  String? customerPhone;
  String? customerEmail;

  ProfileInfo({
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.customerEmail
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) {
    return ProfileInfo(
        customerId: json['customer_id'],
        customerName: json['customer_name'],
        customerPhone: json['customer_phone'],
        customerEmail: json['customer_email'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['customer_id'] = this.customerId;
  //   data['customer_name'] = this.customerName;
  //   data['customer_phone'] = this.customerPhone;
  //   data['customer_email'] = this.customerEmail;
  //   return data;
  // }
}

class Addresses {
  int? addressId;
  int? customerId;
  String? customerName;
  String? customerPhoneNumber;
  String? customerEmail;
  String? customerAddressLine1;
  String? customerAddressLine2;
  String? state;
  String? city;
  String? pincode;
  String? addressType;

  Addresses(
      {this.addressId,
        this.customerId,
        this.customerName,
        this.customerPhoneNumber,
        this.customerEmail,
        this.customerAddressLine1,
        this.customerAddressLine2,
        this.state,
        this.city,
        this.pincode,
        this.addressType});

 factory Addresses.fromJson(Map<String, dynamic> json) {
    return Addresses(
    addressId : json['address_id'],
    customerId : json['customer_id'],
    customerName : json['customer_name'],
    customerPhoneNumber : json['customer_phone_number'],
    customerEmail : json['customer_email'],
    customerAddressLine1 : json['customer_address_line1'],
    customerAddressLine2 : json['customer_address_line2'],
    state : json['state'],
    city : json['city'],
    pincode : json['pincode'],
    addressType : json['address_type'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['address_id'] = this.addressId;
  //   data['customer_id'] = this.customerId;
  //   data['customer_name'] = this.customerName;
  //   data['customer_phone_number'] = this.customerPhoneNumber;
  //   data['customer_email'] = this.customerEmail;
  //   data['customer_address_line1'] = this.customerAddressLine1;
  //   data['customer_address_line2'] = this.customerAddressLine2;
  //   data['state'] = this.state;
  //   data['city'] = this.city;
  //   data['pincode'] = this.pincode;
  //   data['address_type'] = this.addressType;
  //   return data;
  // }
}

class AddAddress {
  int? customerId;
  String? customerName;
  String? customerPhoneNumber;
  String? customerEmail;
  String? customerAddressLine1;
  String? customerAddressLine2;
  String? state;
  String? city;
  String? pincode;
  String? addressType;
  String? updatedAt;
  String? createdAt;

  AddAddress({
        this.customerId,
        this.customerName,
        this.customerPhoneNumber,
        this.customerEmail,
        this.customerAddressLine1,
        this.customerAddressLine2,
        this.state,
        this.city,
        this.pincode,
        this.addressType,
        });



  Map<String, dynamic> toJson()  {
   return {
     'customer_id': customerId,
     'customer_name' : customerName,
     'customer_phone_number' : customerPhoneNumber,
     'customer_email' : customerEmail,
     'customer_address_line1' : customerAddressLine1,
     'customer_address_line2' : customerAddressLine2,
     'state' : state,
     'city' : city,
     'pincode' : pincode,
     'address_type' : addressType,
   };
  }
}

class EditAddress {
  int? addressId;
  String? customerName;
  String? customerPhoneNumber;
  String? customerEmail;
  String? customerAddressLine1;
  String? customerAddressLine2;
  String? state;
  String? city;
  String? pincode;
  String? addressType;
  String? updatedAt;
  String? createdAt;

  EditAddress({
    this.addressId,
    this.customerName,
    this.customerPhoneNumber,
    this.customerEmail,
    this.customerAddressLine1,
    this.customerAddressLine2,
    this.state,
    this.city,
    this.pincode,
    this.addressType,
  });



  Map<String, dynamic> toJson()  {
    return {
      'address_id': addressId,
      'customer_name' : customerName,
      'customer_phone_number' : customerPhoneNumber,
      'customer_email' : customerEmail,
      'customer_address_line1' : customerAddressLine1,
      'customer_address_line2' : customerAddressLine2,
      'state' : state,
      'city' : city,
      'pincode' : pincode,
      'address_type' : addressType,
    };
  }
}

class CustomerId{
  int? customerID;
  CustomerId({this.customerID});
  Map<String, dynamic> toJson(){
    return {
      "customer_id" : customerID
    };
  }
}

class AddToCartModel{
  int? customerId;
  int? serviceId;
  int? locationId;
  AddToCartModel({this.customerId, this.serviceId, this.locationId});
  Map<String, dynamic> toJson(){
    return {
      "customer_id" : customerId,
      "service_id" : serviceId,
      "location_id" : locationId
    };
}
}

class CartItemsModel{
  int? totalPrice;
  int? totalQuantity;
  List<ItemsModel>? itemsModel;
  CartItemsModel({this.totalPrice, this.totalQuantity, this.itemsModel});
  factory CartItemsModel.fromJson(Map<String, dynamic> json){
    return CartItemsModel(
      totalPrice: json['total_price'],
      totalQuantity: json['total_quantity'],
      itemsModel: json['items'] == null ? [] : List<ItemsModel>.from((json['items'] as  List<dynamic>).map((e) =>ItemsModel.fromJson(e))) 
    );
  }
}

class ItemsModel{
  int? serviceID;
  dynamic serviceQuantity;
  String? serviceName;
  String? servicePrice;
  String? serviceUnit;
  ItemsModel({
    this.serviceID,
    this.serviceQuantity,
    this.serviceName,
    this.servicePrice,
    this.serviceUnit
  });
  factory ItemsModel.fromJson(Map<String, dynamic> json){
    return ItemsModel(
      serviceID: json['service_id'],
      serviceQuantity: json['service_quantity'],
      serviceName: json['service_name'],
      servicePrice: json['service_price'],
      serviceUnit: json['service_unit']
    );
  }
}

class DecreaseCartItemQuantityModel{
  int? customerId;
  int? serviceId;
  DecreaseCartItemQuantityModel({this.customerId, this.serviceId});
  Map<String, dynamic> toJson(){
    return {
      "customer_id" : customerId,
      "service_id" : serviceId,
    };
  }
}

class DeleteAddressModel{
  int? addressId;
  DeleteAddressModel({this.addressId});
  Map<String, dynamic> toJson(){
    return {
      "address_id" : addressId,
    };
  }
}

class OrdersModel{
  String? orderId;
  int? customerId;
  int? quantity;
  String? totalAmount;
  String? paymentType;
  String? paymentStatus;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  String? createdAt;
  List<OrderItemsModel>? orderItems;
  // OrderAddressModel? orderAddress;
  OrdersModel({
     this.orderId,
     this.customerId,
     this.quantity,
     this.totalAmount,
     this.paymentType,
     this.paymentStatus,
     this.customerName,
     this.customerEmail,
     this.customerPhone,
     this.createdAt,
     this.orderItems,
     // this.orderAddress,
});

  factory OrdersModel.fromJson(Map<String, dynamic> json){
    return OrdersModel
      (
      orderId: json['order_id'],
      customerId: json['customer_id'],
      quantity: json['total_quantity'],
      totalAmount: json['total_amount'],
      paymentType: json['payment_type'],
      paymentStatus: json['payment_status'],
      customerName: json['customer_name'],
      customerEmail: json['customer_email'],
      customerPhone: json['customer_phone'],
      createdAt: json['createdAt'],
      orderItems: json['order_items'] == null ? [] : List<OrderItemsModel>.from((json['order_items'] as  List<dynamic>).map((e) =>OrderItemsModel.fromJson(e))),
      // orderAddress: json['order_address'],
    );
  }

}

class OrderItemsModel{
  String? orderItemId;
  String? orderId;
  dynamic serviceId;
  String? serviceName;
  dynamic serviceQuantity;
  String? servicePrice;
  String? serviceDate;
  String? serviceStartTime;
  String? serviceEndTime;
  String? status;

  OrderItemsModel({
    this.orderItemId,
    this.orderId,
    this.serviceId,
    this.serviceName,
    this.serviceQuantity,
    this.servicePrice,
    this.serviceDate,
    this.serviceStartTime,
    this.serviceEndTime,
    this.status,
});

  factory OrderItemsModel.fromJson(Map<String, dynamic> json){
    return OrderItemsModel(
      orderItemId: json['order_item_id'],
      orderId: json['order_id'],
      serviceId: json['service_id'],
      serviceName: json['service_name'],
      serviceQuantity: json['service_quantity'],
      servicePrice: json['service_price'],
      serviceDate: json['service_date'],
      serviceStartTime: json['service_start_time'],
      serviceEndTime: json['service_end_time'],
      status: json['status'],
    );
  }
}

class OrderAddressModel{
  String? customerName;
  String? customerEmail;
  String? customerPhoneNumber;
  String? addressLine1;
  String?  addressLine2;
  String? city;
  String? state;
  String? zipCode;
  String? addressType;
  OrderAddressModel({
      this.customerName,
      this.customerEmail,
      this.customerPhoneNumber,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.state,
      this.zipCode,
      this.addressType
  });

  factory OrderAddressModel.fromJson(Map<String, dynamic> json){
    return OrderAddressModel(
      customerName: json['customer_name'],
      customerEmail: json['customer_email'],
      customerPhoneNumber: json['customer_phone_number'],
      addressLine1: json['customer_address_line1'],
      addressLine2: json['customer_address_line2'],
      city: json['city'],
      state: json['state'],
      zipCode: json['pincode'],
      addressType: json['address_type'],
    );
  }
}

class CreateOrderModel{
  int? customerId;
  int? customerAddressId;
  int? locationId;
  String? paymentType;
  List<CartsModel>? orderItem;
  CreateOrderModel({this.customerId, this.customerAddressId, this.locationId,this.paymentType,this.orderItem});
  Map<String, dynamic> toJson(){
    return {
      "customer_id" : customerId,
      "customer_address_id" : customerAddressId,
      "location_id" : locationId,
      'payment_type' : paymentType,
      'order_items' : orderItem,
    };
  }
}

class OrderItemModel{
  int? serviceId;
  String? serviceDate;
  String? serviceTimeSlot;
  OrderItemModel({this.serviceId, this.serviceDate, this.serviceTimeSlot});
  Map<String, dynamic> toJson(){
    return {
      'service_id' : serviceId,
      'service_date' : serviceDate,
      'service_time_slot' : serviceTimeSlot,
    };
  }
}


class CartsModel{
int? serviceId;
String? serviceDate;
String? serviceTimeSlot;

CartsModel({
  this.serviceId,
  this.serviceDate,
  this.serviceTimeSlot,
});

Map<String, dynamic> toJson(){
  return {
    'service_id' : serviceId,
    'service_date' : serviceDate,
    'service_time_slot' : serviceTimeSlot,
  };
}
}

class Items{
  int? serviceID;
  dynamic serviceQuantity;
  String? serviceName;
  String? servicePrice;
  String? serviceUnit;
  String? date;
  String? time;
  Items({
    this.serviceID,
    this.serviceQuantity,
    this.serviceName,
    this.servicePrice,
    this.serviceUnit,
    this.date,
    this.time
  });
  factory Items.fromJson(Map<String, dynamic> json){
    return Items(
        serviceID: json['service_id'],
        serviceQuantity: json['service_quantity'],
        serviceName: json['service_name'],
        servicePrice: json['service_price'],
        serviceUnit: json['service_unit'],
        date: json[''],
        time: json['']
    );
  }
}

class ShareModel{
  String? title;
  String? text;
  String? linkUrl;
  String? chooserTitle;
  ShareModel({
    this.text,
    this.title,
    this.chooserTitle,
    this.linkUrl
});

}

class UpdateProfile {

  // final int? id;
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? token;


  UpdateProfile({this.id, this.name, this.phone, this.email,this.token});

  factory UpdateProfile.fromJson(Map<String, dynamic> json){

    return UpdateProfile(
      // id: json['id'],
      name: json['customer_name'],
      email: json['customer_email'],
      phone: json['customer_phone'],
      token: json['token']
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