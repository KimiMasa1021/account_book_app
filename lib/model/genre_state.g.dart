// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenreState _$$_GenreStateFromJson(Map<String, dynamic> json) =>
    _$_GenreState(
      docId: json['docId'] as String? ?? "",
      name: json['name'] as String? ?? "",
      seq: json['seq'] as int? ?? 0,
    );

Map<String, dynamic> _$$_GenreStateToJson(_$_GenreState instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'name': instance.name,
      'seq': instance.seq,
    };
