import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_images.dart';
import 'package:legal_vehicle_recovery_managment_app/views/auth%20views/signup_view.dart';
import 'package:legal_vehicle_recovery_managment_app/views/dashboard%20screen/dashboard_screen.dart';
import 'package:legal_vehicle_recovery_managment_app/widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  late final AnimationController _ac;
  late final Animation<double> _fadeIn;
  late final Animation<Offset> _slideUpHeader;
  late final Animation<Offset> _slideUpForm;

  // Palette

  InputDecoration _decoration(String label, {IconData? icon}) {
    return InputDecoration(
      hint: Text(
        label,
        style: TextStyle(color: const Color.fromARGB(255, 103, 103, 103)),
      ),
      // labelText: label,
      prefixIcon: icon != null ? Icon(icon) : null,
    );
  }

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _fadeIn = CurvedAnimation(parent: _ac, curve: Curves.easeOutCubic);
    _slideUpHeader = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(_fadeIn);
    _slideUpForm = Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _ac,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
          ),
        );

    // Kick off animation after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _ac.forward());
  }

  @override
  void dispose() {
    _ac.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightScaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header with curved bottom and subtle overlay
              // CustomHeader(fadeIn: _fadeIn, slideUpHeader: _slideUpHeader),
              Image.asset('assets/logo.png', height: 150),
              const Text(
                'Login to your account',
                style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),

              // Form
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: FadeTransition(
                  opacity: _fadeIn,
                  child: SlideTransition(
                    position: _slideUpForm,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: AppColors.blackTextColor,
                            ),
                            decoration:
                                _decoration(
                                  'Email',
                                  icon: Icons.mail_outline,
                                ).copyWith(
                                  filled: true,
                                  fillColor: AppColors.kLightElevated,
                                ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty)
                                return 'Email is required';
                              final ok = RegExp(
                                r'^[\w\.\-]+@[\w\.\-]+\.\w+$',
                              ).hasMatch(v.trim());
                              return ok ? null : 'Enter a valid email';
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            controller: _passwordCtrl,
                            obscureText: true,
                            style: const TextStyle(
                              color: AppColors.blackTextColor,
                            ),
                            decoration:
                                _decoration(
                                  'Password',
                                  icon: Icons.lock_outline,
                                ).copyWith(
                                  filled: true,
                                  fillColor: AppColors.kLightElevated,
                                ),
                            validator: (v) {
                              if (v == null || v.isEmpty)
                                return 'Password is required';
                              if (v.length < 6) return 'Minimum 6 characters';
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),

                          // Forgot password (optional)
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.kGrey,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                              ),
                              child: const Text('Forgot password?'),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Login button
                          CustomElevatedButton(
                            onTap: () {
                              Get.to(() => DashboardView());
                            },
                            text: "Login",
                          ),

                          const SizedBox(height: 16),

                          // Divider
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: const Color(0xFF2A3039),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'or',
                                  style: TextStyle(color: Color(0xFF9EA4AE)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: const Color(0xFF2A3039),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          // Footer: Signup
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(color: AppColors.kGrey),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // TODO: Navigate to signup
                                  Get.to(() => RegisterView());
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required Animation<double> fadeIn,
    required Animation<Offset> slideUpHeader,
  }) : _fadeIn = fadeIn,
       _slideUpHeader = slideUpHeader;

  final Animation<double> _fadeIn;
  final Animation<Offset> _slideUpHeader;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.35,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF2A0E10), // dark red tint
                    Color(0xFF3A1215),
                  ],
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Optional: background image (comment out if not needed)
                  Image.asset(AppImages.loginHeaderImage, fit: BoxFit.cover),
                  Container(color: AppColors.primary.withOpacity(0.22)),
                ],
              ),
            ),
          ),
          // Title
          Positioned(
            left: 20,
            bottom: 30,
            child: FadeTransition(
              opacity: _fadeIn,
              child: SlideTransition(
                position: _slideUpHeader,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  // Smooth, professional slanted curve (left deeper, right higher)
  @override
  Path getClip(Size size) {
    final path = Path();

    // Left edge down to ~50% height
    path.lineTo(0, size.height * 0.5);

    // Curved bottom edge towards right
    path.quadraticBezierTo(
      size.width *
          0.45, // control X (slightly left of center for a natural slope)
      size.height * 0.5, // control Y (push down to make a nice arc)
      size.width, // end X
      size.height * 0.70, // end Y (right side higher than left)
    );

    // Up the right edge and close
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
