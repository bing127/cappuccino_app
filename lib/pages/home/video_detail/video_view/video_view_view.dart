import 'package:cappuccino/components/base_bottom_sheet.dart';
import 'package:cappuccino/components/base_video.dart';
import 'package:cappuccino/components/bottom_comment_group/bottom_comment_group_view.dart';
import 'package:cappuccino/pages/home/video_detail/video_detail_logic.dart';
import 'package:cappuccino/pages/home/video_detail/video_view/video_comment/video_comment_view.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'video_view_logic.dart';

class VideoViewPage extends StatelessWidget {
  final bool play;
  final String path;
  final String poster;
  final String tag;

  const VideoViewPage(
      {super.key,
      required this.play,
      required this.tag,
      required this.path,
      required this.poster});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: Get.arguments['id'],
        child: GetBuilder(
            assignId: true,
            tag: tag,
            initState: (GetBuilderState<VideoViewLogic>? state) {},
            init: VideoViewLogic(),
            builder: (VideoViewLogic logic) {
              return Container(
                color: Colors.black,
                width: Get.width,
                height: Get.height,
                child: Stack(
                  children: [
                    Obx(() => AnimatedContainer(
                      width: Get.width,
                      height: logic.state.videoHeight.value,
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.only(
                        bottom: logic.state.videoHeight.value <= Get.height / 1.43 ? 0 : 60
                      ),
                      child: BaseVideo(
                          poster: poster,
                          path: path,
                          play: play,
                          playerCallback: (FijkPlayer player) {
                            logic.state.player.value = player;
                            Get.find<VideoDetailLogic>()
                                .childPageInitialized(player);
                          },
                          playerFinishCallback: (FijkState state) {
                            logic.state.playerState.value = state;
                          }),
                    )),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          appBar: AppBar(
                            leading: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  RemixIcon.arrow_left_s_outline,
                                  color: Colors.white,
                                  size: 20,
                                )),
                            elevation: 0.0,
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            systemOverlayStyle: Utils.light,
                          ),
                          body: Obx(() {
                            Widget child = const SizedBox.shrink();
                            if (logic.state.playerState.value == FijkState.paused) {
                              child = Icon(RemixIcon.play,
                                  size: 80, color: Colors.white.withOpacity(0.3));
                            } else if (logic.state.playerState.value ==
                                FijkState.completed) {
                              child = Icon(RemixIcon.restart_outline,
                                  size: 80, color: Colors.white.withOpacity(0.3));
                            }
                            return InkWell(
                              onTap: () {
                                if (logic.state.playerState.value ==
                                    FijkState.started) {
                                  logic.state.player.value.pause();
                                } else if (logic.state.playerState.value ==
                                    FijkState.paused) {
                                  logic.state.player.value.start();
                                } else if (logic.state.playerState.value ==
                                    FijkState.completed) {
                                  logic.state.player.value.start();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: child,
                                ),
                              ),
                            );
                          }),
                          bottomNavigationBar: BottomCommentGroupPage(
                            brightness: Brightness.dark,
                            commentType: CommentType.video,
                            commentFunc: () {
                              _showComment(context, logic);
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
    );
  }

  void _showComment(BuildContext context, VideoViewLogic logic) {
    double defaultHeight = Get.height / 1.43;
    logic.state.videoHeight.value = Get.height - defaultHeight;
    showBaseModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: false,
        backgroundColor: Colors.transparent,
        transitionAnimationController:  AnimationController(
          vsync: Navigator.of(context),
          duration: const Duration(milliseconds: 100),
        ),
        onVerticalDragUpdate: (DragUpdateDetails details) {
          double endHeight = defaultHeight - details.localPosition.dy;
          if (endHeight <=0) {
            endHeight = 0;
          }
          logic.state.videoHeight.value = Get.height - endHeight;

        },
        onVerticalDragEnd: (DragEndDetails details) {
          logic.state.videoHeight.value = Get.height - defaultHeight;
        },
        builder: (BuildContext parentContext) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return VideoCommentPage(back: () {
                Navigator.of(parentContext).pop();
              },);
            },
          );
        }).then((value) {
      logic.state.videoHeight.value = Get.height;
    });
  }
}
