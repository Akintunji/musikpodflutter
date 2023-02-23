import 'dart:convert';
import 'package:http/http.dart' as http;
class Trendingclass extends StatelessWidget {

const API_URL = 'https://musikpod.com.ng/api/trending_songs';
  
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
   all_urls=jsonDecode(response.all_urls);
  all_songs=jsonDecode(response.songs);
   foreach(all_urls as all_url &&   all_songs as all_songs){
   Text( all_songs),
    Text(all_url),
   }

    } else {
      throw Exception('Failed to load songs');
    }
  }
}