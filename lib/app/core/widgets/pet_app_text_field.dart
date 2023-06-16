import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetAppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

  const PetAppTextField({
    Key? key,
    required this.textEditingController,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      controller: textEditingController,
      style: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 65, 65, 65),
        ),
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        prefixIconColor: prefixIconColor,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 65, 65, 65),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(35),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
