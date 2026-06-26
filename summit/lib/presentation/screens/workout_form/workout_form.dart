import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:summit/core/theme/app_colors.dart';

class WorkoutFormValue {
  const WorkoutFormValue({
    required this.type,
    required this.date,
    required this.duration,
    this.notes,
  });

  final String type;
  final DateTime date;
  final int duration;
  final String? notes;
}

class WorkoutForm extends StatefulWidget {
  const WorkoutForm({
    super.key,
    required this.formKey,
    required this.onSubmit,
    required this.onCancel,
    required this.submitLabel,
    this.initialType = 'endurance',
    this.initialDate,
    this.initialDuration,
    this.initialNotes,
    this.trailingAction,
    this.isSaving = false,
  });

  final GlobalKey<FormState> formKey;
  final ValueChanged<WorkoutFormValue> onSubmit;
  final VoidCallback onCancel;
  final String submitLabel;
  final String initialType;
  final DateTime? initialDate;
  final int? initialDuration;
  final String? initialNotes;
  final Widget? trailingAction;
  final bool isSaving;

  @override
  State<WorkoutForm> createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  late String _type;
  late DateTime _date;
  late final TextEditingController _durationController;
  late final TextEditingController _notesController;

  static const _types = ['endurance', 'strength', 'running', 'cycling'];

  @override
  void initState() {
    super.initState();
    _type = widget.initialType;
    _date = widget.initialDate ?? DateTime.now();
    _durationController = TextEditingController(
      text: widget.initialDuration?.toString() ?? '',
    );
    _notesController = TextEditingController(text: widget.initialNotes ?? '');
  }

  @override
  void dispose() {
    _durationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DropdownButtonFormField<String>(
            value: _type,
            decoration: const InputDecoration(labelText: 'Workout type'),
            items: [
              for (final type in _types)
                DropdownMenuItem(
                  value: type,
                  child: Text(_formatType(type)),
                ),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Workout type is required';
              }
              return null;
            },
            onChanged: widget.isSaving
                ? null
                : (value) {
                    if (value != null) {
                      setState(() => _type = value);
                    }
                  },
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: widget.isSaving ? null : _pickDate,
            icon: const Icon(Icons.calendar_today_outlined),
            label: Text(DateFormat.yMMMd().format(_date)),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _durationController,
            enabled: !widget.isSaving,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Duration',
              suffixText: 'min',
            ),
            validator: (value) {
              final duration = int.tryParse(value ?? '');
              if (duration == null || duration <= 0) {
                return 'Duration must be greater than 0';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _notesController,
            enabled: !widget.isSaving,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Notes',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              if (widget.trailingAction != null) ...[
                widget.trailingAction!,
                const Spacer(),
              ] else
                const Spacer(),
              TextButton(
                onPressed: widget.isSaving ? null : widget.onCancel,
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 12),
              FilledButton(
                onPressed: widget.isSaving ? null : _submit,
                child: Text(widget.isSaving ? 'Saving...' : widget.submitLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.primary,
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _date = picked);
    }
  }

  void _submit() {
    if (!(widget.formKey.currentState?.validate() ?? false)) {
      return;
    }

    final notes = _notesController.text.trim();
    widget.onSubmit(
      WorkoutFormValue(
        type: _type,
        date: _date,
        duration: int.parse(_durationController.text),
        notes: notes.isEmpty ? null : notes,
      ),
    );
  }

  static String _formatType(String type) {
    return type[0].toUpperCase() + type.substring(1);
  }
}
