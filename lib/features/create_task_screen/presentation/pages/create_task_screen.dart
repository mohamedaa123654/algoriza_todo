import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/core/components/components.dart';
import 'package:todo_algoriza/features/create_task_screen/presentation/widgets/color_checkbox.dart';
import 'package:todo_algoriza/features/home/presentation/cubit/home_cubit.dart';
import 'package:todo_algoriza/features/home/presentation/pages/home.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/checkbox.dart';

import '../../../../core/util/color_manager.dart';
import '../cubit/task_screen_cubit.dart';
import '../widgets/appbar.dart';
import '../widgets/dropdown_button_form_field.dart';
import '../widgets/text_form_field.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  String? remind = '10 Minutes early';
  String? repeat = 'none';
  String? color = 'red';
  double width = 0;
  bool isred = false;
  bool blue = false;
  bool orange = false;
  bool yellow = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateTaskScreenCubit, CreateTaskScreenState>(
        listener: (BuildContext context, CreateTaskScreenState state) {
      if (state is AppInsertToDatabaseState) {
        navigateAndFinish(context, HomeScreen());
      }
    }, builder: (BuildContext context, CreateTaskScreenState state) {
      CreateTaskScreenCubit cubit = CreateTaskScreenCubit.get(context);
      return Scaffold(
        // backgroundColor: ColorManager.white,
        appBar: appBarDesign(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: addTaskForm(context, cubit),
            ),
          ),
        ),
      );
    });
  }

  Column addTaskForm(BuildContext context, CreateTaskScreenCubit cubit) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleTextFormField(),
        deadlineTextFormField(context),
        timeToEndTask(context),
        remindDropdownBotton(cubit),
        repeatDropdownButton(cubit),
        selectTaskColor(context),
        addNewTaskButton(context),
      ],
    );
  }

  Column titleTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        TextFormFieldTitle(title: 'Title'),
        const SizedBox(
          height: 8,
        ),
        DefaultFormField(
          controller: titleController,
          type: TextInputType.text,
          validate: (String? value) {
            if (value!.isEmpty) {
              return 'title should not be empty';
            }
          },
          hintText: 'title',
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  Column deadlineTextFormField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormFieldTitle(title: 'Deadline'),
        const SizedBox(
          height: 8,
        ),
        DefaultFormField(
          controller: deadlineController,
          type: TextInputType.datetime,
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2025-05-09'))
                .then((value) {
              deadlineController.text = DateFormat('yyyy-MM-dd').format(value!);
            });
          },
          validate: (String? value) {
            if (value!.isEmpty) {
              return 'You should select deadline';
            }
          },
          hintText: 'yyyy-MM-dd',
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  Column timeToEndTask(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: TextFormFieldTitle(title: 'Start Time')),
            const SizedBox(
              width: 24,
            ),
            Expanded(child: TextFormFieldTitle(title: 'End Time')),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: DefaultFormField(
                controller: startTimeController,
                type: TextInputType.datetime,
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    startTimeController.text =
                        value!.format(context).toString();
                  });
                },
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Select Start Time';
                  }
                },
                hintText: 'Start Time',
                suffix: Icons.access_time,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: DefaultFormField(
                controller: endTimeController,
                type: TextInputType.datetime,
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    endTimeController.text = value!.format(context).toString();
                  });
                },
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Select End Time';
                  }
                },
                hintText: 'End Time',
                suffix: Icons.access_time,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  Column remindDropdownBotton(CreateTaskScreenCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormFieldTitle(title: 'Remind'),
        const SizedBox(
          height: 8,
        ),
        DefualtDropdownButtonFormField(
            hint: 'remind',
            items: cubit.remindItems,
            onChanged: (value) {
              remind = value;
            }),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Column repeatDropdownButton(CreateTaskScreenCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormFieldTitle(title: 'Repeat'),
        const SizedBox(
          height: 8,
        ),
        DefualtDropdownButtonFormField(
            hint: 'repeat',
            items: cubit.repeatItems,
            onChanged: (value) {
              repeat = value;
              print(repeat);
            }),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Column selectTaskColor(context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormFieldTitle(title: 'Select Task Color'),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ColorCheckbox(
                isChecked: isred,
                onChange: () {
                  CreateTaskScreenCubit.get(context)
                      .emit(SelectColorOfTaskLoadingState());
                  color = 'red';
                  blue = false;
                  isred = true;
                  orange = false;
                  yellow = false;
                  CreateTaskScreenCubit.get(context)
                      .emit(SelectColorOfTaskState());
                },
                color: ColorManager.red),
            ColorCheckbox(
                isChecked: orange,
                onChange: () {
                  CreateTaskScreenCubit.get(context)
                      .emit(SelectColorOfTaskLoadingState());
                  color = 'orange';
                  blue = false;
                  isred = false;
                  orange = true;
                  yellow = false;
                  CreateTaskScreenCubit.get(context)
                      .emit(SelectColorOfTaskState());
                },
                color: ColorManager.orange),
            ColorCheckbox(
                isChecked: yellow,
                onChange: () {
                  CreateTaskScreenCubit.get(context)
                      .emit(SelectColorOfTaskLoadingState());
                  color = 'yellow';
                  blue = false;
                  isred = false;
                  orange = false;
                  yellow = true;
                  CreateTaskScreenCubit.get(context)
                      .emit(SelectColorOfTaskState());
                },
                color: ColorManager.yellow),
            ColorCheckbox(
                isChecked: blue,
                onChange: () {
                  CreateTaskScreenCubit.get(context)
                      .emit(SelectColorOfTaskLoadingState());
                  color = 'blue';
                  blue = true;
                  isred = false;
                  orange = false;
                  yellow = false;
                  CreateTaskScreenCubit.get(context)
                      .emit(SelectColorOfTaskState());
                },
                color: ColorManager.blue),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  DefaultButton addNewTaskButton(BuildContext context) {
    return DefaultButton(
        radius: 10,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            HomeCubit.get(context).insertToDatabase(
                title: titleController.text,
                date: deadlineController.text,
                startTime: startTimeController.text,
                endTime: endTimeController.text,
                remind: remind!,
                repeat: repeat!,
                color: color!);
          }
          navigateAndFinish(context, HomeScreen());
          Fluttertoast.showToast(
              msg: "Task Added successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        text: 'Create a Task');
  }
}
