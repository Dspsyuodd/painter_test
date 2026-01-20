import 'package:flutter/material.dart';

class NeoTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final FocusNode? focusNode;

  const NeoTextField({
    required this.hint,
    required this.label,
    super.key,
    this.controller,
    this.obscureText = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(20, 162, 0, 171),
            Color.fromARGB(20, 0, 158, 183),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 60, 60, 60),
          ),
          BoxShadow(
            color: Color.fromARGB(255, 19, 19, 19),
            blurRadius: 30,
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          TextFormField(
            focusNode: focusNode,
            obscureText: obscureText,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              isDense: true,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.3),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.3),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
