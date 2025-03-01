import 'package:accelray_machine_test/global/customs.dart';
import 'package:accelray_machine_test/global/global_data.dart';
import 'package:accelray_machine_test/global/gradient_decoration.dart';
import 'package:accelray_machine_test/screens/category_screen.dart';
import 'package:accelray_machine_test/screens/login_screen.dart';
import 'package:accelray_machine_test/shared/circle_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewScreen extends StatelessWidget {
  final int index;
  final int score;
  const ReviewScreen({super.key, required this.index, required this.score});

  @override
  Widget build(BuildContext context) {
    double percentage = index < 0 ? (score / (index + 2)) * 100 : (score / (index + 1)) * 100;

    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 240, 252),
            ),
            child: Column(
              children: [
                const Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 17),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Try again',
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 17),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Go to login',
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(fontSize: 13.sp, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          body: Container(
            decoration: blackGradient,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    '$score out of ${index + 1} are correct',
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 245, 240, 252),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomCircularProgress(
                            percentage: percentage,
                            radius: 85.0,
                            lineWidth: 10.0,
                            backgroundColor: Colors.grey.shade300,
                          ),
                          Text(
                            'Congratulations',
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            'You have got $score Points',
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              for (int i = 0; i < (index + 1); i++)
                                if (numbers[i] == 0)
                                  Padding(
                                    padding: EdgeInsets.all(.01.sw),
                                    child: CircleAvatar(
                                      backgroundColor: const Color.fromARGB(255, 232, 65, 53),
                                      radius: 25,
                                      child: Text(
                                        '${i + 1}',
                                        style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                else
                                  Padding(
                                    padding: EdgeInsets.all(.01.sw),
                                    child: CircleAvatar(
                                      backgroundColor: const Color.fromARGB(255, 70, 162, 73),
                                      radius: 25,
                                      child: Text(
                                        '${i + 1}',
                                        style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
