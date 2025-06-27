// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) =>
    _ArticleModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      emoji: json['emoji'] as String,
    );

Map<String, dynamic> _$ArticleModelToJson(_ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emoji': instance.emoji,
    };
