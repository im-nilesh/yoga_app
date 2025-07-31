import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/pose_metadata.dart';
import '../models/pose_segment.dart';

class PoseData {
  final PoseMetadata metadata;
  final Map<String, String> imageAssets;
  final Map<String, String> audioAssets;
  final List<PoseSegment> sequence;

  PoseData({
    required this.metadata,
    required this.imageAssets,
    required this.audioAssets,
    required this.sequence,
  });
}

class PoseParser {
  static Future<PoseData> loadPoseData() async {
    final rawJson = await rootBundle.loadString('assets/poses.json');
    final data = json.decode(rawJson);

    return PoseData(
      metadata: PoseMetadata.fromJson(data['metadata']),
      imageAssets: Map<String, String>.from(data['assets']['images']),
      audioAssets: Map<String, String>.from(data['assets']['audio']),
      sequence:
          (data['sequence'] as List)
              .map((e) => PoseSegment.fromJson(e))
              .toList(),
    );
  }
}
