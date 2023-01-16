import 'package:flutter/material.dart';

class PasswordRequirement extends StatelessWidget {
  const PasswordRequirement(
      {Key? key, required this.isValid, required this.text})
      : super(key: key);

  // If the requirment has been completed or not
  final bool isValid;

  // Statement of requirment
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: isValid ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isValid ? Icons.check : Icons.close,
              color: Colors.white,
              size: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
