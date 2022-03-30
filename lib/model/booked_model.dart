import 'package:cloud_firestore/cloud_firestore.dart';

class BookedModel {
  String? docAutoID;
  String? authID;
  String? placesID;
  Timestamp? bookingTime;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  BookedModel(
      {this.docAutoID,
        this.authID,
        this.placesID,
        this.bookingTime,
        this.createdTime,
        this.updatedTime});

  BookedModel.fromJson(Map<String, dynamic> json) {
    docAutoID = json['docAutoID'];
    authID = json['authID'];
    placesID = json['placesID'];
    bookingTime = json['bookingTime'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['docAutoID'] = docAutoID;
    data['authID'] = authID;
    data['placesID'] = placesID;
    data['bookingTime'] = bookingTime;
    data['createdTime'] = createdTime;
    data['updatedTime'] = updatedTime;
    return data;
  }
}
