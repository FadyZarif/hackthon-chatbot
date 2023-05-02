abstract class ChatStates {}

class ChatIntialState extends ChatStates {}

class ChatUserSendMessageSuccessState extends ChatStates {}
class ChatBotSendMessageSuccessState extends ChatStates {}
class SocialSendMessageErrorState extends ChatStates {}


class ChatGetAllMessagesSuccessState extends ChatStates {}


class ChatSuccessResponseState extends ChatStates {}
class ChatErrorResponseState extends ChatStates {}




