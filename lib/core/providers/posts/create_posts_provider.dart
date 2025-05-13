import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/posts/create_posts_services.dart';

class CreatePostsProvider extends ChangeNotifier {
  final CreatePostsServices postService = CreatePostsServices(
    BaseApiServices(),
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> createPost({
    required String content,
    required List<String> images,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await postService.createPost(
        content: content,
        images: images,
      );
      debugPrint("Create post response: $response");

      return response;
    } catch (e) {
      debugPrint('Error in createPost: $e');
      return {"success": false, "message": "An error occurred: $e"};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
