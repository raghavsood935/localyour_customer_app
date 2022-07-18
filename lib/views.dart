import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: SizedBox(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
          height: 20.0,
          width: 20.0,
        ),
      ),
    );
  }
}