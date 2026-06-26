import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_colors.dart';
import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/data/repositories/workout_repository.dart';
import 'package:summit/presentation/screens/workout_form/workout_form.dart';

class EditWorkoutScreen extends StatefulWidget {
  const EditWorkoutScreen({
    super.key,
    required this.repository,
    required this.workout,
  });

  final WorkoutRepository repository;
  final Workout workout;

  @override
  State<EditWorkoutScreen> createState() => _EditWorkoutScreenState();
}

class _EditWorkoutScreenState extends State<EditWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Edit Workout')),
      body: WorkoutForm(
        formKey: _formKey,
        submitLabel: 'Save',
        initialType: widget.workout.type,
        initialDate: widget.workout.date,
        initialDuration: widget.workout.duration,
        initialNotes: widget.workout.notes,
        isSaving: _isSaving,
        trailingAction: TextButton.icon(
          onPressed: _isSaving ? null : _confirmDelete,
          icon: const Icon(Icons.delete_outline),
          label: const Text('Delete'),
        ),
        onCancel: () => Navigator.pop(context, false),
        onSubmit: _updateWorkout,
      ),
    );
  }

  Future<void> _updateWorkout(WorkoutFormValue value) async {
    setState(() => _isSaving = true);

    final updatedWorkout = widget.workout.copyWith(
      type: value.type,
      date: value.date,
      duration: value.duration,
      notes: Value(value.notes),
    );

    await widget.repository.updateWorkout(updatedWorkout);

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete workout?'),
          content: const Text('This workout will be permanently removed.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    setState(() => _isSaving = true);
    await widget.repository.deleteWorkout(widget.workout.id);

    if (mounted) {
      Navigator.pop(context, true);
    }
  }
}
