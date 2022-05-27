import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const PrimaryButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 25),
          )
      )
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const SecondaryButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 50,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(fontSize: 25),
            )
        )
    );
  }
}
