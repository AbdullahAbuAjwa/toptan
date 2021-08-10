import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/model/request/send_message.dart';
import 'package:toptan/model/response/app_response.dart';
import 'package:toptan/model/response/chat.dart';

class ChatProvider with ChangeNotifier {

  AppResponse? _chatResponse;

  AppResponse? get chatResponse => _chatResponse;
  List<Chat>? _items = [];

  List<Chat>? get items {
    return [...?_items];
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchChat(locale) async {
    try {
      Response response = await AppShared.dio!.get(
        '${AppShared.baseUrl}getAllMessage',
        options: Options(
          headers: {
            'Accept-Language': locale,
            "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}'
          },
        ),
      );
      //  print(response.data);
      ChatResponse chatResponse = ChatResponse.fromJson(response.data);

      _items = chatResponse.chat!.reversed
          .where((element) => element.userId == AppShared.currentUser!.user.id)
          .toList();
      notifyListeners();
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }

  Future<AppResponse> sendMessage(locale,
      {String? message, int? type, MultipartFile? image}) async {
    SendMessage sendMessage =
        SendMessage(message: message, type: type, image: image);

    Response response = await AppShared.dio!.post(
      '${AppShared.baseUrl}sendMsg',
      data: FormData.fromMap(sendMessage.toJson()),
      options: Options(
        headers: {
          "Authorization": 'Bearer ${AppShared.currentUser!.user.accessToken}',
          'Accept-Language': locale
        },
      ),
    );
    // Chat chat = Chat(message: message, type: type);
    // _items!.add(chat);
    AppResponse chatResponse = AppResponse.fromJson(response.data);
    // if (chatResponse.status) {
    _chatResponse = chatResponse;
    notifyListeners();
    //}
    return chatResponse;
  }
}
