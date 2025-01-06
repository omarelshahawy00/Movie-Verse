class ActorModel {
  String? birthday;
  String? deathday;

  int? id;

  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;

  ActorModel({
    this.birthday,
    this.deathday,
    this.id,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });
  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'],
      name: json['name'],
      birthday: json['birthday'] ?? 'Unknown',
      deathday: json['deathday'] ?? 'Alive',
      knownForDepartment: json['known_for_department'] ?? 'Unknown',
      placeOfBirth: json['place_of_birth'] ?? 'Unknown',
      popularity: json['popularity'],
      profilePath: json['profile_path'],
    );
  }
}
