import 'package:flutter/material.dart';

import '../constants/assets_image_path.dart';

class SnackbarWidget {
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(
          bottom: 24,
          left: 16,
          right: 16,
        ),

        // padding: const EdgeInsets.all(25),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              softWrap: true,
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 143, 42, 34),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              AssetsImagePath.gatopreto,
              height: 50,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
