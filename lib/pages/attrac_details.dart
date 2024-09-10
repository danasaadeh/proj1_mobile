import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_cubit.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_details_cubit.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/reveiw_model.dart';

class AttractonDetails extends StatelessWidget {
  static String id = "atrracdet";
  final TextEditingController commentController = TextEditingController();

  final Attraction attraction;

  AttractonDetails({
    super.key,
    required this.attraction,
  });
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<AttracCubit>(context).getAttracDetails(id: attrac);
    BlocProvider.of<AttractionDetailsCubit>(context).fetchreview(attraction.id);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                    image: NetworkImage(
                      attraction.attractionPhoto.isNotEmpty
                          ? attraction.attractionPhoto
                          : "lib/images/photo_2024-05-14_13-19-25.jpg",
                    ),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Container(
              //height: 450,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attraction.attractionName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0XFF1B4158)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0XFF1B4158),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          attraction.city.cityName,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.category,
                          color: Color(0XFF1B4158),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          attraction.attractionType.attractionTypeName,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Details:",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0XFF1B4158)),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 209, 201, 201)),
                        children: attraction.about.split('\n').map((line) {
                          return TextSpan(
                            text: line,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 104, 101, 101)),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.lock_open,
                          color: Color(0XFF1B4158),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          attraction.openAt,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 104, 101, 101),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        const Icon(
                          Icons.lock,
                          color: Color(0XFF1B4158),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          attraction.closeAt,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 104, 101, 101),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Reviews:",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0XFF1B4158)),
                    ),
                    BlocBuilder<AttractionDetailsCubit, AttractionDetailsState>(
                      builder: (context, state) {
                        if (state is AttractionDetailsInitial ||
                            state is AttractionDetailsLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is reviewDetailsLoadedState) {
                          final reviews = state.review;
                          if (reviews.isEmpty) {
                            return Column(
                              children: [
                                const Center(
                                  child: Text(
                                    'There are no attraction reviews yet, be the first one who give us a nice review',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: commentController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.send,
                                          color: Color(0XFF2C516C)),
                                      onPressed: () {
                                        BlocProvider.of<AttractionDetailsCubit>(
                                                context)
                                            .addAttractionReview(
                                          attraction.id,
                                          commentController.text,
                                        );
                                        commentController.clear();
                                      },
                                    ),
                                    prefixIcon: const Icon(Icons.comment,
                                        color:
                                            Color.fromARGB(255, 201, 198, 198)),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0XFF1B4158), width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    hintText: 'Add Your Comment',
                                    hintStyle: const TextStyle(fontSize: 12),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0XFF1B4158), width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          return Column(children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: reviews.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: const Color(0XFF2C516C)
                                            .withOpacity(0.9),
                                        child: const Icon(Icons.person,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(0.1),
                                        height: 70,
                                        width: 270,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 0.3),
                                          color: const Color.fromARGB(
                                              255, 233, 233, 233),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            reviews[index].userName,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0XFF1B4158)),
                                          ),
                                          subtitle: Text(reviews[index].review,
                                              style: const TextStyle(
                                                  fontSize: 12)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: commentController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.send,
                                      color: Color(0XFF2C516C)),
                                  onPressed: () {
                                    BlocProvider.of<AttractionDetailsCubit>(
                                            context)
                                        .addAttractionReview(
                                      attraction.id,
                                      commentController.text,
                                    );
                                    commentController.clear();
                                  },
                                ),
                                hintText: 'Add Your Comment',
                                hintStyle: const TextStyle(fontSize: 12),
                                prefixIcon: const Icon(Icons.comment,
                                    color: Color.fromARGB(255, 201, 198, 198)),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ]);
                        } else if (state is AttractionDetailsErrorState) {
                          // Error state, display an error message
                          return Center(
                              child: Text('Error: ${state.errorMessage}'));
                        } else {
                          // State when there are no reviews available
                          return const Center(
                              child: Text('No reviews available'));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
