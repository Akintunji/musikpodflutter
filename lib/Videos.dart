class Videoclass extends StatelessWidget {

const API_URL = 'https://musikpod.com.ng/api/Video_songs';
  Future<List> fetchSongs() async {

    final response = await http.get(API_URL);
    if (response.statusCode == 200) {
    Songs=jsonDecode(response.songsurl);
   Songname=jsonDecode(response.songname);

    } else {
      throw Exception('Failed to load songs');
    }
  }
}

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Musikpod'),
      ), 
      body: Container(
          color: Colors.#307D7E,
          padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[]
          //video  comes here
          ),
      ),
           
    )
 },
