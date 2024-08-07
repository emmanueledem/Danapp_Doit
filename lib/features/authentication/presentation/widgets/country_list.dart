import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';

class CountryList extends StatefulWidget {
  const CountryList({
    required this.callBack,
    super.key,
  });

  // ignore: inference_failure_on_function_return_type
  final Function(String) callBack;
  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final searchBanksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          decoration: const BoxDecoration(color: AppColors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    widget.callBack.call('ng');
                  },
                  child: Row(
                    children: [
                      TextRegular(
                        'Nigeria',
                        color: AppColors.black1,
                        fontSize: 10,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  color: AppColors.deactivatedColor,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    widget.callBack.call('gh');
                  },
                  child: Row(
                    children: [
                      TextRegular(
                        'Ghana',
                        color: AppColors.black1,
                        fontSize: 10,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  color: AppColors.deactivatedColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
