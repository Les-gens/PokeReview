import 'package:flutter/material.dart';

class Comment {
  String? userid;
  String? pokemonid;
  String? content;

  Comment({required this.pokemonid, required this.userid, required this.content});

  factory Comment.fromJson(Map<String, dynamic> json) => _commentFromJson(json);

  Map<String, dynamic> toJson() => _commentToJson(this);

  @override
  String toString() => 'Comment<content: $content, userid: $userid, pokemonid, $pokemonid>';
}

Comment _commentFromJson(Map<String, dynamic> json) {
  return Comment(
    content: json['content'] as String,
    pokemonid: json['pokemonid'] as String,
    userid: json['userid'] as String,
  );
}

Map<String, dynamic> _commentToJson(Comment instance) => <String, dynamic>{
      'content': instance.content,
      'pokemonid': instance.pokemonid,
      'userid': instance.userid,
    };
