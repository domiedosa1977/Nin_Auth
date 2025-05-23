import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormContainerWidget extends StatefulWidget {

  final TextEditingController? controller;
  final Key? fieldKey;
   final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final List <TextInputFormatter> ? inputFormatters;
  final FormFieldSetter<String>?onSaved;
  final FormFieldValidator<String>?validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  
  
  const FormContainerWidget({super.key,
  this.controller,
  this.fieldKey,
  this.isPasswordField,
  this.helperText,
  this.hintText,
  this.inputType,
  this.labelText,
  this.onFieldSubmitted,
  this.onSaved,
  this.validator,
    this.inputFormatters
  });

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: new TextFormField(
        style:TextStyle(color: Colors.black),
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
        ],
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true? _obscureText:false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: new InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black45),
        ),
      ),
    );
  }
}