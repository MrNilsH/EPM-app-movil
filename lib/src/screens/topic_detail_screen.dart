import 'package:flutter/material.dart';
import 'package:appmovil_epmpolitecnico/src/models/RelatedTopic.dart';
import 'package:just_audio/just_audio.dart';

class TopicDetailScreen extends StatefulWidget {
  final RelatedTopic topic;

  TopicDetailScreen({required this.topic});

  @override
  _TopicDetailScreenState createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  late AudioPlayer _audioPlayer;
  int _currentAudioIndex = -1;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _setAudio(int index) async {
    try {
      await _audioPlayer.setAsset(widget.topic.audioPath![index]);
      print('Audio asset loaded: ${widget.topic.audioPath![index]}');
    } catch (error) {
      print('Error loading audio asset: $error');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topic.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF001528),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(widget.topic.icon, color: Colors.teal, size: 100),
                    SizedBox(width: 10),
                    Text(
                      widget.topic.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      widget.topic.longDescription,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Recomendación:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.teal[50],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        widget.topic.exercise,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              if (widget.topic.audioPath != null && widget.topic.audioPath!.isNotEmpty) ...[

                SizedBox(height: 10.0),
                Container(

                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Playlist para '+ widget.topic.title,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'A continuación, te dejamos una playlist para que realices tus ejercicios con más motivación y energía.',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Audios Disponibles:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.topic.audioPath!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.audiotrack, color: Colors.teal),
                              title: Text('Audio ${index + 1}'),
                              trailing: StreamBuilder<PlayerState>(
                                stream: _audioPlayer.playerStateStream,
                                builder: (context, snapshot) {
                                  final playerState = snapshot.data;
                                  final playing = playerState?.playing ?? false;
                                  final isCurrentAudio = index == _currentAudioIndex;

                                  if (!isCurrentAudio || !playing) {
                                    return IconButton(
                                      icon: Icon(Icons.play_arrow),
                                      onPressed: () {
                                        setState(() {
                                          _currentAudioIndex = index;
                                        });
                                        _setAudio(index);
                                        _audioPlayer.play();
                                      },
                                    );
                                  } else {
                                    return IconButton(
                                      icon: Icon(Icons.pause),
                                      onPressed: () {
                                        _audioPlayer.pause();
                                      },
                                    );
                                  }
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  _currentAudioIndex = index;
                                });
                                _setAudio(index);
                                _audioPlayer.play();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
