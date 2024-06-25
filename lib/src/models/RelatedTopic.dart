import 'package:flutter/cupertino.dart';

class RelatedTopic {
  final String title;
  final IconData icon;
  final String shortDescription;
  final String longDescription;
  final String exercise;
  final List<String>? audioPath;

  RelatedTopic({required this.title, required this.icon, required this.shortDescription, required this.longDescription, required this.exercise, this.audioPath});

}
