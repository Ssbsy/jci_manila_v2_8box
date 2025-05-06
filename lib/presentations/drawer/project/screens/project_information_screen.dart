import 'package:flutter/material.dart';
import 'package:jci_manila_v2/app/widgets/widget_text.dart';

class ProjectInformationScreen extends StatelessWidget {
  const ProjectInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _items('Project Title', 'University of Leaders Orientation (ULO5)'),
            _items(
              'Project Description',
              'ULO5 will be conducted in AutoHub BGC in Nov. 22, 2022 and will start @ 6PM. We target a maximum of 50 applicants for this ULO and will have Sen Reggie and Pres Steve Baltao as guest speakers.',
            ),
            _items('Project Start', '11/10/22'),
            _items('Project end', '11/12/22'),
            _items('Project end', '11/12/22'),
            _items(
              'Overview/Background',
              'ULO5 will be conducted in AutoHub BGC in Nov. 22, 2022 and will start @ 6PM. We target a maximum of 50 applicants for this ULO and will have Sen Reggie and Pres Steve Baltao as guest speakers.',
            ),
            _items(
              'Objectives',
              "Invite/entice prospects to attend ULO and complete the process of becoming a JCI Manila Member.\n\n"
                  "Show prospects what JCI Manila is and what it does and who are their members.\n\n"
                  "Strictly enforce guidelines regarding attire and schedule",
            ),
            _items('Chairman', 'Marquez, Monico Ruben'),
            _items('Commissioner', 'Villaruz, Mark Vincent'),
            _items('Directorates', 'Membership Development and Engagement'),
            _items('BOD Status', 'For Approval'),
          ],
        ),
      ),
    );
  }

  Column _items(String title, String subTitle, {bool isBold = true}) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(title: title, isBold: isBold, size: 14),
        WidgetText(title: subTitle, maxLine: 50, isJustified: true),
      ],
    );
  }
}
