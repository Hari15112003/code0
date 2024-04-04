import 'package:carousel_slider/carousel_slider.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class KnowYourLaws extends StatefulWidget {
  const KnowYourLaws({super.key});

  @override
  State<KnowYourLaws> createState() => _KnowYourLawsState();
}

class _KnowYourLawsState extends State<KnowYourLaws> {
  List<String> rights = [
    "Right to equality",
    "Right to Freedom",
    "Right against exploitation:",
    "Right to freedom of religion",
    "Cultural and educational rights",
    "Right to constitutional remedies"
  ];

  List<String> equalityContent = [
    '''Article 14 of the Indian Constitution ensures that all people in India are treated fairly under the law. It means that no one can be unfairly favored or discriminated against by the government. For instance, if the government is giving out scholarships to help students, they can't choose who gets them based on their religion or where they were born.''',
    '''Article 15 in India's Constitution makes sure that nobody can be treated unfairly because of things like their religion, race, caste, gender, or where they were born. This rule applies to everyone, including the government and regular people. However, there are some situations where it's acceptable to have special rules to protect certain groups.''',
    '''Article 16 in India's Constitution ensures that everyone has an equal opportunity to get a government job. However, in some cases, the government can take special actions to help groups of people who have historically faced disadvantages. For instance, if a particular group, like people with disabilities, is not well-represented in government jobs, the government can create policies to make it easier for them to apply and get hired for those positions.''',
    '''Article 17 of India's Constitution firmly ends the unfair treatment of untouchability, and it makes it illegal with punishments. For instance, it means that no one can refuse to let someone from a different caste enter a public place like a temple or a school just because of their caste. If they do, they can be punished by the law.''',
    '''Article 18 of India's Constitution means the government can't give people fancy titles.They can only give awards for doing well in the military or academics. This is important because it ensures that everyone is treated fairly, and no one gets special titles just because of who they are. These rules help make sure that everyone in India is equal and treated the same way.''',
  ];

  List<String> freedomContent = [
    '''Article 19 to 22 of the Indian Constitution safeguard the Right to Freedom, which includes essential individual rights, along with some limitations that the State can impose under specific conditions. Article 19 grants six important freedoms, such as freedom of speech, assembly, association, movement within India, residence, and the practice of any profession. However, these freedoms can be restricted reasonably by the State, based on factors like national security, public order, and morality. For instance, while you have the freedom to express your opinions, you can't use speech to incite violence or hatred.''',
    '''Articles 20-22 further protect these freedoms. Article 20 ensures protection against certain legal convictions, like retroactive laws or being punished twice for the same offense. Article 22 specifies rights for arrested individuals, including the right to know why you were arrested, consult a lawyer, and be brought before a magistrate within 24 hours. For instance, if you are arrested, the police must inform you of the reasons for your arrest and ensure you have access to legal counsel.''',
    '''Moreover, Article 21 initially focused only on executive actions affecting life and personal liberty. Still, a landmark Supreme Court ruling in the case of Maneka Gandhi expanded its scope. It now encompasses various rights, such as the right to a fair trial, clean environment, and the right to live with dignity. This means that your life is not just about physical existence but also about living a meaningful and dignified life. For example, Article 21A, added by a constitutional amendment, guarantees the right to elementary education, ensuring that children have access to education for a better life.''',
  ];
  List<String> explorationContent = [
    '''Article 30 of the Indian Constitution safeguard the Right to Freedom, which includes essential individual rights, along with some limitations that the State can impose under specific conditions. Article 19 grants six important freedoms, such as freedom of speech, assembly, association, movement within India, residence, and the practice of any profession. However, these freedoms can be restricted reasonably by the State, based on factors like national security, public order, and morality. For instance, while you have the freedom to express your opinions, you can't use speech to incite violence or hatred.''',
    '''Article 13 in India's Constitution makes sure that nobody can be treated unfairly because of things like their religion, race, caste, gender, or where they were born. This rule applies to everyone, including the government and regular people. However, there are some situations where it's acceptable to have special rules to protect certain groups.''',
  ];
  List<String> religionContent = [
    '''Article 16 in India's Constitution ensures that everyone has an equal opportunity to get a government job. However, in some cases, the government can take special actions to help groups of people who have historically faced disadvantages. For instance, if a particular group, like people with disabilities, is not well-represented in government jobs, the government can create policies to make it easier for them to apply and get hired for those positions.''',
    '''Article 35 in India's Constitution makes sure that nobody can be treated unfairly because of things like their religion, race, caste, gender, or where they were born. This rule applies to everyone, including the government and regular people. However, there are some situations where it's acceptable to have special rules to protect certain groups.''',
    '''Article 34 of the Indian Constitution ensures that all people in India are treated fairly under the law. It means that no one can be unfairly favored or discriminated against by the government. For instance, if the government is giving out scholarships to help students, they can't choose who gets them based on their religion or where they were born.''',
  ];
  List<String> educationalContent = [
    '''Article 46 in India's Constitution ensures that everyone has an equal opportunity to get a government job. However, in some cases, the government can take special actions to help groups of people who have historically faced disadvantages. For instance, if a particular group, like people with disabilities, is not well-represented in government jobs, the government can create policies to make it easier for them to apply and get hired for those positions.''',
    '''Article 54 in India's Constitution makes sure that nobody can be treated unfairly because of things like their religion, race, caste, gender, or where they were born. This rule applies to everyone, including the government and regular people. However, there are some situations where it's acceptable to have special rules to protect certain groups.''',
  ];
  List<String> constitutionContent = [
    '''Article 16 in India's Constitution ensures that everyone has an equal opportunity to get a government job. However, in some cases, the government can take special actions to help groups of people who have historically faced disadvantages. For instance, if a particular group, like people with disabilities, is not well-represented in government jobs, the government can create policies to make it easier for them to apply and get hired for those positions.''',
    '''Article 15 in India's Constitution makes sure that nobody can be treated unfairly because of things like their religion, race, caste, gender, or where they were born. This rule applies to everyone, including the government and regular people. However, there are some situations where it's acceptable to have special rules to protect certain groups.''',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFF2F9),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopButton(
                  text: "Know Your Laws",
                ),
                Column(
                  children: [
                    header(text: rights.first),
                    const SizedBox(
                      height: 15,
                    ),
                    listview(
                      contents: equalityContent,
                      url:
                          "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExdXk1N2d3OGc2dGEwdHNoZ3g3dDN6eDZoMG8wa3AxZjV0MTJtc2s3MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/7bZjgwjr7KdynxZl3H/giphy.gif",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    header(text: rights[1]),
                    const SizedBox(
                      height: 15,
                    ),
                    listview(
                      contents: freedomContent,
                      url:
                          "https://media1.tenor.com/m/F4rTl5QwduEAAAAC/juneteenth-black-lives-matter.gif",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    header(text: rights[2]),
                    const SizedBox(
                      height: 15,
                    ),
                    listview(
                      contents: explorationContent,
                      url:
                          "https://media1.tenor.com/m/STbOmHs-RKUAAAAC/crispy-rule9-rule9.gif",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    header(text: rights[3]),
                    const SizedBox(
                      height: 15,
                    ),
                    listview(
                      contents: educationalContent,
                      url:
                          "https://media.tenor.com/3NU2fTGvA7oAAAAM/right-to-education-rich-to-education.gif",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    header(text: rights[3]),
                    const SizedBox(
                      height: 15,
                    ),
                    listview(
                      contents: constitutionContent,
                      url:
                          "https://media.tenor.com/TxZzvFX_RmkAAAAM/we-the-people-article-i-amend-the-fight-for-america.gif",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header({required String text}) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 3,
        // Space between underline and text
      ),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.blueAccent,
        width: 3.0,
      ))),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget listview({required List<String> contents, required String url}) {
    int current = 0;
    final CarouselController controller = CarouselController();
    return SizedBox(
      height: 450,
      child: Column(children: [
        CarouselSlider(
            carouselController: controller,
            items: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [Color(0xff92A3FD), Color(0xff9DCEFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Gif(
                        autostart: Autostart.loop,
                        image: NetworkImage(url),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Swipe to move",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 10.0, // shadow blur
                            color: Color.fromARGB(
                                255, 34, 97, 255), // shadow color
                            offset: Offset(
                                2.0, 2.0), // how much shadow will be shown
                          ),
                        ],
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 0.8,
                        height: 1.9,
                      ),
                    )
                  ],
                ),
              ),
              ...[
                for (var con in contents)
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Color(0xff92A3FD), Color(0xff9DCEFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Text(
                      con,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 10.0, // shadow blur
                            color: Color.fromARGB(
                                255, 116, 145, 217), // shadow color
                            offset: Offset(
                                2.0, 2.0), // how much shadow will be shown
                          ),
                        ],
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.8,
                        height: 1.9,
                      ),
                    ),
                  ),
              ],
            ],
            options: CarouselOptions(
              height: 400,
              // aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              },
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              aspectRatio: 0.74,
              initialPage: 0,
              // viewportFraction: 0.8,
              // initialPage: 0,
              // enableInfiniteScroll: true,
              // reverse: false,
              // // autoPlay: true,
              // autoPlayInterval: const Duration(seconds: 3),
              // autoPlayAnimationDuration: const Duration(milliseconds: 800),
              // autoPlayCurve: Curves.fastOutSlowIn,
              // enlargeCenterPage: true,
              // enlargeFactor: 0.3,
              // scrollDirection: Axis.horizontal,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: contents.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
