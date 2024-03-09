import 'package:flutter/material.dart';

class DropListModel {
  DropListModel({required this.listOptionItems});

  final List<OptionItem> listOptionItems;
}

class OptionItem {
  final String id;
  final String title;

  OptionItem({required this.id, required this.title});
}
