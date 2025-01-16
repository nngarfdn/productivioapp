import 'package:flutter/material.dart';
import '../widgets/add_edit_task_widget.dart';

class AddEditTaskPage extends StatelessWidget {
  const AddEditTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: "Sample Task Title");
    final descriptionController = TextEditingController(text: "Sample Task Description");
    final dateController = TextEditingController(text: "2025-01-16");
    final selectedPriority = 'Medium';
    final isCompleted = false;
    final priorities = ['Low', 'Medium', 'High'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddEditTaskWidgets.buildTitleField(
              controller: titleController,
              hintText: 'Enter task title',
            ),
            const SizedBox(height: 16.0),
            AddEditTaskWidgets.buildDescriptionField(
              controller: descriptionController,
              hintText: 'Enter task description',
            ),
            const SizedBox(height: 16.0),
            AddEditTaskWidgets.buildPriorityDropdown(
              selectedPriority: selectedPriority,
              priorities: priorities,
              onChanged: (value) {
                // Handle priority change here
              },
            ),
            const SizedBox(height: 16.0),
            AddEditTaskWidgets.buildDateField(
              controller: dateController,
              onTap: () {
                // Handle date selection here
              },
            ),
            const SizedBox(height: 16.0),
            AddEditTaskWidgets.buildCompletionCheckbox(
              isCompleted: isCompleted,
              onChanged: (value) {
                // Handle completion status change here
              },
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AddEditTaskWidgets.buildCancelButton(
                    onCancel: () {
                      // Handle cancel action here
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: AddEditTaskWidgets.buildSaveButton(
                    onSave: () {
                      // Handle save action here
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
