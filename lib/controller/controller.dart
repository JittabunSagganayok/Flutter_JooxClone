import 'dart:developer';

import 'package:joox_clone_app/models/playlist.dart';
import 'package:joox_clone_app/services/service.dart';

class PlanController {
  final _service = Playlistservice();

  List<Playlist> get playlists => List.unmodifiable(_service.getAllPlaylist());

  // String _checkForDuplicates(Iterable<String> items, String text) {
  //   final duplicatedCount =
  //       items.where((element) => element.contains(text)).length;
  //   if (duplicatedCount > 0) {
  //     text += ' ${duplicatedCount + 1}';
  //   }
  //   return text;
  // }

  void addNewPlan(String name) {
    if (name.isEmpty) {
      return;
    }
    // name = _checkForDuplicates(plans.map((e) => e.name), name);
    _service.createNewPlaylist(name);
  }

  // void deletePlan(Plan plan) {
  //   _service.deletePlan(plan);
  // }

  void savePlan(Playlist plan) {
    _service.savePlaylist(plan);
  }

  // void createNewTask(Plan plan, [String? description]) {
  //   if (description == null || description.isEmpty) {
  //     description = 'New Task';
  //   }
  //   description =
  //       _checkForDuplicates(plan.tasks.map((e) => e.description), description);
  //   _service.addTask(plan, description);
  // }

  // void deleteTask(Plan plan, Task task) {
  //   _service.deleteTask(plan, task);
  // }
}
