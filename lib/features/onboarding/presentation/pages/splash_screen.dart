import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  Future<void> _pageSetup() async {
    final navigator = Navigator.of(context);

    // final userResult = await sl<GetUserUseCase>().call(
    //   const GetUserUseCaseParam(
    //     fromRemote: false,
    //   ),
    // );
    // request permission

    Future.delayed(
      const Duration(seconds: 2),
      () =>
          // userResult.fold((l) {
          navigator.pushReplacementNamed(
        RouteName.onboarding,
      )
      // }, (user) {
      //   BlocProvider.of<ChianUserBloc>(context).add(
      //     UserEvent.updated(user: user),
      //   );
      //   navigator.pushReplacementNamed(
      //     RouteName.welcomeBackView,
      //   );
      // }),
      ,
    );
  }

  @override
  void initState() {
    _pageSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     AppColors.containerGradient2,
            //     AppColors.containerGradient1,
            //   ],
            // ),
            ),
        child: Center(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.splashScreenImage),
                const Gap(12),
                SvgPicture.asset(AppAssets.doIt),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
