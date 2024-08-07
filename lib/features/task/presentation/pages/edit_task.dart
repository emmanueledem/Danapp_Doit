import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/app/view/widgets/input_field.dart';
import 'package:danapp_doit/core/core.dart';
import 'package:danapp_doit/features/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EditTask extends StatefulWidget {
  const EditTask({required this.params, super.key});
  final EditTaskParams params;
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _descriptionController = TextEditingController();
  final _taskNameController = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime? endDate;

  String? startDateString;
  String? endDateDateString;

  @override
  void initState() {
    prepareForm();
    super.initState();
  }

  void prepareForm() {
    _descriptionController.text = widget.params.tagDescription;
    startDateString = widget.params.startDate;
    endDateDateString = widget.params.endDate;
    _taskNameController.text = widget.params.tagName;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  PopupMenuButton(
                    constraints: const BoxConstraints(
                      minWidth: 230,
                      maxWidth: 230,
                    ),
                    color: AppColors.white,
                    surfaceTintColor: AppColors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Icon(Icons.more_vert_rounded),
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            top: 16,
                            bottom: 31,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextRegular(
                                    'Progress %',
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey6,
                                  ),
                                  SvgPicture.asset(
                                    AppAssets.progessIcon,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '10%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '20%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '30%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '40%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '50%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '60%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '70%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '80%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.grey7,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextRegular(
                                '90%',
                                color: AppColors.grey6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Clear_All',
                        onTap: () async {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextRegular(
                              '100%',
                              color: AppColors.grey6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(12),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    TextBold(
                      'Edit task',
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                    const Gap(16),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                        const Gap(24),
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
                          'Assign Task:',
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
                          title: 'Save',
                          onpress: () {
                            Navigator.pop(context);
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

class EditTaskParams {
  EditTaskParams({
    required this.startDate,
    required this.endDate,
    required this.tagName,
    required this.tagDescription,
  });

  final String startDate;
  final String endDate;
  final String tagName;
  final String tagDescription;
}
