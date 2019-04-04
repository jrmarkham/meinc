import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Company {
  final String name;
  final String about;
  final String philosophy;
  final String technology;
  final List<String> logos;
  final List<String> backdropPhotos;
  final List<Link> links;
  final List<Work> works;
  Company(
      {@required this.name,
      @required this.links,
      @required this.about,
      @required this.logos,
      @required this.backdropPhotos,
      @required this.technology,
      @required this.philosophy,
      @required this.works});
}

class Work {
  final String title;
  final String type;
  final String thumbnail;
  final String info;
  final String url;
  Work(
      {@required this.title,
      @required this.type,
      @required this.thumbnail,
      @required this.info,
      @required this.url});
}

class Link {
  final String name;
  final String info;
  final String url;

  Link({@required this.name, @required this.url, @required this.info});
}
