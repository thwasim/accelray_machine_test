import 'package:accelray_machine_test/global/gradient_decoration.dart';
import 'package:accelray_machine_test/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

final userNameTextCont = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: blackGradient,
          child: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          color: Colors.white,
                          width: .15.sw,
                          height: .15.sh,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  height: (2 / 3).sh,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 240, 252),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.quicksand(fontSize: 25.0.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: userNameTextCont,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username can not be empty';
                            } else if (value.length < 4) {
                              return "Username must be more than 4 chracters";
                            } else if (!value[0].contains(RegExp(r'[A-Z]'))) {
                              return "First character in username must be uppercase ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 15),
                            prefixIcon: const Icon(Icons.person),
                            hintText: "Username",
                            hintStyle: GoogleFonts.quicksand(
                              textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                            ),
                            filled: false,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CategoryScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.quicksand(fontSize: 18.0.sp, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
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
