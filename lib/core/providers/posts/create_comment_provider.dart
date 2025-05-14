import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/posts/create_comment_services.dart';

class CreateCommentProvider extends ChangeNotifier {
  final CreateCommentServices createComment = CreateCommentServices(
    BaseApiServices(),
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> createPost({
    required String postID,
    required String comment,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await createComment.createComment(
        postID: postID,
        comment: comment,
      );
      debugPrint("Create comment response: $response");

      return response;
    } catch (e) {
      debugPrint('Error in createComment: $e');
      return {"success": false, "message": "An error occurred: $e"};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
