import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class DropListModel with CustomDropdownListFilter {
  final String name;
  final String id;

  const DropListModel({required this.name, required this.id});

  @override
  String toString() {
    return name;
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
