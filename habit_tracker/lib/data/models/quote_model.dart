class Quote {
  final String content;
  final String author;

  Quote({
    required this.content,
    required this.author,
  });

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      content: map['content'] as String? ?? '',
      author: map['author'] as String? ?? 'Unknown',
    );
  }
}