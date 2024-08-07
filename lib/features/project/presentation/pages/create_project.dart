import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/app/view/widgets/input_field.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:danapp_doit/features/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  final _descriptionController = TextEditingController();
  final _taskNameController = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime? endDate;

  String? startDateString;
  String? endDateDateString;

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
                    border: Border.all(color: AppColors.grey, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(AppAssets.backIcon),
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    TextBold(
                      'Create Project',
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                    const Gap(16),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            Image.asset(AppAssets.projectLargeIcon),
                            const Gap(15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRegular(
                                    'Task Name',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey1,
                                  ),
                                  SecondaryInputField(
                                    controller: _taskNameController,
                                    placeholder: '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(46),
                        Row(
                          children: [
                            dateContainer(
                              purpose: 'Created (from)',
                              onTap: () {
                                choseDate(
                                  dateTime: DateTime.now(),
                                  date: startDate,
                                  isStartDate: true,
                                );
                              },
                              dateText: startDateString ?? 'MM/DD/YYY',
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            dateContainer(
                              purpose: 'End (to)',
                              onTap: () {
                                if (startDateString == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Choose Start Date to proceed'),
                                    ),
                                  );
                                } else {
                                  choseDate(
                                    dateTime: startDate,
                                    date: endDate,
                                  );
                                }
                              },
                              dateText: endDateDateString ?? 'MM/DD/YYY',
                            ),
                          ],
                        ),
                        const Gap(24),
                        TextRegular(
                          'Add Staffs:',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey1,
                        ),
                        const Gap(10),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.grey1,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Stack(
                              children: [
                                Image.asset(AppAssets.assignUser1),
                                Positioned(
                                  left: 20,
                                  child: Image.asset(AppAssets.assignUser2),
                                ),
                                Positioned(
                                  left: 40,
                                  child: Image.asset(AppAssets.assignUser2),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    child: SvgPicture.asset(AppAssets.add),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(24),
                        TextRegular(
                          'Tags:',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey1,
                        ),
                        const Gap(10),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.grey1,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(AppAssets.tagUnion),
                                      TextRegular(
                                        'Design',
                                        color: AppColors.green2,
                                        textAlign: TextAlign.center,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(18),
                                GestureDetector(
                                  onTap: () {},
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(AppAssets.tagUnion2),
                                      TextRegular(
                                        'Front end',
                                        color: AppColors.orange,
                                        textAlign: TextAlign.center,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(18),
                                GestureDetector(
                                  onTap: () {},
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(AppAssets.tagUnion3),
                                      TextRegular(
                                        'Backend',
                                        color: AppColors.blue,
                                        textAlign: TextAlign.center,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(24),
                        TextRegular(
                          'Comment:',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey1,
                        ),
                        const Gap(7),
                        DescriptionInputField(
                          maxLines: 5,
                          controller: _descriptionController,
                          placeholder: '',
                        ),
                        const Gap(50),
                        BusyButton(
                          title: 'Create Project',
                          onpress: () {
                            Navigator.pushNamed(context, RouteName.allProjects);
                          },
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

  Future<void> choseDate({
    required DateTime dateTime,
    DateTime? date,
    bool isStartDate = false,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(dateTime.year, dateTime.month, dateTime.day),
      firstDate: isStartDate ? DateTime(2020, 10, 10) : startDate,
      lastDate: isStartDate
          ? DateTime(dateTime.year, dateTime.month, dateTime.day)
          : DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // ignore: deprecated_member_use
            useMaterial3: true,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // header background color
              onSurface: AppColors.black3, // body text color
            ),
            datePickerTheme: const DatePickerThemeData(
              surfaceTintColor: AppColors.white,
              headerBackgroundColor: AppColors.primaryColor,
              headerForegroundColor: AppColors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (isStartDate) {
      if (picked != null && picked != date) {
        setState(() {
          startDate = picked;
          startDateString = DateUtil.slashFormatDate(picked);
        });
      }
    } else {
      if (picked != null && picked != date) {
        setState(() {
          endDate = picked;
          endDateDateString = DateUtil.slashFormatDate(picked);
        });
      }
    }
  }
}
