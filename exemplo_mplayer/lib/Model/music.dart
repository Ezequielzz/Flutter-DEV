class Music{
  final String title;
  final String artist;
  final String url;

  //costrutor
  Music({required this.title, required this.artist, required this.url});

  //fromMap
  factory Music.fromMap(Map<String, dynamic> map){
    return Music(
      title: map['title'],
      artist: map['artist'],
      url: map['url'],
    );
  }
  
}