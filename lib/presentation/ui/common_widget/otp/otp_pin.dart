import 'dart:developer';

import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



typedef OnCodeEnteredCompletion = void Function(String value);
typedef OnCodeChanged = void Function(String value);

class OtpPinView extends StatefulWidget {
  final OnCodeEnteredCompletion onSubmit;
  final OnCodeEnteredCompletion onCodeChanged;
  bool? clearText;


  OtpPinView({super.key,
    clearText = false,
    required this.onSubmit,
    required this.onCodeChanged,
  }) ;

  @override
  State<OtpPinView> createState() => _OtpPinViewState();
}

class _OtpPinViewState extends State<OtpPinView> {
  late List<String?> _verificationCode;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  @override
  void initState() {
    super.initState();

    _verificationCode = List<String?>.filled(4, null);
    _focusNodes = List<FocusNode?>.filled(4, null);
    _textControllers = List<TextEditingController?>.filled(4, null,);
  }

  @override
  void didUpdateWidget(covariant OtpPinView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.clearText != widget.clearText && widget.clearText == true) {
      for (var controller in _textControllers) {
        controller?.clear();
      }
      _verificationCode = List<String?>.filled(4, null);
      setState(() {
        widget.clearText = false;
      });
    }
  }


  @override
  void dispose() {
    super.dispose();
    for (var controller in _textControllers) {
      controller?.dispose();
    }
  }


  @override
  Widget build(BuildContext context) {
    // Listens for backspace key event when textfield is empty. Moves to previous node if possible.
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (value) {
        if (value.logicalKey.keyLabel == 'Backspace') {
          changeFocusToPreviousNodeWhenTapBackspace(context);
        }
      },
      child:
      generateTextFields(context),
    );
  }

  Widget _buildTextField({required BuildContext context, required int index,}) {
    return
      Padding(
          padding:  EdgeInsets.symmetric(horizontal: 7.w),
          child: SizedBox(height: 50.h,width: 50.w,
            child: TextFormField(
              showCursor: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              readOnly: false,
              autocorrect: false,
              enableSuggestions: false,
              style: TextStyle(color: ColorManager.ebony,fontSize: 14.sp, fontFamily: FontConstants.fontFamily,fontWeight: FontWeightManager.bold),
              autofocus: true,
              cursorColor: ColorManager.seaBuckthorn,
              controller: _textControllers[index],
              focusNode: _focusNodes[index],
              enabled: true,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                counterText: "",
                focusedBorder: outlineBorder(ColorManager.seaBuckthorn,),
                enabledBorder: outlineBorder(ColorManager.ebony,),
                disabledBorder:  outlineBorder (ColorManager.grey1),
                border:  outlineBorder(ColorManager.grey1),

                contentPadding: EdgeInsets.all(4.r),
              ),
              obscureText: false,
              onChanged: (String value) {
                if (value.length <= 1) {
                  _verificationCode[index] = value;
                  onCodeChanged(verificationCode: value);
                  changeFocusToNextNodeWhenValueIsEntered(
                    value: value,
                    indexOfTextField: index,
                  );
                  changeFocusToPreviousNodeWhenValueIsRemoved(
                      value: value, indexOfTextField: index);
                } else {
                  _handlePaste(value);
                }
                //save entered value in a list
                _verificationCode[index] = value;
                onCodeChanged(verificationCode: value);
                changeFocusToNextNodeWhenValueIsEntered(
                  value: value,
                  indexOfTextField: index,
                );
                changeFocusToPreviousNodeWhenValueIsRemoved(
                    value: value, indexOfTextField: index);
                onSubmit(verificationCode: _verificationCode);
              },
            ),
          ));
  }

  OutlineInputBorder outlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide: BorderSide(color: color, width: 2.w),
    );
  }


  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(4, (int i) {
      addFocusNodeToEachTextField(index: i);
      addTextEditingControllerToEachTextField(index: i);
      return _buildTextField(context: context, index: i);
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: textFields,
    );
  }

  void addFocusNodeToEachTextField({required int index}) {
    if (_focusNodes[index] == null) {
      _focusNodes[index] = FocusNode();
    }
  }

  void addTextEditingControllerToEachTextField({required int index}) {
    if (_textControllers[index] == null) {
      _textControllers[index] = TextEditingController();
    }
  }

  void changeFocusToNextNodeWhenValueIsEntered({
    required String value,
    required int indexOfTextField,
  }) {
    //only change focus to the next textField if the value entered has a length greater than one
    if (value.isNotEmpty) {
      //if the textField in focus is not the last textField,
      // change focus to the next textField
      if (indexOfTextField + 1 != 4) {
        //change focus to the next textField
        FocusScope.of(context).requestFocus(_focusNodes[indexOfTextField + 1]);
      } else {
        //if the textField in focus is the last textField, unFocus after text changed
        _focusNodes[indexOfTextField]?.unfocus();
      }
    }
  }

  // A flag to eliminate race condition between [changeFocusToPreviousNodeWhenValueIsRemoved] and [changeFocusToPreviousNodeWhenTapBackspace]
  bool _backspaceHandled = false;

  void changeFocusToPreviousNodeWhenValueIsRemoved({
    required String value,
    required int indexOfTextField,
  }) {
    // Race condition eliminator
    _backspaceHandled = true;
    Future.delayed(
      const Duration(milliseconds: 100),
          () {
        _backspaceHandled = false;
      },
    );
    //only change focus to the previous textField if the value entered has a length zero
    if (value.isEmpty) {
      //if the textField in focus is not the first textField,
      // change focus to the previous textField
      if (indexOfTextField != 0) {
        //change focus to the next textField
        FocusScope.of(context).requestFocus(_focusNodes[indexOfTextField - 1]);
      }
    }
  }

  void changeFocusToPreviousNodeWhenTapBackspace(BuildContext context) async {
    // Wait because this is running before [changeFocusToPreviousNodeWhenValueIsRemoved]
    await Future.delayed(const Duration(milliseconds: 50));
    if (_backspaceHandled) return;
    try {
      final index = _focusNodes.indexWhere((element) => element?.hasFocus ?? false);
      if (index > 0 && context.mounted) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    } catch (e) {
      log('Cannot focus on the previous field');
    }
  }

  void onSubmit({required List<String?> verificationCode}) {
    if (verificationCode.every((String? code) => code != null && code != '')) {

        widget.onSubmit(verificationCode.join());

    }
  }

  void onCodeChanged({required String verificationCode}) {
    widget.onCodeChanged(verificationCode);
    }

  void _handlePaste(String str) {
    if (str.length > 4) {
      str = str.substring(0, 4);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str.substring(i, i + 1);
      _textControllers[i]!.text = digit;
      _textControllers[i]!.value = TextEditingValue(text: digit);
      _verificationCode[i] = digit;
    }

    FocusScope.of(context).requestFocus(_focusNodes[4 - 1]);
    // setState(() {});
  }
}

