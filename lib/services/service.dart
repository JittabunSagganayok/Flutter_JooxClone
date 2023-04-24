import 'package:joox_clone_app/models/music.dart';
import 'package:joox_clone_app/models/playlist.dart';
import 'package:joox_clone_app/repo/memory.dart';
import 'package:joox_clone_app/repo/repository.dart';

class Playlistservice {
  final Repository _repository = Memory();

  //สร้าง playlist จาก name

  Playlist createNewPlaylist(String name) {
    final model = _repository.create();
    final playlist = Playlist.fromModel(model)..name = name;
    savePlaylist(playlist);

    return playlist;
  }

  void savePlaylist(Playlist playlist) {
    _repository.update(playlist.toModel());
  }

  // void deletePlan(Plan plan) {
  //   _repository.delete(plan.toModel());
  // }

  List<Playlist> getAllPlaylist() {
    return _repository.getAll().map((e) => Playlist.fromModel(e)).toList();
  }

  // void addTask(Plan plan, String description) {
  //   final id = (plan.tasks.isEmpty ? 0 : plan.tasks.last.id) + 1;
  //   final task = Task(id: id, description: description);
  //   plan.tasks.add(task);
  //   savePlan(plan);
  // }

  // deleteTask(Plan plan, Task task) {
  //   plan.tasks.remove(task);
  //   savePlan(plan);
  // }
}
