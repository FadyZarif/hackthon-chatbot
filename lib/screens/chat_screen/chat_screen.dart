import 'package:competition/screens/chat_screen/cubit/chat_cubit.dart';
import 'package:competition/screens/chat_screen/cubit/chat_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const/const.dart';
import '../../models/message_model.dart';
import '../../models/user_model.dart';
import '../../shared/styles/IconBroken.dart';

class ChatDetailsScreen extends StatelessWidget {
  final String serviceID;

  ChatDetailsScreen({
    Key? key,
    required this.serviceID,
  }) : super(key: key);
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? msg;
    return Builder(builder: (context) {
      ChatCubit chatCubit = ChatCubit.get(context);
      if (chatCubit.licenseNumber == null) {
        ChatCubit.get(context)
            .botSendMessage(
                'مرحبا بك فى خدمة مخلفات المرور من فضلك ادخل رقم الرخصة',
                serviceID)
            .then((value) {
          ChatCubit.get(context).getMessages(serviceID);
        });
      } else {
        ChatCubit.get(context).getMessages(serviceID);
      }


      return BlocConsumer<ChatCubit, ChatStates>(listener: (context, state) {
        if (state is ChatUserSendMessageSuccessState) {
          ChatCubit.get(context).dliSequence(msg!, serviceID);
        }
      }, builder: (context, state) {
        ChatCubit cubit = ChatCubit.get(context);
        return ConditionalBuilder(
          condition: true,
          builder: (context) {
            return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0,
                  toolbarHeight: 75,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/4616/4616334.png')),
                            const CircleAvatar(
                              radius: 9,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 7,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'chatBot',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Online',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                body: ConditionalBuilder(
                    condition: true,
                    builder: (context) {
                      // cubit.seenMessage(receiverModel);
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    reverse: true,
                                    itemBuilder: (context, i) {
                                      if (cubit.messages[i].senderId == uId) {
                                        return buildMyMessage(i,
                                            cubit.messages[i], context, cubit);
                                      } else {
                                        return buildMessage(cubit.messages[i]);
                                      }
                                    },
                                    separatorBuilder: (context, i) {
                                      return SizedBox(
                                        height: 15,
                                      );
                                    },
                                    itemCount: cubit.messages.length),
                              ),
                            ),
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(15))),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: TextFormField(
                                        controller: messageController,
                                        decoration: InputDecoration(
                                          hintText: 'Write a Message...',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: MaterialButton(
                                      onPressed: () {
                                        // if(state is ChatBotSendMessageSuccessState){
                                        msg = messageController.text;
                                        cubit
                                            .userSendMessage(
                                                messageController.text,
                                                serviceID)
                                            .then((value) =>
                                                messageController.text = '');
                                      },
                                      minWidth: 1,
                                      color: Colors.blueGrey,
                                      child: Center(
                                          child: Icon(Icons.send,
                                              color: Colors.white, size: 18)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator())));
          },
          fallback: (BuildContext context) {
            return Scaffold();
          },
        );
      });
    });
  }

  Widget buildMessage(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10),
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
          ),
        ),
        child: Text(model.message!),
      ),
    );
  }

  Widget buildMyMessage(
      int i, MessageModel model, BuildContext context, ChatCubit cubit) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(0.3),
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.message!),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Text('7:35 AM',style: Theme.of(context).textTheme.caption),
            //     SizedBox(
            //       width: 5,
            //     ),
            //     Stack(
            //       children:  [
            //         Padding(
            //           padding: const EdgeInsetsDirectional.only(start: 5),
            //           child: Icon(Icons.check,size: 15,color:  cubit.messages[i].isSeen!? Colors.blue : Colors.grey ,),
            //         ),
            //         Icon(Icons.check,size: 15,color:  cubit.messages[i].isSeen!? Colors.blue : Colors.grey ,),
            //       ],
            //     ),
            //
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
