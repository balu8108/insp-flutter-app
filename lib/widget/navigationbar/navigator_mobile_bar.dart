import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart'; // For Redux integration
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/navbar/navbar_redux.dart';

class NavigatorMobileBar extends StatefulWidget implements PreferredSizeWidget {
  const NavigatorMobileBar({Key? key}) : super(key: key);

  @override
  _NavigatorMobileBarState createState() => _NavigatorMobileBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavigatorMobileBarState extends State<NavigatorMobileBar> {
  // Default userData and inspCardModel values
  LoginResponseModelResult userData =
      const LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);

  INSPCardModel inspCardModel = const INSPCardModel(
      '1',
      'Physics',
      'In Progress',
      'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.');

  // Initialize selected index for the bottom navigation
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load user data when the widget is initialized
  }

  // Function to load user data
  Future<void> _loadUserData() async {
    LoginResponseModelResult userDatas = await getUserData(); // Fetch user data
    setState(() {
      userData = userDatas; // Update userData state
    });
  }

  // Function to handle button press and dispatch Redux action
  void _onButtonPressed(String buttonText) {
    final store = StoreProvider.of<AppState>(context); // Get the Redux store
    store.dispatch(
        UpdateSelectedButton(selectedButton: buttonText)); // Dispatch action
  }

  // Function to handle bottom navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update selected index
    });
    // Add additional navigation logic if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navbar(),
    );
  }

  // Navbar UI with dynamic icons based on user type
  Widget _navbar() {
    // Define two different sets of icons based on user type
    List<IconData> userTypeZeroIcons = [
      Icons.home, // Home
      Icons.calendar_month, // Calendar
      Icons.school, // My Courses
      Icons.library_books, // Library
      Icons.book, // Assignment
    ];

    List<IconData> otherUserIcons = [
      Icons.home, // Home
      Icons.calendar_month, // Calendar
      Icons.school, // My Courses
      Icons.book, // Assignment
      Icons.lightbulb, // Suggestion
    ];

    // Choose icons based on user type
    List<IconData> displayedIcons =
        userData.userType == 0 ? userTypeZeroIcons : otherUserIcons;

    return Container(
      height: 80,
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(displayedIcons.length, (index) {
          return IconButton(
            icon: Icon(
              displayedIcons[index],
              color: selectedIndex == index ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              _onItemTapped(index); // Update selected index
              _onButtonPressed(
                  displayedIcons[index].toString()); // Dispatch action
            },
          );
        }),
      ),
    );
  }
}
