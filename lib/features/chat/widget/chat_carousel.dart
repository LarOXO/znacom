import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ChatCarousel extends StatelessWidget {
  const ChatCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Transform.rotate(
                            angle: 0.1,
                            child: SizedBox(
                              width: 100,
                              height: 150,
                              child: Image.asset(
                                'assets/profile.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              const Text(
                                'Ждет твоего ответа',
                                style: TextStyle(fontSize: 14.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const Text(
                                'Привет дорогая, как дела?',
                                style: TextStyle(fontSize: 12.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const Text(
                                'Москва (Флаг) недавно онлайн',
                                style: TextStyle(fontSize: 12.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Image.asset('assets/icon/glass.png'),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'ОТВЕТИТЬ',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        height: 150,
      ),
    );
  }
}
