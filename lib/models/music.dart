import 'package:joox_clone_app/repo/repository.dart';

//task
class Music {
  final int id;
  final String title;
  final String description;
  final String image;
  final String artist;

  Music(
      {required this.id,
      this.title = '',
      this.description = '',
      this.image = '',
      this.artist = ''});

  Music.fromModel(Model model)
      : id = model.id,
        title = model.data.containsKey('title') ? model.data['title'] : '',
        description = model.data.containsKey('description')
            ? model.data['description']
            : '',
        image = model.data.containsKey('image') ? model.data['image'] : '',
        artist = model.data.containsKey('artist') ? model.data['artist'] : '';

  Model toModel() {
    return Model(id: id, data: {
      'title': title,
      'description': description,
      'image': image,
      'artist': artist
    });
  }
}
