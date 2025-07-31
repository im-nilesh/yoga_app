class ScriptEntry {
  final String text;
  final int startSec;
  final int endSec;
  final String imageRef;

  ScriptEntry({
    required this.text,
    required this.startSec,
    required this.endSec,
    required this.imageRef,
  });

  factory ScriptEntry.fromJson(Map<String, dynamic> json) {
    return ScriptEntry(
      text: json['text'],
      startSec: json['startSec'],
      endSec: json['endSec'],
      imageRef: json['imageRef'],
    );
  }
}

class PoseSegment {
  final String type;
  final String name;
  final String audioRef;
  final int durationSec;
  final List<ScriptEntry> script;
  final int? iterations;

  PoseSegment({
    required this.type,
    required this.name,
    required this.audioRef,
    required this.durationSec,
    required this.script,
    this.iterations,
  });

  factory PoseSegment.fromJson(Map<String, dynamic> json) {
    return PoseSegment(
      type: json['type'],
      name: json['name'],
      audioRef: json['audioRef'],
      durationSec: json['durationSec'],
      script:
          (json['script'] as List)
              .map((entry) => ScriptEntry.fromJson(entry))
              .toList(),
      iterations: json['iterations'] is int ? json['iterations'] : null,
    );
  }
}
