import 'package:flutter/material.dart';

class FavouriteGenres extends StatelessWidget {
  FavouriteGenres();

  @override
  Widget build(BuildContext context) {
    Map<String, Color> items = {
      'Action': Color(0xff8769FF),
      'Western': Color(0xffF36F45),
      'Adventure': Color(0xff8769FF),
      'Drama': Color(0xffF36F45),
      'Sci-fi': Color(0xff61D1EA),
    };
    Map<String, Color> itemsToAdd = {
      'Crime': Color(0xff262629),
      'Comedy': Color(0xff262629),
      'Thriller': Color(0xff262629)
    };
    return Container(
      width: double.infinity,
      color: Color(0xff1E1E21),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.width * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favourite genres',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: items.entries
                  .map((i) => Padding(
                        padding: const EdgeInsets.only(top: 20, right: 25),
                        child: Container(
                            decoration: BoxDecoration(
                                color: i.value,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                              child: Text(
                                i.key,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            )),
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: InkWell(
                onTap: () {},
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.add_circle_sharp,
                        size: 16,
                        color: Color(0xffC4C4C4),
                      ),
                    ),
                    Text(
                      'Add your favourite genres',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: itemsToAdd.entries
                  .map((i) => Padding(
                        padding: const EdgeInsets.only(top: 20, right: 25),
                        child: Container(
                            decoration: BoxDecoration(
                                color: i.value,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                              child: Text(
                                i.key,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            )),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
