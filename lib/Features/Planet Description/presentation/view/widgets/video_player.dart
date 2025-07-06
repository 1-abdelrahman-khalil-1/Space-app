import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20video%20cubit/planet_video_cubit.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20video%20cubit/planet_video_cubit_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanetVideoCubit, PlanetVideoCubitState>(
      builder: (context, state) {
        if (state is PlanetVideoLoaded) {
          final youtubePlayerController = YoutubePlayerController(
            initialVideoId: state.videoId,
            flags: const YoutubePlayerFlags(
              enableCaption: true,
              controlsVisibleAtStart: true,
              autoPlay: false,
              mute: false,
              showLiveFullscreenButton: false,
            ),
          );
          return YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.redAccent,
                ),
              ),
              RemainingDuration(),
              
              const PlaybackSpeedButton(),
            ],
            onReady: () {
              log('Player is ready.');
            },
          );
        } else if(state is PlanetVideoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("No video available"));
        }
      },
    );
  }
}
