import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsBloc {
  final _newscontroller = StreamController<List<Map<String, dynamic>>>();
  Stream<List<Map<String, dynamic>>> get newscontroller =>
      _newscontroller.stream;

  void NewsData() async {
    final headers = {
      'X-API-KEY': '1d82f802a756b203772fba6518b70431bc31bfc1',
      'Content-Type': 'application/json'
    };

    final request =
        http.Request('POST', Uri.parse('https://google.serper.dev/news'));
    request.body = json.encode(
        {"q": "sağlıklı beslenme ve diyet", "gl": "tr", "hl": "tr", "page": 2});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responsedata = await response.stream.bytesToString();
      final decodedata = json.decode(responsedata);
      final newlist = decodedata['news'];

      _newscontroller.sink.add(List<Map<String, dynamic>>.from(newlist));
    } else {
      _newscontroller.addError(response.reasonPhrase.toString());
    }
  }

  void dispose() {
    _newscontroller.close();
  }
}
