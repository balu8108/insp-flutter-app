import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/pages/login/login_screen.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:inspflutterfrontend/utils/localstorage.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';

class Mobileappbar extends StatefulWidget implements PreferredSizeWidget {
  const Mobileappbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<Mobileappbar> createState() => _MobileappbarState();
}

class _MobileappbarState extends State<Mobileappbar> {
  @override
  void initState() {
    super.initState();
  }

  // Function to show the profile modal with logout button
  void _showProfileModal(
      BuildContext context, LoginResponseModelResult userData) {
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
                onPressed: () async {
                  leaveRoomHandler(StoreProvider.of<AppState>(context));
                  await logoutData("insp_user_profile");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false, // This removes all the previous routes
                  );
                },
                // icon: const Icon(Icons.logout),
                label: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(60, 141, 188, 1),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginResponseModelResult userDatas = getUserDataFromStore(context);
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/insplogo.png', height: 40),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                userDatas.name.isNotEmpty
                    ? userDatas.name[0].toUpperCase()
                    : '',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            onPressed: () =>
                _showProfileModal(context, userDatas), // Show profile modal
          ),
        ],
      ),
    );
  }
}
