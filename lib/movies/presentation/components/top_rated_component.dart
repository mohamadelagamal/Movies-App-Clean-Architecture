import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/state/movies_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../core/utills/dummy.dart';
import '../../../core/utills/enums.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc,MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedListRequestState !=
          current.topRatedListRequestState,
      builder: (BuildContext context, MoviesState state) {
        print("TopRatedComponent build");
        switch(state.topRatedListRequestState){
          case RequestState.loading:
            return const SizedBox(
              height: 200.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.error:
            return const SizedBox(
              height: 200.0,
              child: Center(
                child: Text("Error"),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedList.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedList[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
        }
      },
    );
  }
}
