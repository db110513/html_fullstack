import 'package:path/path.dart';
import 'exports.dart';
import 'package:http/http.dart' as http;

class Event {

  String name;
  String desc;
  String eventDate;
  String pic;
  int price;
  List<String> events;

  Event({
    required this.name,
    required this.desc,
    required this.eventDate,
    required this.pic,
    required this.price,
    required this.events,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    name: json["name"],
    desc: json["desc"],
    eventDate: json["eventDate"],
    pic: json["pic"],
    price: json["price"],
    events: List<String>.from(json["events"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": name,
    "description": desc,
    "eventDate": eventDate,
    "pic": pic,
    "price": price,
    "images": List<dynamic>.from(events.map((x) => x)),
  };
}

Future<Object> fetchEvents() async {

  final response = await http.get(Uri.parse('localhost:3007/events'));

  if (response.statusCode == 200) {
    final List list = json.decode(response.body);
    return list.map((e) => Event.fromJson(e)).toList();
  }

  else {
    throw Exception('Failed to load the data');
  }

}

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {

  late Future<Event> futureEvent;

  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
      backgroundColor: Colors.green[500],

      appBar: AppBar(
          centerTitle: true,
          title: const Text('Listado Eventos', style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.green[900],
        ),

      body: Center(
        child: FutureBuilder<Event>(
          future: futureEvent,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),

     /* body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),

            )



            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: 'GET',
                backgroundColor: Colors.green[900],
                onPressed: null,
                child: const Text('GET', style: TextStyle(fontSize: 15)),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                heroTag: 'BACK',
                backgroundColor: Colors.green[900],
                onPressed: backHome,
                child: const Text('BACK', style: TextStyle(fontSize: 15)),
              ),
            ),
          ),
        ],
      )**/

    ),

    ));

}

void backHome() {
  Navigator.pushNamed(context as BuildContext, 'backHome');
}



