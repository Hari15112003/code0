import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VolunteerReview extends StatelessWidget {
  const VolunteerReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const TopButton(text: "Volunteer Reviews"),
              const CircleAvatar(
                radius: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Harish',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Call Him"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Top Reviews",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Anaadita",
                          style: TextStyle(
                            color: Colors.purple.withOpacity(.8),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingBar.builder(
                          itemSize: 25,
                          ignoreGestures: true,
                          initialRating: 4,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    const Text(
                      '''" He was very helpful and punctual . I felt safe with him and did n't work about unwanted action" ''',
                      style: TextStyle(
                        color: Color.fromARGB(255, 94, 93, 93),
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
