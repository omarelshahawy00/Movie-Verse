class VideoModel {
  final String? key;
  final String? type;
  final String? stie;

  const VideoModel({
    this.key,
    this.type,
    this.stie,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        key: json['key'] as String,
        type: json['type'] as String,
        stie: json['site'] as String,
      );
}
