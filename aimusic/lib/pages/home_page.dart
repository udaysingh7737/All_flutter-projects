import 'package:aimusic/model/redio.dart';
import 'package:aimusic/utility/Ai_utility.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyRadio> radios;
  MyRadio _selectedRadio;
  Color _selectedColor;
  bool _isPlaying = false;

  final AudioPlayer _audioPlayer = AudioPlayer();
  final suggesion = [
    "Play",
    "Play Next",
    "Stop",
    "Play 107 FM",
    "Pause",

  ];

  @override
  void initState() {

    super.initState();
    setUpAlan();
    fetchRadios();

    _audioPlayer.onPlayerStateChanged.listen((event) {
      if(event == AudioPlayerState.PLAYING){
        _isPlaying = true;
      }
      else{
       _isPlaying = false;
      }
      setState(() {  });
    });
  }
  fetchRadios()async{
    final radioJson = await rootBundle.loadString("assets/radio.json");



    setState(() {
      radios = MyRadioList.fromJson(radioJson).radios;
      _selectedRadio =radios[0];
      _selectedColor = Color(int.tryParse(_selectedRadio.color));
      print(radios);
    });
  }

  setUpAlan(){
    AlanVoice.addButton(
        "ddc0ce4fe14d0ef0c2b12ab7447e49872e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);
    AlanVoice.callbacks.add((command) => _handleCommand(command.data));
  }

  _handleCommand(Map<String, dynamic> responce) {
    switch(responce["command"]){
      case "play":
        _playMusic(_selectedRadio.url);
        break;

      case "play_channel":
        final id= responce['id'];
        _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == id);
        radios.remove(newRadio);
        radios.insert(0, newRadio);

        setState(() {
          _playMusic(newRadio.url);
        });
        break;
      case "play_category":
        final category= responce['category'];
        _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.category == category);
        radios.remove(newRadio);
        radios.insert(0, newRadio);

        setState(() {
          _playMusic(newRadio.url);
        });
        break;

      case "pause":
        _audioPlayer.pause();
        setState(() {

        });
        break;
      case "stop":
        _audioPlayer.stop();
        setState(() {

        });
        break;

      case "next":
        final  index = _selectedRadio.id;
        MyRadio newRadio;
        if(index+1>radios.length){
          newRadio = radios.firstWhere((element) => element.id == 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        }else{
          newRadio = radios.firstWhere((element) => element.id == index+1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        }
        _playMusic(newRadio.url);
        setState(() {

        });
        break;
      case "previous":
        final  index = _selectedRadio.id;
        MyRadio newRadio;
        if(index-1>0){
          newRadio = radios.firstWhere((element) => element.id == 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        }else{
          newRadio = radios.firstWhere((element) => element.id == index-1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        }
        _playMusic(newRadio.url);
        setState(() {

        });
        break;



      default:
        print("Command Was ${responce["Command"]}");
        break;
    }
  }

  _playMusic(String url){
    _audioPlayer.play(url);
    _selectedRadio = radios.firstWhere((element) => element.url == url);
    print(_selectedRadio.name);
    setState(() {  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: Container(
          color:  Colors.redAccent,
          child: radios !=null ? [
            100.heightBox,
            "All Channels".text.bold.white.xl5.make().px16(),

            20.heightBox,
            ListView(
              padding: Vx.m0,
              shrinkWrap: true,
              children: radios.map((e) => ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(e.icon),
                ),
                title:"${e.name} FM".text.white.make(),
                subtitle: e.tagline.text.white.make(),
              )).toList(),
            ).expand(),
          ].vStack()
              :const Offstage(),
        ),

      ),

      body: Stack(
        children: <Widget>[
          VxAnimatedBox().size(context.screenWidth, context.screenHeight)
              .withGradient(LinearGradient(
              colors: [

                AIColors.primaryColor2,
                _selectedColor ?? AIColors.primaryColor1,
                Colors.lightBlue
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

          ))
              .make(),
          [
          AppBar(
            title: "AI Music".text.bold.xl4.white.make().shimmer(
              primaryColor: Vx.purple300,
              secondaryColor: Colors.white,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100).p12(),
          20.heightBox,
          "Start Speak To assistant".text.color(Colors.teal).semiBold.xl.make(),

          VxSwiper.builder(
            itemCount: suggesion.length,
            height: 50.0,
            viewportFraction: 0.35,
            autoPlay: true,
            autoPlayAnimationDuration: 2.seconds,
            autoPlayCurve: Curves.linear,
            enableInfiniteScroll: true,
            scrollPhysics: BouncingScrollPhysics(),
            itemBuilder: (context,index){

            final sugg =suggesion[index];
            return
            Chip(label: sugg.text.make(),backgroundColor: Colors.transparent,
            );
          })
          ].vStack(),
          20.0.heightBox,


          radios!= null ? VxSwiper.builder(
            itemCount: radios.length,
            reverse: true,
            onPageChanged: (index) {
              final colorHex = radios[index].color;
              _selectedColor = Color(int.tryParse(colorHex));
              _selectedRadio = radios[index];
              setState(() {


              });
            },
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            aspectRatio: context.mdWindowSize == MobileDeviceSize.small ?2.0
            : context.mdWindowSize== MobileDeviceSize.medium
            ? 2.0
            : 3.0,
            itemBuilder: (context, index) {
              final red = radios[index];
              return VxBox(child: ZStack([
                
                Positioned(
                  top: 0.0,right: 0.0,
                  child: VxBox(
                    child: red.category.text.uppercase.white.make().px16(),
                  ).height(40).black.alignCenter.withRounded(value: 10.0).make(),
                ),
                
                Align(alignment: Alignment.bottomCenter,
                child: VStack([
                  red.name.text.xl3.white.bold.make(),
                  5.heightBox,
                  red.tagline.text.sm.white.semiBold.make(),
                ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: [
                    Icon(
                        CupertinoIcons.play_circle,
                        color: Colors.white,
                    ),
                    10.heightBox,
                    "Double Tap to Play".text.gray300.make(),

                  ].vStack()
                )

              ],

              )).clip(Clip.antiAlias)
                  .bgImage(
                  DecorationImage(
                    image: NetworkImage(red.image),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3),
                        BlendMode.darken)
              )
              ).border(color: Colors.black,width: 5.0).withRounded(value: 50.0)
                  .make()
                  .p12()
                  .onDoubleTap(() {
                    _playMusic(red.url);
              });
            }
          ).centered() :CircularProgressIndicator(backgroundColor: Colors.white,),

          Align(alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: [
                if(_isPlaying)
                  "Playing Now ${_selectedRadio.name} FM".text.warmGray50.makeCentered(),


                Padding(
                  padding: const EdgeInsets.only(left: 130.0),
                  child: Row(
                    children: [
                      Icon(
                        _isPlaying
                            ? CupertinoIcons.pause_circle
                            : Icons.autorenew,
                        color: Colors.white,
                        size: 50.0,
                      ).onInkTap(() {
                        if(_isPlaying){
                          _audioPlayer.pause();
                        }else{
                          _audioPlayer.resume();
                        }
                      }),

                      Icon(
                        _isPlaying
                            ? CupertinoIcons.stop_circle
                            : CupertinoIcons.play_circle,
                        color: Colors.white,
                        size: 50.0,
                      ).onInkTap(() {
                        if(_isPlaying){
                          _audioPlayer.stop();
                        }else{
                          _playMusic(_selectedRadio.url);
                        }
                      })
                    ],
                  ),
                ),




              ].vStack(),
            ),
          )
        ],
        fit: StackFit.expand,
      ),
    );
  }


}
