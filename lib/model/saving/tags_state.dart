class Tags {
  Tags({
    required this.id,
    required this.tag,
  });
  final int id;
  final String tag;
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': tag,
    };
  }
}
