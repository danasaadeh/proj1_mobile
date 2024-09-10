import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_cubit.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_state.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_cubit.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/pages/attrac_details.dart';
import 'package:tourism/widget/attrac_card.dart';

class attracPage extends StatelessWidget {
  static String id = "attrac";

  @override
  Widget build(BuildContext context) {
    final attracCubit = BlocProvider.of<AttracCubit>(context);
    BlocProvider.of<AttracCubit>(context).fetchAttrac();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 51, 86, 116),
          title: const Text(
            "Atrractions",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              BlocProvider.of<AttracCubit>(context)
                                  .searchAttractions(value);
                            },
                            decoration: const InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Explore the wonderful sight",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<AttracCubit, AttracState>(builder: (context, state) {
                if (state is AttracInitial || state is AttracLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AttracSuccess) {
                  if (state.attrac.isEmpty) {
                    return const Center(child: Text('No Attractions found.'));
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.attrac.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            customCardAttrac(
                              press: () {
                                BlocProvider.of<AttracCubit>(context)
                                    .getAttracDetails(
                                        id: state.attrac[index].id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AttractonDetails(
                                              attraction: state.attrac[index],
                                              // review: Attracs[index].review,
                                            )));
                              },
                              is_favorites_page: false,
                              attraction: state.attrac[index],
                              width: double.infinity,
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        );
                      },
                    ),
                  );
                } else if (state is AttracFailure) {
                  return Center(
                      child: Text('Error: ${state.message.toString()}'));
                }
                return Container();
              }),
            ],
          ),
        ));
  }
}
