import 'package:flutter/material.dart'
    '';
import 'package:get/get.dart';
import 'package:haztech_task/Core/Constants/colors.dart';

class MyButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const MyButton({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onTap,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          color: kWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const MyTextButton({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MyButtonLong extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final Color? color;

  const MyButtonLong({
    Key? key,
    required this.name,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 55,
        width: Get.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onTap,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
