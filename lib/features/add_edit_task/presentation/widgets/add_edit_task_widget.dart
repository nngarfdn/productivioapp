import 'package:flutter/material.dart';

class AddEditTaskWidgets {
  // Input field for task title
  static Widget buildTitleField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: 'Task Title',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  // Input field for task description
  static Widget buildDescriptionField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: 'Task Description',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  // Dropdown for selecting priority
  static Widget buildPriorityDropdown({
    required String selectedPriority,
    required List<String> priorities,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: selectedPriority,
      items: priorities
          .map((priority) => DropdownMenuItem(
        value: priority,
        child: Text(priority),
      ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Priority',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
      ),
    );
  }

  // Date picker field
  static Widget buildDateField({
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: 'Select Date',
        labelText: 'Date',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  // Checkbox for marking completion status
  static Widget buildCompletionCheckbox({
    required bool isCompleted,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
          value: isCompleted,
          onChanged: onChanged,
        ),
        const Text('Mark as Completed',
            style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }

  // Save button
  static Widget buildSaveButton({
    required VoidCallback onSave,
  }) {
    return ElevatedButton(
      onPressed: onSave,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: const Text('Save Task'),
    );
  }

  // Cancel button
  static Widget buildCancelButton({
    required VoidCallback onCancel,
  }) {
    return OutlinedButton(
      onPressed: onCancel,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        side: const BorderSide(color: Colors.grey),
      ),
      child: const Text('Cancel'),
    );
  }
}
