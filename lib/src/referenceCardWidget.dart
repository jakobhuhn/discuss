import 'package:flutter/material.dart';
import 'references.dart';
import 'customExpansionTile.dart';
import 'referencelists.dart';

Widget referenceCardWidget (Reference reference){
  return Padding(
    padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: AnimatedContainer(
        color: Colors.white,
        duration: Duration(seconds: 1),
        child: MyExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Hero(
                      child: Text(
                        reference.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      tag: reference.name,
                    ),
                    Padding(padding: EdgeInsets.all(2.5),),
                    Text(
                      reference.statement,
                      style: TextStyle(fontSize: 14.0,color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4.0),),
              Expanded(
                flex: 1,
                child: Image.network(reference.imageurl),
              )],
          ),
          children: [Text(reference.author),Text(reference.domain)],
        ),
      ),
    ),
  );
}