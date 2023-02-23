
class All_audio class extends StatelessWidget {

const API_URL = 'https://musikpod.com.ng/api/songs';
  
  @override



  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musikpod',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Musikpod'),
        ),
        body: FutureBuilder(
          future: fetchSongs(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    subtitle: Text(snapshot.data[index]['url']),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List> fetchSongs() async {
    final response = await http.get(API_URL);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception('Failed to load songs');
    }
  }
}