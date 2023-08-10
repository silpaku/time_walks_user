import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.size,
    required this.fieldName,
    this.hideField = false,
    this.numPad = false,
    this.colorValue = Colors.white,
    this.enableTextField = true,
    this.height,
    this.maxLines = 1,
    this.textString,
    required this.textController,
  });

  final Size size;
  final String fieldName;
  final String? textString;
  final bool hideField;
  final bool numPad;
  final bool enableTextField;
  final Color colorValue;
  final double? height;
  final int maxLines;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    !enableTextField
        ? WidgetsBinding.instance!.addPostFrameCallback((_) {
            textController.text = textString ?? "";
          })
        : null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorValue,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(197, 171, 167, 167),
                  borderRadius: BorderRadius.circular(15), // Border radius for the container
                ),
                child: TextFormField(
                  controller: textController,
                  maxLines: maxLines,
                  enabled: enableTextField,
                  obscureText: hideField,
                  keyboardType: numPad ? TextInputType.phone : null,
                  decoration: InputDecoration(
                    labelText: fieldName,
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // text alignment
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
