import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String? message;
  const ErrorBox({super.key, this.message = ""});

  @override
  Widget build(BuildContext context) {
    return (message != "" || message!.isNotEmpty)
        ? Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.white, size: 40),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(message!, style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          )
        : SizedBox.square();
  }
}
