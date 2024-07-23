// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:muse/presentation/chat_page/models/chat_model.dart';
import '../models/userprofilelist1_item_model.dart';
import '../models/userprofilelist_item_model.dart';
import '/core/app_export.dart';

part 'chat_state.dart';

final chatNotifier = StateNotifierProvider<ChatNotifier, ChatState>(
  (ref) => ChatNotifier(
    ChatState(
      chatModelObj: ChatModel(
        userprofilelistItemList: [
          UserprofilelistItemModel(
            userImage2: ImageConstant.imageNotFound,
            userName: 'Tobey',
          ),
          UserprofilelistItemModel(
            userImage2: ImageConstant.imageNotFound,
            userName: 'Lauren',
          ),
          UserprofilelistItemModel(
            userImage2: ImageConstant.imageNotFound,
            userName: 'Rueesll',
          ),
          UserprofilelistItemModel(
            userImage2: ImageConstant.imageNotFound,
            userName: 'Dianne',
          ),
          UserprofilelistItemModel(
            userImage2: ImageConstant.imageNotFound,
            userName: 'Marvin',
          ),
          UserprofilelistItemModel(userName: 'Ralph'),
        ],
        userprofilelist1ItemList: [
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imageNotFound,
            userName: 'Dianne Russell',
            timeAgo: '12 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imageNotFound,
            userName: 'Marvin McKinney',
            timeAgo: '42 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imageNotFound,
            userName: 'Ralph Edwards',
            timeAgo: '21 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imageNotFound,
            userName: 'Lauren Edwards',
            timeAgo: '43 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imageNotFound,
            userName: 'Dianne Russell',
            timeAgo: '22 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imageNotFound,
            userName: 'Tobey Cohan',
            timeAgo: '42 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imageNotFound,
            userName: 'Jenny Ross',
            timeAgo: '50 min ago',
          ),
        ],
      ),
    ),
  ),
);

/// A notifier that manages the state of a Chat according
/// to the event that is dispatched to it.
class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier(ChatState state) : super(state);
}
