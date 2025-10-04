import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key, this.title = 'Home Page'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

@RoutePage()
class PlaceholderPageSchedule extends StatelessWidget {
  const PlaceholderPageSchedule({super.key, this.title = 'Schedule Page'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

@RoutePage()
class PlaceholderPageAnnounce extends StatelessWidget {
  const PlaceholderPageAnnounce({super.key, this.title = 'Announces Page'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
