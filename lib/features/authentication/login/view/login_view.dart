import 'package:driver_flutter/features/main/view/main_view.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/button.dart';
import 'package:driver_flutter/shared/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routePath = '/';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  bool isPasswordVisible = true;

  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;

  void closeKeyboard() {
    if (isKeyboardOpen) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: Scaffold(
        backgroundColor: AppColors.kBackground,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    child: Image.asset(
                      'assets/images/login.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Text(
                    'Login with phone number',
                    style: TextStyle(
                      color: AppColors.kColorBlack,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFieldForms(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    hintText: 'Phone number',
                  ),
                  const SizedBox(height: 20),
                  TextFieldForms(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Password',
                    obscureText: isPasswordVisible,
                    suffixIcon: isPasswordVisible
                        ? PhosphorIconsRegular.eyeSlash
                        : PhosphorIconsRegular.eye,
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  ButtonAction(
                    text: 'Login',
                    onPressed: () {
                      context.push(MainView.routePath);
                    },
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
