import 'package:flutter/material.dart';

class PetAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool? loading;
  final bool? enabled;

  const PetAppButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.loading = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(400, 55),
        ),
        backgroundColor: MaterialStateProperty.all(
          enabled!
              ? const Color.fromARGB(140, 32, 168, 214)
              : const Color.fromARGB(139, 64, 94, 104),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
      child: loading!
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
    );
  }
}
