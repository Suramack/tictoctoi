import 'package:flutter/material.dart';

resultDialog({required BuildContext context, required String title}) =>
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(content: Column(children: [Text(title)])),
    );    