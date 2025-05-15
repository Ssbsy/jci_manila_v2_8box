class Feed {
  final int id;
  final String content;
  final String userName;
  final String userPhotoUrl;
  final String createdAt;
  final List<String> imageUrls;
  final int reactions;
  final List<dynamic> comments;
  final List<dynamic> likes;
  bool isLiked;

  Feed({
    required this.id,
    required this.content,
    required this.userName,
    required this.userPhotoUrl,
    required this.createdAt,
    required this.imageUrls,
    required this.reactions,
    required this.comments,
    required this.likes,
    this.isLiked = false,
  });

  factory Feed.fromMap(Map<String, dynamic> map, String currentUserId) {
    final dynamic rawLikesData = map['likes'];
    final List<dynamic> rawLikes = rawLikesData is List ? rawLikesData : [];

    final List<dynamic> rawImages = map['images'] ?? [];
    final List<dynamic> rawComments =
        map['comments'] is List ? map['comments'] : [];

    final List<String> imageUrls =
        rawImages
            .map(
              (img) =>
                  img is Map && img.containsKey('image')
                      ? img['image'] as String
                      : '',
            )
            .where((url) => url.isNotEmpty)
            .toList();

    final bool isLiked = rawLikes.contains(int.tryParse(currentUserId));

    return Feed(
      id: map['id'] ?? 0,
      content: map['content'] ?? '',
      userName: map['member']?['name'] ?? 'Unknown User',
      userPhotoUrl: map['member']?['photo'] ?? '',
      createdAt: map['createdAt'] ?? '',
      imageUrls: imageUrls,
      reactions: rawLikes.length,
      comments: rawComments,
      likes: rawLikes,
      isLiked: isLiked,
    );
  }
}
