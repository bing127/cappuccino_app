import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'note_logic.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NoteLogic(),
      assignId: true,
      builder: (NoteLogic logic) {
        return Container(
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/OSy.png", width: 80,),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20
                  ),
                  child: Text(
                    "分享每天都很开心都自己",
                    style: GoogleFonts.longCang(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 14
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
