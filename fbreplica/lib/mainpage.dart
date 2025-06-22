import 'package:flutter/material.dart';
import '../widgets/story_card.dart';
import '../widgets/post_card.dart';
import '../widgets/status_update.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.message),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            StatusUpdate(),
            Divider(),
            StorySection(),
            Divider(),
            PostCard(
              username: 'John Doe',
              timeAgo: '2 hrs ago',
              postText: 'Hello Facebook!',
              imageUrl: '',
            ),
            PostCard(
              username: 'Jane Smith',
              timeAgo: '5 hrs ago',
              postText: 'Nice weather today 🌤️',
              imageUrl: '',
            ),
          ],
        ),
      ),
    );
  }
}
