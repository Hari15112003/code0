import 'package:code0/pages/home/volunteer/volunteer_review.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';

class VolunteerAvailability extends StatelessWidget {
  const VolunteerAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const TopButton(text: "Check for Volunteer Availabilty"),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VolunteerReview()));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(228, 129, 72, 236)
                          .withOpacity(.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage("assets/images/avatar_image.png"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Harish",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "8 mins away from you [Available]",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 28,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
