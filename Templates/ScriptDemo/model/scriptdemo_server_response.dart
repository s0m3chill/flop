class ScriptDemoServerResponse {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const ScriptDemoServerResponse({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory ScriptDemoServerResponse.fromJson(Map<String, dynamic> json) {
    return ScriptDemoServerResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
