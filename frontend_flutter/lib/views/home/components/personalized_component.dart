import 'package:flutter/material.dart';

import '../../personalize/personalize_page.dart';

List<String> monthList = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "July",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

List<String> dayList = ["Sun", "Mon", "Tue", "wed", "Thur", "Fri", "Sat"];

class PersonalizedComponent extends StatelessWidget {
  const PersonalizedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    int month = now.month;
    int day = now.day;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.03, bottom: size.height * 0.02),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PersonalizeScreen()));
          },
          child: Ink(
            height: size.height * 0.15,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: Text(
                    "Today",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: const Color.fromARGB(255, 67, 108, 49),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: SizedBox(
                    height: size.height * 0.15 * 0.35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.toString().padLeft(2, "0"),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.01),
                          child: Text(
                            ", ${monthList[month - 1]}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        VerticalDivider(
                          width: size.height * 0.15 * 0.6 * 0.1,
                          color: const Color.fromARGB(255, 67, 108, 49),
                          thickness: 2.0,
                          indent: 10.0,
                          endIndent: 5.0,
                        ),
                        Text(
                          dayList[day],
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
