import 'dart:async';

import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/app/view/widgets/input_field.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:danapp_doit/features/authentication/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _mobileNumberFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  late StreamController<String> passwordStreamController;
  late StreamController<String> emailStreamController;
  late StreamController<String> mobileNumberStreamController;
  late StreamController<String> nameStreamController;

  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    validateStreams();
  }

  void validateStreams() {
    nameStreamController = StreamController<String>.broadcast();
    emailStreamController = StreamController<String>.broadcast();
    passwordStreamController = StreamController<String>.broadcast();
    mobileNumberStreamController = StreamController<String>.broadcast();

    _nameController.addListener(() {
      nameStreamController.sink.add(_nameController.text.trim());
      validateInputs();
    });

    _emailController.addListener(() {
      emailStreamController.sink.add(_emailController.text.trim());
      validateInputs();
    });

    _mobileNumberController.addListener(() {
      mobileNumberStreamController.sink
          .add(_mobileNumberController.text.trim());
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

    final nameError = CustomFormValidation.errorMessage(
      _passwordController.text.trim(),
      'name is required',
    );

    final emailError = CustomFormValidation.errorEmailMessage(
      _emailController.text.trim(),
      'email is required',
    );

    final mobileError = CustomFormValidation.errorMessage(
      _mobileNumberController.text.trim(),
      'Mobile Number is required',
    );

    if (passwordError != '' ||
        nameError != '' ||
        emailError != '' ||
        mobileError != '') {
      canSubmit = false;
    }
    _canSubmit.value = canSubmit;
  }

  @override
  void dispose() {
    super.dispose();
    passwordStreamController.close();
    emailStreamController.close();
    nameStreamController.close();
  }

  String? selectedCountry;

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
              const Gap(16),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    TextBold(
                      'Create\nAccount',
                      color: AppColors.textColor,
                    ),
                    const Gap(16),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Please fill the details below to\n',
                            style: TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontSize: 14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'create a',
                            style: TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontSize: 14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' DO-IT ',
                            style: TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'account',
                            style: TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontSize: 14,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    StreamBuilder<String>(
                      stream: nameStreamController.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: _nameController,
                          placeholder: 'Name',
                          validationMessage: CustomFormValidation.errorMessage(
                            snapshot.data,
                            'Name is required*',
                          ),
                          validationColor: CustomFormValidation.getColor(
                            snapshot.data,
                            _nameFocus,
                            CustomFormValidation.errorMessage(
                              snapshot.data,
                              'Name is required*',
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(15),
                    StreamBuilder<String>(
                      stream: emailStreamController.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: _emailController,
                          placeholder: 'Email',
                          validationMessage:
                              CustomFormValidation.errorEmailMessage(
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
                    const Gap(15),
                    StreamBuilder<String>(
                      stream: mobileNumberStreamController.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: _mobileNumberController,
                          placeholder: 'Mobile Number',
                          suffix: GestureDetector(
                            child: GestureDetector(
                              onTap: () {
                                // ignore: inference_failure_on_function_invocation
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return CountryList(
                                      callBack: (country) {
                                        setState(() {
                                          selectedCountry = country;
                                        });
                                      },
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  if (selectedCountry == 'gh')
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        AppAssets.flagGhana,
                                        height: 40,
                                        width: 35,
                                      ),
                                    )
                                  else
                                    selectedCountry == 'ng'
                                        ? Image.asset(AppAssets.flagNigeria)
                                        : Image.asset(AppAssets.flagNigeria),
                                  const Gap(4),
                                  SvgPicture.asset(AppAssets.arrowDown),
                                ],
                              ),
                            ),
                          ),
                          validationMessage: CustomFormValidation.errorMessage(
                            snapshot.data,
                            'Mobile Number is required*',
                          ),
                          validationColor: CustomFormValidation.getColor(
                            snapshot.data,
                            _mobileNumberFocus,
                            CustomFormValidation.errorMessage(
                              snapshot.data,
                              'Mobile Number is required*',
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(15),
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
                    const Gap(40),
                    ValueListenableBuilder(
                      valueListenable: _canSubmit,
                      builder: (
                        context,
                        canSubmit,
                        child,
                      ) {
                        return BusyButton(
                          title: 'Create account',
                          onpress: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.loginView,
                            );
                          },
                          deactivate: !canSubmit,
                          // loading: ,
                        );
                      },
                    ),
                    const Gap(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            bottom: 1, // Space between underline and text
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.grey1,
                                // Underline thickness
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: TextRegular(
                              'Privacy policy',
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
