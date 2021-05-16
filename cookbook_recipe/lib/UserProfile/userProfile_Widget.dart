import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String profileImage;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key key,
    @required this.profileImage,
    this.isEdit = false, 
    @required this.onClicked,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final color = Theme
        .of(context)
        .colorScheme
        .primary;

    return Center(child: Stack(
      children: <Widget>[
       buildImage(),
        Positioned(
          bottom: 0,
            right: 4,
            child: buildEditIcon(color)),
    ]));
  }

  Widget buildImage(){
    final image = NetworkImage(profileImage);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked,),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) =>buildCircle(
    color: Colors.white,
    all: 2.5,
    child: buildCircle(
      color: color,
      all: 6,
      child: Icon(
         isEdit ? Icons.add_a_photo_outlined : Icons.edit_outlined,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
  @required Widget child,
    @required double all,
    @required Color color,
  }) => ClipOval(
       child:Container(
          padding: EdgeInsets.all(all),
           color: color,
           child: child,
        )
  );

}

