import 'package:flutter/material.dart';

class CustomPhoneInput extends StatelessWidget {
  final TextEditingController controller;

  const CustomPhoneInput({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "Phone number",
        prefixText: "+62 ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
