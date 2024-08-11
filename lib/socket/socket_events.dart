// socket_events.dart

class SocketEvents {
  static const String CONNECT = "connect";
  static const String DISCONNECT = "disconnect";
  static const String JOIN_ROOM_PREVIEW = "join_room_preview";
  static const String NEW_PEER_JOINED = "new_peer_joined";
  static const String JOIN_ROOM = "join_room";
  static const String ROOM_UPDATE = "room_update";
  static const String CREATE_WEB_RTC_TRANSPORT = "create_webrtc_transport";
  static const String PRODUCE = "produce";
  static const String CONSUME = "consume";
  static const String TRANSPORT_SEND_CONNECT = "transport_send_connect";
  static const String TRANSPORT_RECV_CONNECT = "transport-recv-connect";
  static const String TRANSPORT_PRODUCE = "transport_produce";
  static const String CONSUMER_RESUME = "consumer-resume";
  static const String GET_PRODUCERS = "get_producers";
  static const String NEW_PRODUCER = "new_producer";
  static const String PEER_LEAVED = "peer_leave";
  static const String STOP_PRODUCING = "stop_producing";
  static const String SOME_PRODUCER_CLOSED = "some_producer_closed";
  static const String CHAT_MSG_TO_SERVER = "chat_msg_to_server";
  static const String CHAT_MSG_FROM_SERVER = "chat_msg_from_server";
  static const String RAISE_HAND_TO_SERVER = "raise_hand_to_server";
  static const String RAISE_HAND_FROM_SERVER = "raise_hand_from_server";
  static const String UPLOAD_FILE_TO_SERVER = "upload_file_to_server";
  static const String UPLOAD_FILE_FROM_SERVER = "upload_file_from_server";
  static const String QUESTION_SENT_TO_SERVER = "question_sent_to_server";
  static const String QUESTION_SENT_FROM_SERVER = "question_sent_from_server";
  static const String ANSWER_SENT_TO_SERVER = "answer_sent_to_server";
  static const String START_RECORDING = "start_recording";
  static const String STOP_RECORDING = "stop_recording";
  static const String IS_AUDIO_STREAM_ENABLED_TO_SERVER =
      "is_audio_stream_enabled_to_server";
  static const String IS_AUDIO_STREAM_ENABLED_FROM_SERVER =
      "is_audio_stream_enabled_from_server";
  static const String KICK_OUT_FROM_CLASS_TO_SERVER =
      "kick_out_from_class_to_server";
  static const String KICK_OUT_FROM_CLASS_FROM_SERVER =
      "kick_out_from_class_from_server";
  static const String PRODUCER_PAUSE = "producer_pause";
  static const String PRODUCER_RESUME = "producer_resume";
  static const String PRODUCER_PAUSED = "producer_paused";
  static const String PRODUCER_RESUMED = "producer_resumed";
  static const String PRODUCER_CLOSED = "producer-closed";
  static const String REPLACE_TRACK = "replace_track";
  static const String REPLACED_TRACK = "replaced_track";
  static const String LEAVE_ROOM = "leave_room";
  static const String END_MEET_TO_SERVER = "END_MEET_TO_SERVER";
  static const String END_MEET_FROM_SERVER = "END_MEET_FROM_SERVER";
  static const String CONNECT_ERROR = "connect_error";
  static const String LEADERBOARD_FROM_SERVER = "leaderboard_from_server";
  static const String LEADERBOARD_AVERAGE_ANSWER_FROM_SERVER =
      "leaderboard_average_answer_from_server";
  static const String BLOCK_OR_UNBLOCK_MIC_TO_SERVER =
      "block_or_unblock_mic_to_server";
  static const String BLOCK_OR_UNBLOCK_MIC_FROM_SERVER =
      "block_or_unblock_mic_FROM_server";
  static const String PEER_MIC_BLOCKED_OR_UNBLOCKED_FROM_SERVER =
      "peer_mic_blocked_or_unblocked_from_server";
  static const String MUTE_MIC_COMMAND_BY_MENTOR_TO_SERVER =
      "mute_mic_command_by_mentor_to_server";
  static const String MUTE_MIC_COMMAND_BY_MENTOR_FROM_SERVER =
      "mute_mic_command_by_mentor_from_server";
  static const String QUESTION_MSG_SENT_TO_SERVER =
      "question_msg_sent_to_server";
  static const String QUESTION_MSG_SENT_FROM_SERVER =
      "question_msg_sent_from_server";
  static const String POLL_TIME_INCREASE_TO_SERVER =
      "poll_time_increase_to_server";
  static const String POLL_TIME_INCREASE_FROM_SERVER =
      "poll_time_increase_from_server";
}
