import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';
import 'package:legal_vehicle_recovery_managment_app/config/app_images.dart';
import 'package:legal_vehicle_recovery_managment_app/views/auth%20views/login_view.dart';
import 'package:legal_vehicle_recovery_managment_app/widgets/custom_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
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
            children: [
              // Header with curved bottom and subtle overlay
              // CustomHeader(fadeIn: _fadeIn, slideUpHeader: _slideUpHeader),
              Image.asset('assets/logo.png', height: 150),

              const Text(
                'Register to Continue ',
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
                          // Name
                          TextFormField(
                            controller: _nameCtrl,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: AppColors.blackTextColor,
                            ),
                            decoration: _decoration('Name', icon: Icons.person)
                                .copyWith(
                                  filled: true,
                                  fillColor: AppColors.kLightElevated,
                                ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty)
                                return 'Name is required';
                              final ok = RegExp(
                                r'^[\w\.\-]+@[\w\.\-]+\.\w+$',
                              ).hasMatch(v.trim());
                              return ok ? null : 'Enter a valid email';
                            },
                          ),
                          const SizedBox(height: 14),
                          // Phone Number
                          TextFormField(
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,

                            style: const TextStyle(
                              color: AppColors.blackTextColor,
                            ),
                            decoration: _decoration('Phone', icon: Icons.phone)
                                .copyWith(
                                  filled: true,
                                  fillColor: AppColors
                                      .kLightElevated, // or any color you want
                                ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty)
                                return 'Phone is required';
                              final ok = RegExp(
                                r'^[\w\.\-]+@[\w\.\-]+\.\w+$',
                              ).hasMatch(v.trim());
                              return ok ? null : 'Enter a valid email';
                            },
                          ),
                          const SizedBox(height: 14),
                          //
                          //Email
                          TextFormField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: AppColors.blackTextColor,
                            ),
                            decoration:
                                _decoration(
                                  'Email',
                                  icon: Icons.email_outlined,
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
                                  fillColor: AppColors
                                      .kLightElevated, // or any color you want
                                ),
                            validator: (v) {
                              if (v == null || v.isEmpty)
                                return 'Password is required';
                              if (v.length < 6) return 'Minimum 6 characters';
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: Text(
                              'Select Admin',
                              style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Drop Down for admin Selction
                          // Animated Dropdown
                          DropdownButtonFormField<String>(
                            initialValue: 'Admin 1',
                            decoration: _decoration("Select Admin").copyWith(
                              filled: true,
                              fillColor: AppColors.kLightElevated,
                            ),
                            dropdownColor: AppColors.kLightElevated,
                            items: const [
                              DropdownMenuItem(
                                value: "Admin 1",
                                child: Text(
                                  "Admin 1",
                                  style: TextStyle(
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Admin 2",
                                child: Text(
                                  "Admin 2",
                                  style: TextStyle(
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Admin 3",
                                child: Text(
                                  "Admin 3",
                                  style: TextStyle(
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                              ),
                            ],
                            // onChanged: (val) => setState(() => _selectedAdmin = val),
                            onChanged: (v) {},
                            validator: (v) => v == null
                                ? "Please select an Admin option"
                                : null,
                          ),

                          // Forgot password (optional)
                          const SizedBox(height: 10),
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: Text(
                              'Upload Images',
                              style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            spacing: 10,
                            children: [
                              ImageSelctionsContainers(text: "Upload Adhar"),
                              ImageSelctionsContainers(text: 'Upload Picture'),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Login button
                          CustomElevatedButton(onTap: () {}, text: "Register"),
                          const SizedBox(height: 16),

                          //
                          // Divider
                          Row(
                            children: [
                              Expanded(
                                child: Container(height: 1, color: Colors.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'or',
                                  style: TextStyle(color: Color(0xFF9EA4AE)),
                                ),
                              ),
                              Expanded(
                                child: Container(height: 1, color: Colors.grey),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          // Footer:
                          // Signup
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "ALready have an account? ",
                                style: TextStyle(color: AppColors.kGrey),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => LoginView());
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSelctionsContainers extends StatelessWidget {
  final String text;
  const ImageSelctionsContainers({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.kLightElevated,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: Colors.grey.withOpacity(0.2),

            onTap: () {},
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, color: Colors.grey),
                  Text(
                    text,
                    style: TextStyle(color: Color.fromARGB(255, 111, 111, 111)),
                  ),
                ],
              ),
            ),
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
                  'Register',
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
