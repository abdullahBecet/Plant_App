import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/details_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearcheBox(size: size),
          TitleAndMoreButton(title: 'Recomended',press: (){},),
          RecommendSingleCross(),
          TitleAndMoreButton(title: "Featured Plants", press: (){}),
          FeaturedPlants(),
          SizedBox(
            height: kDefaultPadding,
          ),
          
        ],
      ),
    );
  }
}

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeaturePlantCard(
            image: "assets/images/bottom_img_1.png",
            press: (){},
          ),
          FeaturePlantCard(
            image: "assets/images/bottom_img_2.png",
            press: (){},
          ),
        ],
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    super.key,
    required this.image,
    required this.press,
  });
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left:kDefaultPadding,
        top:kDefaultPadding/2,
        bottom:kDefaultPadding/2
      ),
      width: size.width*0.8,
      height: 185,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:DecorationImage(
          fit:BoxFit.cover,
          image: AssetImage(image),
        )
      ),
    );
  }
}

class RecommendSingleCross extends StatelessWidget {
  const RecommendSingleCross({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
            image: "assets/images/image_1.png",
            title:"Samanta",
            country: "Russia",
            price:400,
            press: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  DetailScreen(),)
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/image_2.png",
            title:"Angelica",
            country: "Polland",
            price:600,
            press: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen())
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/image_3.png",
            title:"Furkan",
            country: "Turkey",
            price:750,
            press: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen())
              );
            },
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    super.key, required this.image, required this.title, required this.country, required this.price, required this.press,
  });
  final String image,title,country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left:kDefaultPadding,
        top:kDefaultPadding/2,
        bottom:kDefaultPadding*2.5,
      ),
      width:size.width*0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap:(){},
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding/2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color:kPrimaryColor.withOpacity(0.23)
                  )
                ]
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button
                        ),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color:kPrimaryColor.withOpacity(0.5)
                          )
                        )
                      ]
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.button?.copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}




class TitleAndMoreButton extends StatelessWidget {
  const TitleAndMoreButton({
    super.key, required this.title, required this.press,
  });
  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomUnderLine(text: title,),
          Spacer(),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            color:kPrimaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  DetailScreen(),)
              );
            },
            child: Text('More',style: TextStyle(color:Colors.white),),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(padding:const EdgeInsets.only(left: kDefaultPadding/4),
          child: Text(
            text,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
          ),
          Positioned(
            bottom: 0,
            left:0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding/4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}






class HeaderWithSearcheBox extends StatelessWidget {
  const HeaderWithSearcheBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:kDefaultPadding*2.5),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding
            ),
            height: size.height * 0.2-27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              )
            ),
            child: Row(
              children: [
                Text(
                  'Hi Uishopy!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),
                Image.asset("assets/images/logo.png")
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23)
                )]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value){},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}