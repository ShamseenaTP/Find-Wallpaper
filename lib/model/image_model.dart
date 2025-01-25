// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ImageModel {
  final String id;
  final Map urls;
  ImageModel({
    required this.id,
    required this.urls,
  });

  ImageModel copyWith({
    String? id,
    String? color,
    Map? urls,
  }) {
    return ImageModel(
      id: id ?? this.id,
      urls: urls ?? this.urls,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'urls': urls,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] as String,
      urls: Map.from((map['urls'] as Map),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) => ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ImageModel(id: $id, urls: $urls)';

  @override
  bool operator ==(covariant ImageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      mapEquals(other.urls, urls);
  }

  @override
  int get hashCode => id.hashCode ^ urls.hashCode;
}
