import 'dart:async';

import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/app/view/widgets/input_field.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:logger/web.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late StreamController<String> passwordStreamController;
  late StreamController<String> emailStreamController;

  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    validateStreams();
  }

  void validateStreams() {
    emailStreamController = StreamController<String>.broadcast();
    passwordStreamController = StreamController<String>.broadcast();

    _emailController.addListener(() {
      emailStreamController.sink.add(_emailController.text.trim());
      validateInputs();
    });
    _passwordController.addListener(() {
      passwordStreamController.sink.add(_passwordController.text.trim());
      validateInputs();
    });
  }

  void validateInputs() {
    var canSubmit = true;

    final passwordError = CustomFormValidation.errorMessagePasswordCreation(
      _passwordController.text.trim(),
      'Password is required',
    );

    final emailError = CustomFormValidation.errorEmailMessage(
      _emailController.text.trim(),
      'email is required',
    );

    if (passwordError != '' || emailError != '') {
      canSubmit = false;
    }
    Logger().d(canSubmit);
    _canSubmit.value = canSubmit;
  }

  @override
  void dispose() {
    super.dispose();
    passwordStreamController.close();
    emailStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(AppAssets.backIcon),
                  ),
                ),
              ),
              const Gap(99),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SvgPicture.asset(AppAssets.multiColorDots),
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(AppAssets.doIt),
                      const SizedBox(
                        height: 10,
                      ),
                      SvgPicture.asset(AppAssets.belowIconLine),
                    ],
                  ),
                ],
              ),
              const Gap(22),
              Center(
                child: TextBold(
                  'Welcome Back !',
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
              ),
              const Gap(36),
              StreamBuilder<String>(
                stream: emailStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    controller: _emailController,
                    placeholder: 'Email',
                    validationMessage: CustomFormValidation.errorEmailMessage(
                      snapshot.data,
                      'Email is required*',
                    ),
                    validationColor: CustomFormValidation.getColor(
                      snapshot.data,
                      _emailFocus,
                      CustomFormValidation.errorEmailMessage(
                        snapshot.data,
                        'Email is required*',
                      ),
                    ),
                  );
                },
              ),
              const Gap(16),
              StreamBuilder<String>(
                stream: passwordStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    password: true,
                    controller: _passwordController,
                    placeholder: 'Password',
                    validationMessage:
                        CustomFormValidation.errorMessagePasswordCreation(
                      snapshot.data,
                      'Password is required*',
                    ),
                    validationColor: CustomFormValidation.getColor(
                      snapshot.data,
                      _passwordFocus,
                      CustomFormValidation.errorMessagePasswordCreation(
                        snapshot.data,
                        'Password is required*',
                      ),
                    ),
                  );
                },
              ),
              TextRegular(
                'Forgot Password?',
                fontSize: 12,
                color: AppColors.grey2,
              ),
              const Gap(100),
              Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: _canSubmit,
                      builder: (
                        context,
                        canSubmit,
                        child,
                      ) {
                        return BusyButton(
                          title: 'Sign in',
                          onpress: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.appTabView,
                            );
                          },
                          deactivate: !canSubmit,
                          // loading: ,
                        );
                      },
                    ),
                  ),
                  const Gap(16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      border: Border.all(color: AppColors.blue),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 14,
                      ),
                      child: SvgPicture.asset(AppAssets.biometric),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextRegular(
                    'Don’t have an account?',
                    fontSize: 12,
                  ),
                  const Gap(6),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.createAccount);
                    },
                    child: TextRegular(
                      'Create Account',
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
