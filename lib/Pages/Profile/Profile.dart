// screens/profile_page.dart
import 'package:flutter/material.dart';
import 'package:intern/Pages/Profile/profilePicture.dart';
import 'package:provider/provider.dart';
import '../../Provider/user_provider.dart';
import '../../Widgets/Button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final user = userProvider.user;

    if (user == null) {
      return const Center(child: Text('Failed to load user data.'));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Profile Page', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfilePicture(),
            const SizedBox(height: 52),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white24, width: 3),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              controller: TextEditingController(text: user.name),
            ),
            const SizedBox(height: 26),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white24, width: 3),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              controller: TextEditingController(text: user.email),
            ),
            const SizedBox(height: 26),
            TextField(
              decoration: InputDecoration(
                labelText: 'State',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white24, width: 3),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              controller: TextEditingController(text: user.state),
            ),
            const SizedBox(height: 52),
            Button(onPressed: () {
              // Save logic here
            }),
          ],
        ),
      ),
    );
  }
}





// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//
//   //default example will change according to user.
//   String username = "@Aarav_jff";
//   String email = "lyodra333@gmail.com";
//   String state = "Karnataka";
//   String city = "Bangalore";
//   File? _profileImage;
//
//   void updateProfileImage(File? image) {
//     setState(() {
//       _profileImage = image;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//
//       //appbar
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         title: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//
//       //body
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Profile Picture Widget
//               ProfilePicture(
//                 username: username,
//                 profileImage: _profileImage,
//                 onImagePicked: updateProfileImage,
//                 logo: lo,
//               ),
//
//               const SizedBox(height: 52),
//
//               // Username Input Field
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   labelStyle: TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.white24, width: 3),
//                   ),
//                 ),
//                 style: const TextStyle(color: Colors.white),
//                 controller: TextEditingController(text: username),
//               ),
//
//               const SizedBox(height: 26),
//
//               // Email Input Field
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   labelStyle: TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.white24, width: 3),
//                   ),
//                 ),
//                 style: const TextStyle(color: Colors.white),
//                 controller: TextEditingController(text: email),
//               ),
//
//               const SizedBox(height: 26),
//
//               // State Dropdown
//               DropdownButtonFormField<String>(
//                 value: state,
//                 items: ['Karnataka', 'Maharashtra', 'Delhi']
//                     .map((String state) => DropdownMenuItem<String>(
//                   value: state,
//                   child: Text(state, style: const TextStyle(color: Colors.white)),
//                 ))
//                     .toList(),
//                 decoration: InputDecoration(
//                   labelText: 'State',
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.white24, width: 3)
//                   ),
//                 ),
//                 dropdownColor: Colors.black,
//                 onChanged: (newValue) {
//                   setState(() {
//                     state = newValue!;
//                   });
//                 },
//               ),
//
//               const SizedBox(height: 26),
//
//               // City Input Field
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'City',
//                   labelStyle: TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.white24, width: 3),
//                   ),
//                 ),
//                 style: const TextStyle(color: Colors.white),
//                 controller: TextEditingController(text: city),
//               ),
//
//               const SizedBox(height: 62),
//
//               // Button to save info
//               Button(
//                 onPressed: () {
//                   // Handle saving logic here
//                   print("Save settings");
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
