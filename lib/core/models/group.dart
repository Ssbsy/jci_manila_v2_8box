class Group {
  int? id;
  final String name;
  final String description;
  final int members;
  bool isJoined;

  Group({
    required this.name,
    required this.description,
    required this.members,
    this.isJoined = false,
    this.id,
  });
}
