import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jci_manila_v2/app/theme/app_colors.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';
import 'package:jci_manila_v2/core/constants/images.dart';
import 'package:jci_manila_v2/core/providers/posts/create_posts_provider.dart';
import 'package:jci_manila_v2/core/providers/profile/profile_provider.dart';
import 'package:provider/provider.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final controller = TextEditingController();
  bool _hasChanges = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreatePostsProvider>(
      builder: (context, createPostProvider, child) {
        return PopScope(
          canPop: !_hasChanges,
          onPopInvoked: (didPop) async {
            if (didPop) return;
            _handleExit(context);
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => _handleExit(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                title: GestureDetector(
                  onTap: () => _handleExit(context),
                  child: const WidgetText(
                    title: 'Cancel Post',
                    color: Colors.black,
                    size: 16,
                    isBold: true,
                  ),
                ),
                centerTitle: false,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (_hasChanges) {
                          // Handle the post creation logic
                          final response = await createPostProvider.createPost(
                            content: controller.text,
                            images:
                                [], // You can pass the images list if available
                          );

                          if (response['success']) {
                            // Handle success
                            Navigator.pop(context);
                          } else {
                            // Handle failure (e.g., show error message)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(response['message'])),
                            );
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.accentBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            createPostProvider.isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : const WidgetText(
                                  title: 'Post',
                                  color: Palette.white,
                                  size: 14,
                                  isBold: true,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(15),
                    _header(ProfileProvider()),
                    const Gap(15),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onChanged:
                            (value) =>
                                setState(() => _hasChanges = value.isNotEmpty),
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'What would you like to share?',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleExit(BuildContext context) async {
    if (!_hasChanges) {
      Navigator.pop(context);
      return;
    }

    final shouldExit = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Discard post?'),
            content: const Text(
              'You have unsaved changes. Are you sure you want to discard them?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Discard'),
              ),
            ],
          ),
    );

    if (shouldExit ?? false) {
      if (mounted) Navigator.pop(context);
    }
  }

  Widget _header(ProfileProvider profileProvider) {
    final profile = Provider.of<ProfileProvider>(context);
    String fullName =
        [
          profileProvider.user?.firstName ?? '',
          profileProvider.user?.lastName ?? '',
        ].where((part) => part.isNotEmpty).join(' ').trim();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Images.postImg,
            const Gap(10),
            WidgetText(title: fullName, isBold: true, size: 16),
          ],
        ),
        Images.addImgBtn,
      ],
    );
  }
}
