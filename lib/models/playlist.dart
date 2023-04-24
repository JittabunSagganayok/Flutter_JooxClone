//plan

import 'package:joox_clone_app/models/music.dart';
import 'package:joox_clone_app/repo/repository.dart';

class Playlist {
  final int id;

  //playlistfor...
  String name = '';
  List<Music> musiclist = [];

  Playlist({required this.id, this.name = ''});

  Playlist.fromModel(Model model)
      : id = model.id,
        name = model.data.containsKey('name') ? model.data['name'] : '',
        musiclist = model.data.containsKey('musiclist')
            ? model.data['musiclist']
                    .map<Music>((music) => Music.fromModel(music))
                    .toList() ??
                <Music>[]
            : <Music>[];

  Model toModel() {
    return Model(id: id, data: {
      'name': name,
      'musiclist': musiclist.map((e) => e.toModel()).toList()
    });
  }

  // int get completeCount => tasks.where((element) => element.complete).length;

  // String get completenessMessage =>
  //     '$completeCount out of ${tasks.length} tasks';
}
