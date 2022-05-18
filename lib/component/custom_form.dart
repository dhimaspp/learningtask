import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key, this.title, this.controller, this.hintText})
      : super(key: key);
  final String? title;
  final TextEditingController? controller;
  final String? hintText;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title!),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
