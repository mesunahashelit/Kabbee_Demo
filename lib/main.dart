import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final quizBackground = const Color(0xFF004D40);
  final quizIconColor = const Color(0xFF76FF03);
  final articleBackground = const Color(0XFF2D365C);
  final articleIconColor = const Color(0xFF448AFF);
  final kidsBackground = const Color(0XFF8D6E63);
  final kidsIconColor = const Color(0xFFFFEA00);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Returns an Expanded Flat button for the services
    Expanded makeService(
        String serviceName, IconData icon, Color bg, Color iconColor) {
      return Expanded(
        child: TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(bg)),
          onPressed: () {
            print('$serviceName pressed');
            runApp(const ArticlesApp());
          },
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            height: 115,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 45,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  serviceName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey 👋',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Mesuna',
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                    TextSpan(
                      text: 'K',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade700),
                    ),
                    const TextSpan(
                      text: 'abbee',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '+',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade700),
                    )
                  ])),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Select a service to continue',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.normal,
                  wordSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  makeService('Movies', Icons.video_collection_sharp,
                      Colors.brown.shade900, Colors.red.shade400),
                  const SizedBox(
                    width: 15,
                  ),
                  makeService('Quiz', Icons.videogame_asset, quizBackground,
                      quizIconColor),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  makeService('Articles', Icons.article_outlined,
                      articleBackground, articleIconColor),
                  const SizedBox(
                    width: 15,
                  ),
                  makeService(
                      'Kids', Icons.toys, kidsBackground, kidsIconColor),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class ArticlesApp extends StatelessWidget {
  const ArticlesApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Categories Card
    TextButton makeCategory(String category, IconData icon) {
      return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade900)),
        onPressed: () {
          //TODO: To be updated later
          print('$category pressed');
        },
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey,
                size: 25,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                category,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
    }

    //Recent Articles Card

    TextButton recentArticleCard(
        String title, String author, String url, int views) {
      return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade900)),
        onPressed: () {
          //TODO: To be updated later
          print('$title pressed');
        },
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          height: 100,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    height: 100,
                    width: 90,
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.grey.shade600,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            author,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey.shade400,
                                size: 25,
                              ),
                              Text(
                                ' $views',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.amber.shade700,
                    size: 25,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    // Article Card for the central section
    TextButton makeArticleCard(
        String title, String author, String url, int likes, int views) {
      return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade900)),
        onPressed: () {
          //TODO: To be updated later
          print('$title pressed');
        },
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: 250,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    height: 145,
                    width: 250,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.grey.shade600,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        author,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.amber.shade700,
                        size: 25,
                      ),
                      Text(
                        ' $likes',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey.shade400,
                        size: 25,
                      ),
                      Text(
                        ' $views',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      print('Bookmark pressed');
                    },
                    child: Icon(
                      Icons.bookmark_border_rounded,
                      color: Colors.amber.shade700,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      print('Profile pressed');
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.amber.shade700,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('./images/profile.jpg'),
                        radius: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'K',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber.shade700),
                        ),
                        const TextSpan(
                          text: 'abbee',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '+',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber.shade700),
                        ),
                        const TextSpan(
                          text: '  Articles',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print('View all pressed');
                        },
                        child: Text(
                          'View all',
                          style: TextStyle(
                            color: Colors.amber.shade700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 45.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeCategory('Education', Icons.menu_book_sharp),
                        const SizedBox(
                          width: 10,
                        ),
                        makeCategory('Health', Icons.medical_services),
                        const SizedBox(
                          width: 10,
                        ),
                        makeCategory('Technology', Icons.biotech_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        makeCategory('News', Icons.newspaper_sharp),
                        const SizedBox(
                          width: 10,
                        ),
                        makeCategory('Food', Icons.fastfood_rounded),
                        const SizedBox(
                          width: 10,
                        ),
                        makeCategory(
                            'Travel', Icons.airplanemode_active_outlined),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeArticleCard(
                            'Shrek DreamWorks',
                            'Shrek',
                            'https://i.guim.co.uk/img/media/7772ef36c135be1d5af9520e645d04b37264951b/0_2_2048_1230/master/2048.jpg?width=700&quality=85&auto=format&fit=max&s=a174091ee5bab880750bef98bd750fcb',
                            67,
                            45),
                        const SizedBox(
                          width: 10,
                        ),
                        makeArticleCard(
                            'ራኢ',
                            'ዘይተፈልጠ',
                            'https://slp-statics.astockcdn.net/static_assets/staging/23winter/home/curated-collections/card-1.jpg?width=580',
                            67,
                            45),
                        const SizedBox(
                          width: 10,
                        ),
                        makeArticleCard(
                            'እታ መንዲል መን ውሒጥዋ',
                            'መሱና',
                            'https://res.cloudinary.com/wolfandbadger/image/upload/s--eFLTLo7E--/q_auto:eco/products/jkzpljfeojztrgpfxxoo',
                            13,
                            39),
                        const SizedBox(
                          width: 10,
                        ),
                        makeArticleCard(
                            'ወግዒ ኣያታትና',
                            'ዘርኣብሩኽ',
                            'https://i.pinimg.com/originals/c6/c5/99/c6c59908f5bd7c4b0b81145b7f47f953.jpg',
                            50,
                            17),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent articles',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print('View all Pressed');
                        },
                        child: Text(
                          'View all',
                          style: TextStyle(
                            color: Colors.amber.shade700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    recentArticleCard(
                        'First Story title',
                        'John',
                        'https://eadn-wc04-796033.nxedge.io/cdn/wp-content/uploads/home-banner-2-2-e1646713448525.jpg',
                        23),
                    const SizedBox(
                      height: 5,
                    ),
                    recentArticleCard(
                        'Second Story title',
                        'John',
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images/artworkimages/mediumlarge/1/the-eritrean-girl-dorothy-boyer.jpg',
                        11),
                    const SizedBox(
                      height: 5,
                    ),
                    recentArticleCard(
                        'Third Story title',
                        'John',
                        'https://www.artmajeur.com/medias/standard/l/a/latrachepastel/artwork/6954667_ethiopienne.jpg',
                        19),
                    const SizedBox(
                      height: 5,
                    ),
                    recentArticleCard(
                        'Fourth Story title',
                        'John',
                        'https://media.istockphoto.com/id/1143094520/photo/local-villagers-and-customers-in-keren-market-eritrea.jpg?s=612x612&w=0&k=20&c=2dx2aoawMlMn-zWiLhoB1jfgcUBi3fXdHpZHHjbHd-c=',
                        43),
                    const SizedBox(
                      height: 5,
                    ),
                    recentArticleCard(
                        'Fifth Story title',
                        'John',
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-s/01/61/6c/8b/giro-fiori-people-coming.jpg?w=600&h=-1&s=1',
                        03),
                    const SizedBox(
                      height: 5,
                    ),
                    recentArticleCard(
                        'Sixth Story title',
                        'John',
                        'https://i.pinimg.com/originals/c6/c5/99/c6c59908f5bd7c4b0b81145b7f47f953.jpg',
                        29),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
