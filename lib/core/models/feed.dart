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
    bool isLiked = (map['likes'] as List<int>).contains(currentUserId);

    return Feed(
      id: map['id'],
      content: map['content'] ?? '',
      userName: map['member']?['name'] ?? 'Unknown User',
      userPhotoUrl: map['member']?['photo'] ?? '',
      createdAt: map['createdAt'] ?? '',
      imageUrls:
          (map['images'] as List).map((img) => img['image'] as String).toList(),
      reactions: (map['likes'] as List).length,
      comments: map['comments'] ?? [],
      likes: map['likes'] ?? [],
      isLiked: isLiked,
    );
  }
}
