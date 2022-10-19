
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_stream/sound_stream.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';

DialogflowGrpcV2Beta1? dialogflow;


class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  bool _isRecording = false;

  final RecorderStream _recorder = RecorderStream();
  late StreamSubscription _recorderStatus;
  late StreamSubscription<List<int>> _audioStreamSubscription;
  late BehaviorSubject<List<int>> _audioStream;

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  @override
  void dispose() {
    _recorderStatus.cancel();
    _audioStreamSubscription.cancel();
    super.dispose();
  }

  Future<void> initPlugin() async {
    _recorderStatus = _recorder.status.listen((status) {
      if (mounted) {
        setState(() {
          _isRecording = status == SoundStreamStatus.Playing;
        });
      }
    });

    await Future.wait([
      _recorder.initialize()
    ]);

    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString('assets/dialogflow/shtably-graditionproject-jeai-143a375c58fd.json')));
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  void stopStream() async {
    await _recorder.stop();
    await _audioStreamSubscription.cancel();
    await _audioStream.close();
  }

  void handleSubmitted(text) async {
    _textController.clear();

    ChatMessage message = ChatMessage(
      text: text,
      name: "You",
      type: true,
    );

    setState(() {
      _messages.insert(0, message);
    });

    DetectIntentResponse data = await dialogflow!.detectIntent(text, 'en-US');
    String fulfillmentText = data.queryResult.fulfillmentText;
    if(fulfillmentText.isNotEmpty) {
      ChatMessage botMessage = ChatMessage(
        text: fulfillmentText,
        name: "Bot",
        type: false,
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    }

  }

  void handleStream() async {
    _recorder.start();

    _audioStream = BehaviorSubject<List<int>>();
    _audioStreamSubscription = _recorder.audioStream.listen((data) {
      _audioStream.add(data);
    });

    var biasList = SpeechContextV2Beta1(
        phrases: [
          'Dialogflow CX',
          'Dialogflow Essentials',
          'Action Builder',
          'HIPAA'
        ],
        boost: 20.0
    );

    var config = InputConfigV2beta1(
        encoding: 'AUDIO_ENCODING_LINEAR_16',
        languageCode: 'en-US',
        sampleRateHertz: 16000,
        singleUtterance: false,
        speechContexts: [biasList]
    );


    final responseStream = dialogflow!.streamingDetectIntent(config, _audioStream);
    responseStream.listen((data) {
      setState(() {
        String transcript = data.recognitionResult.transcript;
        String queryText = data.queryResult.queryText;
        String fulfillmentText = data.queryResult.fulfillmentText;

        if(fulfillmentText.isNotEmpty) {

          ChatMessage message =  ChatMessage(
            text: queryText,
            name: "You",
            type: true,
          );

          ChatMessage botMessage =  ChatMessage(
            text: fulfillmentText,
            name: "Bot",
            type: false,
          );

          _messages.insert(0, message);
          _textController.clear();
          _messages.insert(0, botMessage);

        }
        if(transcript.isNotEmpty) {
          _textController.text = transcript;
        }

      });
    },onError: (e){
    },onDone: () {
    });

  }

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.isDarkMode?pinkClr:mainColor,
        title: TextUtils(
          fontSize: 20,
          color: Colors.white,
          text: 'chatBot'.tr,
          fontWeight: FontWeight.bold,
          underLine: TextDecoration.none,
        ),
      ),
      body:Directionality (
        textDirection: TextDirection.ltr,
        child: Column(children: <Widget>[
          Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              )),
          const Divider(height: 1.0),
          Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: _textController,
                        onSubmitted: handleSubmitted,
                        decoration: const InputDecoration.collapsed(hintText: "Send a message"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                        color: Get.isDarkMode?pinkClr:mainColor,
                        icon: const Icon(Icons.send),
                        onPressed: () => handleSubmitted(_textController.text),
                      ),
                    ),
                    IconButton(
                      iconSize: 30.0,
                      color: Get.isDarkMode?pinkClr:mainColor,
                      icon: Icon(_isRecording ? Icons.mic_off : Icons.mic),
                      onPressed: _isRecording ? stopStream : handleStream,
                    ),
                  ],
                ),
              )
          ),
        ]),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text,
    required this.name,
    required this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(

        margin: const EdgeInsets.only(right: 16.0),
        child:  CircleAvatar(
          backgroundColor: Get.isDarkMode?pinkClr:mainColor,
            child:   Text('B',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),)),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(name, style: Theme.of(context).textTheme.subtitle1),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
      Container(

        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundColor: Get.isDarkMode?pinkClr:mainColor,
            child: Text(
              name[0],
              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
              fontSize: 20),
            )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}