import 'package:cloud_firestore/cloud_firestore.dart';

class PlacesModel {
  int? amount;
  String? currency;
  Timestamp? dataFrom;
  Timestamp? dateTo;
  int? days;
  String? docId;
  String? placeDetails;
  String? placeImage;
  String? placeTitle;
  String? placeType;
  bool? isBooked;

  PlacesModel(
      {this.amount,
        this.currency,
        this.dataFrom,
        this.dateTo,
        this.days,
        this.docId,
        this.placeDetails,
        this.placeImage,
        this.placeTitle,
        this.placeType,
        this.isBooked});

  PlacesModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    dataFrom = json['dataFrom'];
    dateTo = json['dateTo'];
    days = json['days'];
    docId = json['docId'];
    placeDetails = json['placeDetails'];
    placeImage = json['placeImage'];
    placeTitle = json['placeTitle'];
    placeType = json['placeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    data['dataFrom'] = dataFrom;
    data['dateTo'] = dateTo;
    data['days'] = days;
    data['docId'] = docId;
    data['placeDetails'] = placeDetails;
    data['placeImage'] = placeImage;
    data['placeTitle'] = placeTitle;
    data['placeType'] = placeType;
    return data;
  }
}
