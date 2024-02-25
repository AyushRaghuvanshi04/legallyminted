import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Messages> openAIConvoHistory = [
    Messages(role: Role.user, content: "You are an experienced lawyer you can give me professional legal advice.")
  ];
  final TextEditingController _textController = TextEditingController();
  final OpenAI _openAI = OpenAI.instance.build(
      token: "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",
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 10)),
      enableLog: true);

  void _handleSendPressed() {
    final text = _textController.text;
    if (text.isNotEmpty) {
      setState(() {
        openAIConvoHistory.add(Messages(content: text, role: Role.user));
        _textController.clear();
      });
     // _simulateBotResponse(); // Simulate a bot response
    openAIMessageSender(text);
    }
  }

  // void _simulateBotResponse() {
  //   setState(() {
  //     _messages.add(Message(text: "This is a bot response.", sender: "LegalAI"));
  //   });
  // }
 Future<void> openAIMessageSender(String text) async {

final request = ChatCompleteText(
      //prompt: prompt,
      messages: openAIConvoHistory,
      temperature: 0.6,
      model: GptTurbo0631Model(),
      maxToken: 600,
    );


     final response = await _openAI.onChatCompletion(request: request);
      for (var element in response!.choices) {
        print("data -> ${element.message?.content}");

        // openAIConvoHistory.add(
        //     Messages(role: Role.assistant, content: element.message?.content));
      }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18), // Set the background color to match Phind's color
      appBar: AppBar(
        title:const Text("Legal AI", style: TextStyle(fontSize:   15, fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.black,
        elevation:   0, // Remove shadow below AppBar
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: openAIConvoHistory.length,
              itemBuilder: (context, index) {
                final message = openAIConvoHistory[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical:   8.0, horizontal:   16.0),
                  child: Align(
                    alignment: message.role == Role.user ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: message.role == Role.user ? Colors.black : Colors.grey[300], // Make user's message box black
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: message.role == Role.user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.role.toString(), // Display the sender's name
                            style: const TextStyle(color: Colors.white, fontSize:   12),
                          ),
                          const SizedBox(height:   4), // Add some space between the sender's name and the message
                          Text(
                            message.content.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal:   16.0, vertical:   8.0), // Added vertical padding here
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _textController,
                    maxLines: null, // Allows the TextFormField to expand vertically
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      fillColor: Colors.grey[200], // Set the fill color of the TextFormField to light grey
                      filled: true, // Enable the fillColor property
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _handleSendPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

