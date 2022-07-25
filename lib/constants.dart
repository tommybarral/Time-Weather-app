import 'package:flutter/material.dart';

Widget neumorphismContainer(double height, double width, Widget? child) {
  return  Container(
    height: height,
    width: width,
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade500, offset: const Offset(4, 4), blurRadius: 15, spreadRadius: 1),
          const BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 15, spreadRadius: 1),
        ]
    ),
    child: child,
  );
}