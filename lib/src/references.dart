import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Reference {
  final String name;
  final String statement;
  final String domain;
  final String author;
  final String imageurl;

  const Reference(
  {this.name,
  this.statement,
  this.domain,
  this.author,
  this.imageurl});

}

final references = [
  Reference (
    name: "WHO funding in the last decade",
    statement: "Bill Gates DOES NOT fund the WHO to 80 percent",
    domain: "who.com",
    author: "Some guy on the internet"

  ),
  Reference (
    name: "Change of Carbon dioxide levels in the atmosphere",
    statement: "CO2 levels have increased by 20 pecent since 1990",
    domain: "fridaysforfuture.com",
    author: "some dude on the street"
  ),
  Reference(
    name: "The possible impacts of new Mutiations in Corona 19 Virus",
    statement: "Virologist say its too soon to say",
    domain: "getyourfactsstraight.info",
    author: "my sister"
  ),
  Reference (
      name: "WHO funding in the last decade",
      statement: "Bill Gates DOES NOT fund the WHO to 80 percent",
      domain: "who.com",
      author: "Some guy on the internet"

  ),
  Reference (
      name: "Change of Carbon dioxide levels in the atmosphere",
      statement: "CO2 levels have increased by 20 pecent since 1990",
      domain: "fridaysforfuture.com",
      author: "some dude on the street"
  ),
  Reference(
      name: "The possible impacts of new Mutiations in Corona 19 Virus",
      statement: "Virologist say its too soon to say",
      domain: "getyourfactsstraight.info",
      author: "my sister"
  ),
  Reference (
      name: "WHO funding in the last decade",
      statement: "Bill Gates DOES NOT fund the WHO to 80 percent",
      domain: "who.com",
      author: "Some guy on the internet"

  ),
  Reference (
      name: "Change of Carbon dioxide levels in the atmosphere",
      statement: "CO2 levels have increased by 20 pecent since 1990",
      domain: "fridaysforfuture.com",
      author: "some dude on the street"
  ),
  Reference(
      name: "The possible impacts of new Mutiations in Corona 19 Virus",
      statement: "Virologist say its too soon to say",
      domain: "getyourfactsstraight.info",
      author: "my sister"
  ),
  Reference (
      name: "WHO funding in the last decade",
      statement: "Bill Gates DOES NOT fund the WHO to 80 percent",
      domain: "who.com",
      author: "Some guy on the internet"

  ),
  Reference (
      name: "Change of Carbon dioxide levels in the atmosphere",
      statement: "CO2 levels have increased by 20 pecent since 1990",
      domain: "fridaysforfuture.com",
      author: "some dude on the street"
  ),
  Reference(
      name: "The possible impacts of new Mutiations in Corona 19 Virus",
      statement: "Virologist say its too soon to say",
      domain: "getyourfactsstraight.info",
      author: "my sister"
  ),
];
