import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teamleance_technecal_test/model/booked_model.dart';
import 'package:teamleance_technecal_test/model/places_model.dart';

class HomeRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> callMyBookedData() async {
    QuerySnapshot querySnapshot = await firestore.collection("bookedData").where("authID", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    return querySnapshot;
  }

  Future<dynamic> submitMyBookedData(BookedModel bookedModel) async {
    // DocumentReference documentReference = firestore.collection("bookedData").doc(FirebaseAuth.instance.currentUser!.uid);
    //
    return await firestore.collection("bookedData").doc(bookedModel.docAutoID!).set(bookedModel.toJson());
  }

  Future<dynamic> removeMyBookedData(BookedModel bookedModel) async {
    firestore
        .collection("bookedData")
        .where("authID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("placesID", isEqualTo: bookedModel.placesID)
        .get().then((querySnapshot) async {
      // var autoID = "";
      for (var element in querySnapshot.docs) {
        // autoID = element['docAutoID'];


      return await firestore.collection("bookedData").doc(element['docAutoID']).delete();
    }


    });


  }

  Future<QuerySnapshot> callPlacesData() async {
    QuerySnapshot querySnapshot = await firestore.collection("places").get();
    return querySnapshot;
  }

  Future<dynamic> addPlacesData(PlacesModel placesModel) async {
    return await firestore.collection("places").doc(placesModel.docId).set(placesModel.toJson());
  }
}
