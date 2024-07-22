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
      "image": "assets/images/Onboarding1.png",
      "title": "Get access to the test notes",
      "description":
          " Welcome to INSP! Gain access to a wealth of knowledge through our curated test notes. Explore and enhance your learning experience with comprehensive study materials",
    },
    {
      "image": "assets/images/Onboarding2.png",
      "title": "Join from anywhere",
      "description":
          "Join from anywhere, anytime! Our platform offers the flexibility to access study materials and connect with fellow learners from  the comfort of your own space. Your education, your rules",
    },
    {
      "image": "assets/images/Onboarding3.png",
      "title": "Clear your doubts in no time",
      "description":
          " Have questions? Clear your doubts in no time! Connect with educators and peers effortlessly, ensuring a smooth learning journey. Say goodbye to uncertainties, embrace clarity!"
    },
  ];
  void _onSkipButton() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => LoginScreen.getScreen()));
  }

  void _onBackwardButton() {
    if (_currentPage == 0) {
    } else {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _onNextButton() {
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
            onPressed: _onBackwardButton,
            icon: const Icon(Icons.chevron_left_outlined),
          ),
          actions: [
            TextButton(
              onPressed: _onSkipButton,
              child: const Text(
                "Skip",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, 0.81)),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/images/insplogo.png'),
            ),
            Expanded(
                child: Stack(children: [
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
                      Image.asset(
                        onBoardingData[index]['image'],
                        height: 300,
                      ),
                      Text(
                        onBoardingData[index]['title'],
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          onBoardingData[index]['description'],
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 0.81)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingData.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ],
                  );
                },
              )
            ])),
            Container(
              height: 56,
              width: double.infinity,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF3C8DBC),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextButton(
                onPressed: _onNextButton,
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.9),
      height: 10,
      width: _currentPage == index ? 18 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
