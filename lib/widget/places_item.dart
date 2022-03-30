import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teamleance_technecal_test/model/places_model.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';
import 'package:teamleance_technecal_test/utils/text_style.dart';

class PlacesItem extends StatelessWidget {

  PlacesModel placesModel;


  PlacesItem(this.placesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10, top: 10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      width: 250,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                height: 170,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage.assetNetwork(
                    fadeOutCurve: Curves.bounceIn,
                    placeholder: "assets/images/default_image.png",
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/default_image.png",
                      );
                    },
                    fit: BoxFit.cover,
                    image: "${placesModel.placeImage}",
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: ColorConst.whiteColor,
                    ),
                  ))
            ],
          ),
          Text(
            "${placesModel.placeTitle}",
            style: getTextStyleNormalW5(),
          ),
          Text(
            "${placesModel.placeType}",
            style: getTextStyleNormal(fontSize: 0.016, color: Colors.black54),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.date_range_outlined,
                color: Colors.black54,
                size: 22,
              ),
              Text(
                // "${placesModel.dataFrom?.toDate()}",
                DateFormat('yyyy-MM-dd')
                    .format(DateTime.fromMicrosecondsSinceEpoch(placesModel.dataFrom!.microsecondsSinceEpoch)),
                style: getTextStyleNormal(fontSize: 0.016),
              ),
              const Spacer(),
              Text(
                "${placesModel.currency} ${placesModel.amount} ",
                style: getTextStyleNormal(fontSize: 0.016),
              ),
            ],
          )
        ],
      ),
    );
  }
}
