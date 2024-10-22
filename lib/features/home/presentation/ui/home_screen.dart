import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/patterned_scaffold.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatternedScaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text('Home Screen'),
        ],
      ),
    );
  }
}
