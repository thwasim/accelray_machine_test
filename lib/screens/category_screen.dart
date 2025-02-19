import 'package:accelray_machine_test/global/global_data.dart';
import 'package:accelray_machine_test/global/gradient_decoration.dart';
import 'package:accelray_machine_test/screens/login_screen.dart';
import 'package:accelray_machine_test/shared/card_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: blackGradient,
            ),
            Positioned(
              left: 20,
              top: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.waving_hand_outlined, color: Colors.white, size: 15),
                      SizedBox(width: 10.w),
                      Text(
                        'Hello ${userNameTextCont.text}',
                        style: GoogleFonts.quicksand(
                          fontSize: 17.0.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.83,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 240, 252),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CardCategory(
                        images: "assets/images/flutter-icon.png",
                        testName: "Flutter",
                        brief:
                            "Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web,[3] Fuchsia, Android, iOS, Linux, macOS, and Windows.",
                        numOfQuestions: flutterTest.length,
                        time: 10,
                      ),
                      CardCategory(
                        images: "assets/images/python.png",
                        testName: "Python",
                        brief:
                            "Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.",
                        numOfQuestions: pythonTest.length,
                        time: 10,
                      ),
                      CardCategory(
                        images: "assets/images/java-logo.png",
                        testName: "Java",
                        brief:
                            "Java is a high-level, general-purpose, memory-safe, object-oriented programming language. It is intended to let programmers write once, run anywhere, meaning that compiled Java code can run on all platforms that support Java without the need to recompile.",
                        numOfQuestions: javaTest.length,
                        time: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
