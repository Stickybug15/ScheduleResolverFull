import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'package:uuid/uuid.dart';

class ScheduleProvider extends ChangeNotifier{
    final List<TaskModel> _task = [];
    final Uuid _uuid = const Uuid();

    List<TaskModel> get task => _task;

    void addTask({
      required String title, required String category, required DateTime date,
      required TimeOfDay startTime, required TimeOfDay endTime,
      required int urgency, required int importance,
      required double estimatedEffortHours, required String energyLevel,
})
    {
      final newTask = TaskModel(
        id: _uuid.v4(),
        title: title,
        category: category,
        date: date,
        startTime: startTime,
        endTime: endTime,
        urgency: urgency,
        importance: importance,
        estimatedEffortHours: estimatedEffortHours,
        energyLevel: energyLevel,
      );
      _task.add(newTask);
      notifyListeners();
    }
    void removeTask(String id){
      _task.removeWhere((task) => task.id == id);
      notifyListeners();
    }

}