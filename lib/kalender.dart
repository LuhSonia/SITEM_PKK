import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kebaya_boutiq/tambah_catatan.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(Calendar()));
}

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kalender Kegiatan'),
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAdd()),
                );
              },
            ),
          ],
        ),
        body: CalendarView(),
      ),
    );
  }
}

class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, List<Event>> events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    events[DateTime.utc(2023, 9, 25)] = [
      Event('Event 1', 'Catatan 1', DateTime.utc(2023, 9, 25)),
      Event('Event 2', 'Catatan 2', DateTime.utc(2023, 9, 25)),
    ];
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildHeader(),
        _buildCalendar(),
        _buildEventList(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        DateFormat.yMMMM().format(_selectedDay),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      calendarFormat: _calendarFormat,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
          _selectedDay = selectedDay;
        });
      },
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
      eventLoader: (day) {
        return _getEventsForDay(day);
      },
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday) {
            final text = DateFormat.E().format(day);

            return Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          final hasEvent = events.containsKey(day);
          if (hasEvent) {
            return Stack(
              children: [
                Center(
                  child: Text(
                    DateFormat.d().format(day),
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: Icon(
                    Icons.circle,
                    size: 5,
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                DateFormat.d().format(day),
              ),
            );
          }
        },
      ),
    );
  }

  // ignore: unused_element
  void _addEvent(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController = TextEditingController();
        TextEditingController noteController = TextEditingController();
        DateTime eventDate = _selectedDay; // Tanggal saat ini
        return AlertDialog(
          title: Text('Tambah Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: noteController,
                decoration: InputDecoration(labelText: 'Catatan'),
              ),
              TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: _selectedDay,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      setState(() {
                        eventDate = selectedDate;
                      });
                    }
                  });
                },
                child: Text('Pilih Tanggal'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final newEvent = Event(
                      titleController.text, noteController.text, eventDate);
                  if (events[eventDate] != null) {
                    events[eventDate]!.add(newEvent);
                  } else {
                    events[eventDate] = [newEvent];
                  }
                  Navigator.of(context).pop();
                });
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _editEvent(Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController =
            TextEditingController(text: event.title);
        TextEditingController noteController =
            TextEditingController(text: event.note);
        DateTime eventDate = event.date;
        return AlertDialog(
          title: Text('Edit Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: noteController,
                decoration: InputDecoration(labelText: 'Catatan'),
              ),
              TextButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: eventDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                },
                child: Text('Pilih Tanggal'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final editedEvent = Event(
                      titleController.text, noteController.text, eventDate);
                  // untuk menghapus event lama
                  events[event.date]!.remove(event);
                  // untuk menambahkan event yang telah diedit
                  if (events[eventDate] != null) {
                    events[eventDate]!.add(editedEvent);
                  } else {
                    events[eventDate] = [editedEvent];
                  }
                  Navigator.of(context).pop();
                });
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _deleteEvent(Event event) {
    setState(() {
      events[event.date]!.remove(event);
    });
  }

  Widget _buildEventList() {
    final selectedEvents = _getEventsForDay(_selectedDay);
    return Expanded(
      child: ListView.builder(
        itemCount: selectedEvents.length,
        itemBuilder: (context, index) {
          final event = selectedEvents[index];
          return ListTile(
            title: Text(event.title),
            subtitle: Text(event.note),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editEvent(event);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteEvent(event);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Event {
  final String title;
  final String note;
  final DateTime date;

  Event(this.title, this.note, this.date);
}
