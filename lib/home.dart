import 'package:actionfigure_app/addEditProduct.dart';
import 'package:actionfigure_app/services/product_model.dart';
import 'package:actionfigure_app/services/product_provider.dart';
import 'package:actionfigure_app/ui/box_products.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:actionfigure_app/ui/tile_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              'Welcome,\n User',
              style: whiteTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Spacer(),
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/photo1.jpg'),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget banner() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorder),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/banner3.jpg'),
          ),
        ),
      );
    }

    Widget popularProducts1() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              BoxProducts(
                produk: ProductModel(
                    id: 5,
                    name:
                        'Sketchbook Challenge : Over 250 Drawing Exercises to Unleash Your Creativity',
                    author: 'Molly Egan',
                    price: '35',
                    description:
                        'Many people would love to learn to draw for pleasure, but dont know where to start. Being faced with a blank page can be daunting - even for a professional artist. In Sketchbook Challenge, illustrator Molly Egan shares prompts and ideas to get you started, encouraging risk-taking and experimentation.',
                    image:
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2022-01/9781914317040.jpg?itok=a6jvOQqp'),
              ),
              BoxProducts(
                produk: ProductModel(
                    id: 5,
                    name:
                        'Fantastic Beasts and Where to Find Them: The Original Screenplay',
                    author: 'J.K. Rowling',
                    price: '45',
                    description:
                        'Inspired by the original Hogwarts textbook by Newt Scamander, Fantastic Beasts and Where to Find Them: The Original screenplay marks the screenwriting debut of J.K. Rowling, author of the beloved and internationally bestselling Harry Potter books. A feat of imagination and featuring a cast of remarkable characters and magical creatures, this is epic adventure-packed storytelling at its very best. Whether an existing fan or new to the wizarding world, this is a perfect addition for any film lover or readers bookshelf.',
                    image:
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2019-03/9781408708989.jpg?itok=Jue3P894'),
              ),
              BoxProducts(
                produk: ProductModel(
                    id: 5,
                    name: 'Harry Potter And The Prisoner of Azkaban',
                    author: 'J.K. Rowling',
                    price: '50',
                    description:
                        'When the Knight Bus crashes through the darkness and screeches to a halt in front of him, its the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run - and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harrys tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss...',
                    image:
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2019-03/9781408855676.jpg?itok=ZW4LtB_X'),
              ),
              BoxProducts(
                produk: ProductModel(
                    id: 5,
                    name: 'Beautiful World Where Are You',
                    author: 'Sally Rooney',
                    price: '50',
                    description:
                        "Alice, a novelist, meets Felix, who works in a warehouse, and asks him if he'd like to travel to Rome with her. In Dublin, her best friend Eileen is getting over a break-up and slips back into flirting with Simon, a man she has known since childhood. Alice, Felix, Eileen and Simon are still young - but life is catching up with them",
                    image:
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2022-07/9780571365449.jpg?itok=K5uZlJG7'),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProducts2() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              BoxProducts(
                produk: ProductModel(
                    id: 5,
                    name:
                        'Sherlock Holmes Mind Palace Puzzles : Master Sherlocks Memory Techniques To Help Solve 100 Cases',
                    author: 'Tim Dedopulos',
                    price: '50',
                    description:
                        'In Sherlock Holmes Mind Palace Puzzles, Dr John Watson shares the great detectives memory-boosting techniques to help you start to think the Sherlock way. As you work your way through Watsons latest selection of his esteemed colleagues cases, Sherlock shares his knowledge of how the human brain works, meaning that you will find your memory skills improving until you too can create your very own Mind Palace!',
                    image:
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2022-01/9781787395534.jpg?itok=P_S6v5b2'),
              ),
              BoxProducts(
                produk: ProductModel(
                    id: 5,
                    name:
                        'Growing Up : A Modern Memory Book for the School Years',
                    author: 'Korie Herold',
                    price: '40',
                    description:
                        'Growing Up- A Modern Memory Book for School Years features gender-neutral artwork and space to record precious memories from each year of your childs schooling so you can one day gift to your grown child.',
                    image:
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc180x180/public/products/2022-07/9781944515966.jpg?itok=oEceeuT0'),
              ),
              BoxProducts(
                produk: ProductModel(
                    id: 5,
                    name: 'THE FAMILY CORLEONE',
                    author: 'Ed Falco',
                    price: '35',
                    description:
                        'An exhilarating and profound novel of tradition and violence and of loyalty and betrayal, The Family Corleone will appeal to the legions of fans who can never get enough of The Godfather. New York, 1933: The city and the nation are in the depths of the Great Depression. The crime families of New York have prospered in this time, but with the coming end of Prohibition, a battle is looming that will determine which organizations will rise and which will face a violent end. For Vito Corleone, nothing is more important that his familys future. ',
                    image:
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2020-04/9780446574631.jpg?itok=U3j-l4ZG'),
              ),
              BoxProducts(
                produk: ProductModel(
                    id: 5,
                    name:
                        'Rebel Crafts : 15 Craftivism Projects to Change the World',
                    author: 'Hester van Overbeek',
                    price: '25',
                    description:
                        'From hand-painted signs and stickered slogans to knitted hats and radical badges, craft and protest have always gone together.Combine your passion for making with your desire to make your voice heard with 15 step-by-step craftivism projects. Rebel Crafts is a fun and informative collection of activism-inspired activities created by experienced crafter Hester van Overbeek. Hester will teach you how to screen-print a slogan T-shirt, create bespoke paper for letter-writing campaigns and bring inspiration to your neighbourhood with a handmade mini-library.',
                    image:
                        'https://www.kinokuniya.co.id/sites/default/files/styles/sc800x800/public/products/2022-01/9781787395664.jpg?itok=TozEnQAD'),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTittle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget newProductsTittle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
        ),
        child: Text(
          'New Products',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget productsTile() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TileProducts(
                id: '1',
                name: 'PG 1/60 UNICORN GUNDAM',
                image: 'assets/product1.jpg',
                price: 700.0),
            TileProducts(
                id: '2',
                name: 'ZOIDS 1/72 EZ-054 LIGER ZERO X',
                image: 'assets/product7.jpg',
                price: 350.00),
            TileProducts(
                id: '3',
                name: 'Gundam Wings',
                image: 'assets/product3.jpg',
                price: 250.55),
          ],
        ),
      );
    }

    Widget testButton() {
      return GestureDetector(
        onTap: () {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return addEditWidget(tittle: 'tambahkan');
          //     });

          Provider.of<ProductProvider>(context, listen: false).addProduct(
              ProductModel(
                  id: 5,
                  name: 'name',
                  author: 'author',
                  price: 'price',
                  description: 'description',
                  image: 'image'));
        },
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: kPurpleColor,
            borderRadius: BorderRadius.circular(defaultBorder),
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Continue',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: kWhiteColor,
              )
            ],
          )),
        ),
      );
    }

    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        // header(),
        banner(),
        popularProductsTittle(),
        popularProducts1(),
        newProductsTittle(),
        popularProducts2(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
