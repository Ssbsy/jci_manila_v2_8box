import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/posts/like_comment_services.dart';

class LikeCommentProvider extends ChangeNotifier {
  final LikeCommentServices likeComment = LikeCommentServices(
    BaseApiServices(),
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> createPost({required String commentID}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await likeComment.likeUnlike(commentID: commentID);
      debugPrint("Like comment response: $response");

      return response;
    } catch (e) {
      debugPrint('Error in LikeComment: $e');
      return {"success": false, "message": "An error occurred: $e"};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
