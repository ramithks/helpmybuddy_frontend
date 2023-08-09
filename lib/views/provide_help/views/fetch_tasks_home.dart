import 'package:flutter/material.dart';
import 'package:helpmybuddy_frontend/views/provide_help/components/task_card.dart';

class FetchTasksHome extends StatelessWidget {
  const FetchTasksHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TaskCard(),
            TaskCard(),
            TaskCard(),
            TaskCard(),
          ],
        ),
      ),
    );
  }

  
}
