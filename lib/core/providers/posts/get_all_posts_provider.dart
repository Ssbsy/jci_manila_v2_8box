import 'package:flutter/material.dart';
import 'package:jci_manila_v2/core/base_api/base_api.dart';
import 'package:jci_manila_v2/core/services/posts/get_posts_services.dart';

class GetAllPostsProvider extends ChangeNotifier {
  final GetPostsServices getPost = GetPostsServices(BaseApiServices());

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Map<String, dynamic>?> _postData = [];
  List<Map<String, dynamic>?> get postData => _postData;

  Future<void> getPosts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await getPost.getAllPosts();
      debugPrint("API Response: $response");

      if (response['success'] == true && response['data'] is List) {
        _postData = List<Map<String, dynamic>>.from(response['data']);
      } else {
        _postData = [];
        debugPrint('Unexpected data format: ${response['message']}');
      }
    } catch (e) {
      _postData = [];
      debugPrint('Error in getPosts: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
