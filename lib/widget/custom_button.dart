import 'package:flutter/material.dart';
import 'package:teamleance_technecal_test/utils/app_utils.dart';
import 'package:teamleance_technecal_test/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  Function(String? value) callBack;
  String text;
  Color color;

  CustomButton({Key? key, required this.callBack,required this.text,this.color=Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: AppUtils.getW(context),
        height: 50,
        child: ElevatedButton(

            onPressed: () => callBack("pressed"),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FittedBox(
                child: Text(
                  text,
                  style: getButtonTextStyle(),
                ),
              ),
            ),

            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // side: BorderSide(color: Colors.red)
                    )
                )
            )

        ),
      ),
    );
  }
}
