import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainAlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function()? OnPressed;
  const MainAlreadyHaveAnAccountCheck(
      {Key? key, this.login = true, required this.OnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account?" : "Already have an account?",
          style: TextStyle(
            color: MainColorData.green_dop,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: MainSizeData.SIZE_8,
        ),
        GestureDetector(
          onTap: OnPressed,
          child: Text(
            login ? "Sign Up" : "Login",
            style: TextStyle(
              color: MainColorData.green_dop,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
