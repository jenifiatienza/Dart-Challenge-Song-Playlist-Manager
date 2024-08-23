import 'dart:math';

// Meet the Song class, where we keep all the fabulous details about each song!
class Song {
  String title;     // The name of the song
  String artist;    // Who's singing it
  int duration;     // How long the song is in seconds

  // Constructor to create a new Song with title, artist, and duration
  Song(this.title, this.artist, this.duration);

  // This method formats the song details nicely for display
  String displaySong() {
    int minutes = duration ~/ 60;  // Convert duration to minutes
    int seconds = duration % 60;  // Convert duration to seconds
    return '$title by $artist (${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')})';
  }
}

// Now, let's talk about the Playlist class, where we organize our amazing songs!
class Playlist {
  String name;      // The name of the playlist
  List<Song> songs = [];  // A list to store all the songs in the playlist

  // Constructor to create a new Playlist with a name
  Playlist(this.name);

  // Add a new song to the playlist
  void addSong(Song song) {
    songs.add(song);
  }

  // Show all songs in the playlist with their details
  void displayPlaylist() {
    print('Playlist: $name');
    songs.forEach((song) => print(song.displaySong()));
  }

  // Sort all the songs in the playlist by artist's name
  void sortSongsByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
  }
}

// Here's the MusicFestival class, where we put everything together for an awesome festival!
class MusicFestival {
  String name;            // The name of the music festival
  List<Playlist> stages = [];  // A list to store all the playlists (stages) in the festival

  // Constructor to create a new MusicFestival with a name
  MusicFestival(this.name);

  // Add a playlist to the festival
  void addStage(Playlist playlist) {
    stages.add(playlist);
  }

  // Show all the details about the festival
  void displayFestival() {
    print('Music Festival: $name');
    stages.forEach((stage) {
      stage.displayPlaylist();  // Show each playlist's songs
      print('---');
    });
  }

  // Calculate the total duration of all the songs in the festival
  int totalFestivalDuration() {
    int totalDuration = 0;
    stages.forEach((stage) {
      stage.songs.forEach((song) {
        totalDuration += song.duration;
      });
    });
    return totalDuration;
  }

  // Display a random song from each playlist for a fun surprise
  void displayRandomSongs() {
    print('Random Songs:');
    Random random = Random();
    stages.forEach((stage) {
      Song randomSong = stage.songs[random.nextInt(stage.songs.length)];
      print('${stage.name}: ${randomSong.displaySong()}');
    });
  }
}

void main() {
  print('Welcome to my Music Festival Playlist Manager! 🎶\n');

  // Create some super cool songs
  Song song1 = Song('Love Story', 'Taylor Swift', 230); // 03:50
  Song song2 = Song('Wannabe', 'Spice Girls', 210); // 03:30
  Song song3 = Song('Single Ladies', 'Beyoncé', 195); // 03:15
  Song song4 = Song('Bad Romance', 'Lady Gaga', 250); // 04:10
  Song song5 = Song('Girls Just Want to Have Fun', 'Cyndi Lauper', 220); // 03:40
  Song song6 = Song('Hollaback Girl', 'Gwen Stefani', 190); // 03:10
  Song song7 = Song('Material Girl', 'Madonna', 270); // 04:30

  // Create playlists with our amazing songs
  Playlist mainStage = Playlist('Main Stage');
  mainStage.addSong(song1);
  mainStage.addSong(song2);
  mainStage.addSong(song3);
  mainStage.addSong(song4);
  mainStage.addSong(song5);

  Playlist indieStage = Playlist('Indie Stage');
  indieStage.addSong(song6);
  indieStage.addSong(song4);
  indieStage.addSong(song1);

  Playlist electronicStage = Playlist('Electronic Stage');
  electronicStage.addSong(song7);
  electronicStage.addSong(song3);
  electronicStage.addSong(song2);

  // Create the festival and add all the stages (playlists)
  MusicFestival festival = MusicFestival('Big Music Fest');
  festival.addStage(mainStage);
  festival.addStage(indieStage);
  festival.addStage(electronicStage);

  // Show the total duration of the festival and some random songs for fun
  print('Total Festival Duration: ${festival.totalFestivalDuration()} seconds');
  print('');
  festival.displayRandomSongs();

  // Sort the main stage playlist by artist and display it
  mainStage.sortSongsByArtist();
  print('Main Stage playlist sorted by artist:');
  print('');
  mainStage.displayPlaylist();
}
