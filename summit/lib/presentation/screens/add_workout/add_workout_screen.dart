import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_colors.dart';
import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/domain/usecases/add_workout.dart';
import 'package:summit/presentation/screens/workout_form/workout_form.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({
    super.key,
    required this.addWorkout,
  });

  final AddWorkout addWorkout;

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Add Workout')),
      body: WorkoutForm(
        formKey: _formKey,
        submitLabel: 'Save',
        isSaving: _isSaving,
        onCancel: () => Navigator.pop(context, false),
        onSubmit: _saveWorkout,
      ),
    );
  }

  Future<void> _saveWorkout(WorkoutFormValue value) async {
    setState(() => _isSaving = true);

    await widget.addWorkout(
      WorkoutsCompanion.insert(
        userId: 1,
        date: value.date,
        duration: value.duration,
        type: value.type,
        notes: value.notes == null ? const Value.absent() : Value(value.notes),
      ),
    );

    if (mounted) {
      Navigator.pop(context, true);
    }
  }
}
