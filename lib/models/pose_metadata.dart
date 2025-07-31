class PoseMetadata {
  final String id;
  final String title;
  final String category;
  final int defaultLoopCount;
  final String tempo;

  PoseMetadata({
    required this.id,
    required this.title,
    required this.category,
    required this.defaultLoopCount,
    required this.tempo,
  });

  factory PoseMetadata.fromJson(Map<String, dynamic> json) {
    return PoseMetadata(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      defaultLoopCount: json['defaultLoopCount'],
      tempo: json['tempo'],
    );
  }
}
