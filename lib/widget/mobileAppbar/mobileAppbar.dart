import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';

class Mobileappbar extends StatefulWidget implements PreferredSizeWidget {
  const Mobileappbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<Mobileappbar> createState() => _MobileappbarState();
}

class _MobileappbarState extends State<Mobileappbar> {
  // User data initialized here
  LoginResponseModelResult userData =
      const LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load user data
  }

  Future<void> _loadUserData() async {
    // Fetch user data using a mock or actual API call
    LoginResponseModelResult userDatas = await getUserData();
    setState(() {
      userData = userDatas; // Update state with fetched user data
    });
  }

  // Function to show the profile modal with logout button
  void _showProfileModal(BuildContext context) {
    // Display modal bottom sheet for user profile
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(userData.name),
                subtitle: Text(userData.email),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Close the modal
                  // Add logout logic here
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/insplogo.png', height: 40),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                userData.name.isNotEmpty ? userData.name[0].toUpperCase() : '',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            onPressed: () => _showProfileModal(context), // Show profile modal
          ),
        ],
      ),
    );
  }
}
