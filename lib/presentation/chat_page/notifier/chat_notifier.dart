import 'package:equatable/equatable.dart';
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
            userImage2: ImageConstant.imgImage48x48,
            userName: 'Tobey',
          ),
          UserprofilelistItemModel(
            userImage2: ImageConstant.imgRectangle2048x48,
            userName: 'Lauren',
          ),
          UserprofilelistItemModel(
            userImage2: ImageConstant.imgImage1,
            userName: 'Rueesll',
          ),
          UserprofilelistItemModel(
            userImage2: ImageConstant.imgRectangle5248x48,
            userName: 'Dianne',
          ),
          UserprofilelistItemModel(
            userImage2: ImageConstant.imgRectangle23,
            userName: 'Marvin',
          ),
          UserprofilelistItemModel(userName: 'Ralph'),
        ],
        userprofilelist1ItemList: [
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imgRectangle5248x48,
            userName: 'Dianne Russell',
            timeAgo: '12 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imgRectangle23,
            userName: 'Marvin McKinney',
            timeAgo: '42 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imgRectangle522,
            userName: 'Ralph Edwards',
            timeAgo: '21 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imgRectangle2048x48,
            userName: 'Lauren Edwards',
            timeAgo: '43 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imgEllipse2348x48,
            userName: 'Dianne Russell',
            timeAgo: '22 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imgRectangle523,
            userName: 'Tobey Cohan',
            timeAgo: '42 min ago',
          ),
          Userprofilelist1ItemModel(
            userImage: ImageConstant.imgRectangle522,
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
