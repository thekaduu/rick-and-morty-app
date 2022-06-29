class Character {
  final int id;
  final String name;
  final String status;
  final Map<String, dynamic> lastLocation;
  final Map<String, dynamic> firstLocation;
  final String picture;
  final List<String> episodes;
  final String species;
  final String gender;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.lastLocation,
    required this.firstLocation,
    required this.picture,
    required this.episodes,
    required this.species,
    required this.gender,
  });

  factory Character.fromJson(dynamic json) {
    List<String> episodes = [];
    json['episode'].forEach((element) => {episodes.add(element.toString())});

    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      lastLocation: json['origin'],
      firstLocation: json['location'],
      picture: json['image'],
      episodes: episodes,
      species: json['species'].toString(),
      gender: json['gender'].toString(),
    );
  }

  String get fullName {
    var nameList = name.split(' ');
    return nameList.length == 1 ? name : "${nameList[0]} ${nameList[1]}".trim();
  }

  String get origin {
    return firstLocation['name'].toString();
  }

  String get lastKnowLocation {
    return lastLocation['name'].toString();
  }

  String get statusTranslated {
    switch (status.toLowerCase()) {
      case 'alive':
        return 'Vivo';
      case 'dead':
        return 'Morto';
      default:
        return 'Desconhecido';
    }
  }
}
