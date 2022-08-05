enum TaskType {
  APP_LAUNCH_DATA_OPERATION,
  DATA_OPERATION,
  CACHE_OPERATION,
  IDENTITY_VERIFICATION, // Use this to initiate the onfido kyc flow
  PROGRESS_INDICATOR,
  ENVIRONMENT, // Use this for any environment related tasks
  ANALYTICS,
  DATA_NOTIFIER,
  LOG,
  USER_SESSION
}

enum TaskSubType { REST, GRAPHQL }

/// use this key to set the cache type in the request data
const CACHE_TYPE = 'CACHE_TYPE';

enum TaskManagerCacheType {
  SET,
  GET,
  CLEAR,
  SECURE_SET,
  SECURE_GET,
  MEMORY_SET,
  MEMORY_GET,
  MEMORY_CLEAR,
  MEMORY_CLEAR_ALL,
  WRITE_FILE,
  DELETE_FILE,
  APPEND_TO_FILE,
  GET_FILE,
  DELETE_ALL,
}

const DATA_TASK_LIST = 'taskList';
const DATA_KEY = 'dataKey';
const DATA_NOTIFIER_TYPE_KEY = 'dataNotifierTypeKey';
const DATA_NOTIFIER_STATUS_KEY = 'dataNotifierStatusKey';
const DATA_NOTIFIER_PARAM_VALUES = 'dataNotifierParamValues';
const DATA_NOTIFIER_PARAM_KEY = 'dataNotifierParamKey';
const DATA_NOTIFIER_STREAM_CONTROLLER_KEY = 'streamController';

enum DataNotifierTaskType { SET, ADD, DELETE, DELETE_ALL }

enum DataNotifierStatus { REFRESH }

class Task {
  TaskType taskType;
  TaskSubType subType;
  String moduleIdentifier;
  String apiIdentifier;
  String? maskedApiIdentifier;
  Map<String, dynamic> requestData;

  Task({
    this.apiIdentifier = '',
    this.maskedApiIdentifier,
    this.subType = TaskSubType.GRAPHQL,
    required this.requestData,
    required this.taskType,
    this.moduleIdentifier = '',
  });
}
