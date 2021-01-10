import 'package:flutter/material.dart';
import 'package:discuss/src/references.dart';

class ReferenceList {
  final String title;
  final String notes;
  final List<Reference> references;
  final MaterialColor backgroundColor;
  final String author;

  const ReferenceList({
    this.title,
    this.notes,
    this.references,
    this.backgroundColor,
    this.author,});

    void AddReferenceFromURL (String url){
      //references.add(ReferenceFromURL(url));
    }


}

List<Reference> list = [];
List<Reference> list2 = [];
List<Reference> list3 = [];

final referenceLists = [
  ReferenceList(
    title: "List1",
    notes: "This first list was created first",
    references: list,
    backgroundColor: Colors.amber,
    author: "some dude on the internet"
  ),
  ReferenceList(
    title: "List2",
    notes: "This second list was created second",
    references: list2,
    backgroundColor: Colors.cyan,
    author: "some dude on the street",
  ),
  ReferenceList(
    title: "List3",
    notes: "This third list was created third",
    references: list3,
    backgroundColor: Colors.lightGreen,
    author: "some dude who said so"
  )
];
