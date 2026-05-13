import 'dart:io';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final File images;
  final VoidCallback onDelete;
  const ImageDialog({super.key, required this.images, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(images),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder()),
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
              label: Text('Excluir Images'),
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
