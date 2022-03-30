import 'package:flutter/material.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  Function(String? value) onSaved;
  Function(String? value) validator;
  final bool isPassword;
  final bool isEmail;
  bool showEyeIcon;
  bool showDropDownIcon;
  int maximumLine;
  bool isEditAble;
  IconData iconData;
  TextInputType typeText;

  // String initialValue;
  Function(String? value) callBackPasswordView;
  Function(String? value)? callOnChangedValue;
  TextEditingController? controller;

  MyTextFormField({
    Key? key,
    required this.hintText,
    required this.onSaved,
    required this.validator,
    this.controller,
    this.iconData = Icons.keyboard_arrow_down_sharp,
    this.isPassword = false,
    this.isEditAble = true,
    this.isEmail = false,
    this.showDropDownIcon = false,
    required this.callBackPasswordView,
    this.callOnChangedValue,
    this.showEyeIcon = false,
    this.typeText = TextInputType.text,
    this.maximumLine = 1,
    this.labelText = "",
    // this.initialValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEditAble,
      // initialValue: initialValue,
      // onChanged: (value) => callOnChangedValue!(value),
      maxLines: 1,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorConst.lightGreen!,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorConst.lightGreen!,
            width: 2.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorConst.lightGreen!,
            width: 2.0,
          ),
        ),
        labelText: labelText,
        suffixIcon: showEyeIcon
            ? IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  !isPassword ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () => callBackPasswordView("test"))
            : showDropDownIcon
                ? IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      iconData,
                      color: ColorConst.darkGreen,
                      size: 27,
                    ),
                    onPressed: () {},
                  )
                : const SizedBox(),
        hintText: hintText,
        contentPadding: const EdgeInsets.only(left: 15.0),
        filled: true,
        fillColor: ColorConst.whiteColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConst.greyColor,
          ),
        ),
      ),
      obscureText: isPassword ? true : false,
      validator: (value) => validator(value),
      onSaved: (value) => onSaved(value),
      keyboardType: isEmail ? TextInputType.emailAddress : typeText,
    );
  }
}
