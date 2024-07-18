import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List onBoardingData = [
    {
      "image": "assets/images/image1.png",
      "title": "Get access to the test notes",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, libero"
    },
    {
      "image": "assets/images/image2.png",
      "title": "Get access to the test notes",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, libero"
    },
    {
      "image": "assets/images/image3.png",
      "title": "Get access to the test notes",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, libero"
    },
  ];

  Color whiteColor = Colors.white;
  Color textColor = const Color.fromRGBO(0, 0, 0, 0.81);

  void skipButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen.getScreen()),
    );
  }

  void backButton() {
    if (_currentPage == 0) {
      // Do nothing or show a snackbar indicating first screen
    } else {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void nextButton() {
    if (_currentPage == onBoardingData.length - 1) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen.getScreen()),
          (Route<dynamic> route) => false);
    } else {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: backButton,
          icon: const Icon(Icons.chevron_left_outlined),
        ),
        actions: [
          TextButton(
            onPressed: skipButton,
            child: Text(
              'Skip',
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // INSP Logo Container
          Container(
            height: 100, // Adjust height as needed
            alignment: Alignment.center,
            child: Image.asset(
                'assets/images/insplogo.png'), // Path to your INSP logo
          ),
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: onBoardingData.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(onBoardingData[index]['image']),
                        Text(
                          onBoardingData[index]['title'],
                          style: TextStyle(fontSize: 24, color: textColor),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          onBoardingData[index]['description'],
                          style: TextStyle(fontSize: 16, color: textColor),
                        ),
                      ],
                    );
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onBoardingData.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: nextButton,
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 10,
      width: _currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
