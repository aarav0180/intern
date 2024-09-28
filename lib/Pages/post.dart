import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intern/Pages/Profile/Profile.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {

  //list of details, will get it from API
  final List<Map<String, String>> stories = [
    {
      'image': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/Image%206.png?alt=media&token=b481e151-8696-467c-9ece-29dda3a52d8f',
      'profileImage': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/androgynous-avatar-non-binary-queer-person.jpg?alt=media&token=7a864647-6db0-4544-8753-7dcc00f56feb',
      'title': 'Aarav heading',
      'subtitle': 'Exploring new adventures'
    },
    {
      'image': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/Image%205.png?alt=media&token=ab103968-9809-4ddb-ba2b-eb03a91df547',
      'profileImage': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'title': 'Shyam at TechStars',
      'subtitle': 'Having a blast at TechStars'
    },
    {
      'image': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/Image%204.png?alt=media&token=afaf3717-a65b-448d-a19d-6ca112d931d5',
      'profileImage': 'https://images.unsplash.com/photo-1502767089025-6572583495b4?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'title': 'Shyam is with Susan',
      'subtitle': 'Insightful speakers'
    },
    {
      'image': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/Image%203.png?alt=media&token=e4e31b35-a7bd-4bbf-b3cd-a0f58f951e6a',
      'profileImage': 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'title': 'Shyam at Housing Expo',
      'subtitle': 'Great properties, great deals'
    },
    {
      'image': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/Image%202.png?alt=media&token=4b671f55-bab3-4913-80a8-81dc1d53e827',
      'profileImage': 'https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'title': 'Shyam is with Suman',
      'subtitle': 'Having a blast at Arijit\'s Concert'
    },
    {
      'image': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/Image%201.png?alt=media&token=0f442225-21a5-4715-a688-8eb1062ce1e6',
      'profileImage': 'https://images.unsplash.com/photo-1543128639-7bd5fa8b22a7?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'title': 'Shyam is with Suman',
      'subtitle': 'Enjoying a great evening'
    },
    {
      'image': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/Image%202.png?alt=media&token=4b671f55-bab3-4913-80a8-81dc1d53e827',
      'profileImage': 'https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'title': 'Shyam is with Suman',
      'subtitle': 'Having a blast at Arijit\'s Concert'
    },
    {
      'image': 'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/Image%202.png?alt=media&token=4b671f55-bab3-4913-80a8-81dc1d53e827',
      'profileImage': 'https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'title': 'Shyam is with Suman',
      'subtitle': 'Having a blast at Arijit\'s Concert'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 26, 31, 0),

      // appbar code will be the same
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 26, 31, 0),
        elevation: 0,
        title: const Text(
          'Stories',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
            onPressed: () {},
          ),

          // this will be mutable for different profiles.
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },

            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/perfectnew-cc234.appspot.com/o/androgynous-avatar-non-binary-queer-person.jpg?alt=media&token=7a864647-6db0-4544-8753-7dcc00f56feb',
                ),
              ),
            ),
          ),
        ],
      ),

      // main body
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0,top: 20, bottom: 50 ),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: stories.length,
          itemBuilder: (context, index) {

            // make height difference between cards
            return Transform.translate(
              offset: Offset(0, index.isOdd ? 40 : 0),

              // storycard to show the stories
              child: StoryCard(
                imageUrl: stories[index]['image'] ?? '',
                profileImageUrl: stories[index]['profileImage'] ?? '',
                title: stories[index]['title'] ?? 'No title',
                subtitle: stories[index]['subtitle'] ?? 'No subtitle',
              ),
            );
          },
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String imageUrl;
  final String profileImageUrl;
  final String title;
  final String subtitle;

  const StoryCard({
    Key? key,
    required this.imageUrl,
    required this.profileImageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey[900],
      child: Stack(
        children: [
          // Image at the top
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: imageUrl.isNotEmpty
                ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 300, // All cards now have the same height
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 50,
                  ),
                );
              },
            )
                : const Center(
              child: Icon(
                Icons.broken_image,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),

          // Positioned at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 17),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                // Semi-transparent background
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                      profileImageUrl,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
