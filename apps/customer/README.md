# customer

CrayonPaymentpay

Steps to follow for Network Layer integration via rest method
Step1 - Register the dependencies for EnvironmentResolver, StorageService, CacheTaskResolver.

This can be done by creating a Future function _registerDependencies and calling it in void main().

Also in this function call NetworkManager.registerDependencies() to register the network dependency.

Step2 - Select the environment from the JSON file. To select the environment create a string variable networkConfigJson and pass the configuration in the form of string to this variable. Pass this networkConfigJson to Config.fromJson() to get the Config class initialized with the required data and the result will be stored in config variable networkConfig.

To do this create a Future function registerNetworkModule which will be called from the _registerDependencies function.

This registerNetworkModule will select the environment which will get passed into the initialize method when registering the dependency for GlobalControlNotifier.

Code snippet below:

Future registerNetworkModule({
  String? environment,
}) async {
  final networkConfigJson = await rootBundle.loadString('assets/configuration/network_configuration_dev.json');
  final networkConfig = Config.fromJson(jsonDecode(networkConfigJson) as Map<String, dynamic>);
  final mockNetworkClient = networkConfig.useMockNetworkClient ?? false;
  NetworkManager.registerDependencies(useMockNetworkClient: mockNetworkClient);

  await DIContainer.container.resolve<IConnectivity>().initialize();
  // ModuleResolver.registerResolver('app_account', AccountModuleResolver());

  // initialise dependencies
  DIContainer.container
      .resolve<GlobalControlNotifier>(NetworkManager.globalControlNotifierKey)
      .initialise(networkConfig);
}
Step3 - Create a Future function which will have a return type of NetworkStandardResponse named loginFromNetworkPkg().

Step4 - In that loginFromNetworkPkg function Create a instance of StandardRequest() say postRequest.

Step5 - Assign the request type, endpoint, json body, custom headers to postRequest. Code snippet below:

Step6 - Create a variable called client which will have the instance of network client through DIContainer and call standardRequest function which will take postRequest as the parameter. Code snippet below:

  Future<void> loginFromNetworkPkg() async {
    final postRequest = StandardRequest();
    postRequest.requestType = RequestType.POST;
    postRequest.endpoint = "v1/accounts:signInWithPassword?key=AIzaSyDQ3LipTP3RSbFOjlEXEeVzQs2gtq9b_VQ";
    postRequest.jsonBody = json.encode({"email": "test@yopmail.com", "password": "123456", "returnSecureToken": true});
    postRequest.customHeaders = {'Content-Type': 'application/json'};

    final client = DIContainer.container<INetworkClient>(
      NetworkManager.networkClientKey,
    );
    final response = await client.standardRequest(postRequest);
    print(response.body);
  }
Steps to follow for Network Layer integration via graphQL method
Step1 - In the void main() async add WidgetsFlutterBinding.ensureInitialized() to initialize the widgets binding.

Step2 - Create Future function _registerDependencies() and call it in the void main(). This function will register the dependency for the TaskManager, EnvironmentResolver, StorageService, CacheTaskResolver through DIContainer.

Code snippet below:

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _registerDependencies();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
Future _registerDependencies() async {
  DIContainer.container.registerSingleton((container) => TaskManager());
  DIContainer.container.registerSingleton<EnvironmentResolver>((container) => EnvironmentResolver());
  DIContainer.container.registerSingleton<StorageService>((container) => SecureStorageService());
  DIContainer.container.registerSingleton(
    (container) => CacheTaskResolver(
      secureStorageService: DIContainer.container<StorageService>(),
      fileStorageService: FileStorageServiceImpl(),
      unsecureStorageService: UnsecureStorageServiceImpl(),
      memoryStorageService: MemoryStorageServiceImpl(),
    ),
  );
  await registerNetworkModule();
}

Step3 - Create a function registerNetworkModule() in the _registerDependencies() and call it after registering all the above dependencies. Also register (or initialize) the dependency for GlobalControlNotifier using DIContainer. In this registerNetworkModule() function select the environment and pass the selected environment (or selected config) to the initializeGraphQLClient() function to initialize the config, accessTokens and headers for grapgQL.

Step4 - To select the environment create a string variable networkConfigJson and pass the configuration in the form of string to this variable. Pass this networkConfigJson to Config.fromJson() to get the Config class initialized with the required data and the result will be stored in config variable networkConfig. Now the networkConfig will be passed in initializeGraphQLClient() and GlobalControlNotifier().

Step5 - Call the ModuleResolver.registerResolver() which takes String and ModuleResolver as parameters. This will register the moduleIdentifier and ModuleResolver in the _resolverMap which is present in abstract class ModuleResolver in task manager pacakage. This step will call the LoginModuleResolver().

Code snippet below:

Future registerNetworkModule({
  String? environment,
}) async {
  final networkConfigJson = await rootBundle.loadString('assets/configuration/network_configuration_dev.json');
  final networkConfig = Config.fromJson(jsonDecode(networkConfigJson) as Map<String, dynamic>);
  final mockNetworkClient = networkConfig.useMockNetworkClient ?? false;
  NetworkManager.registerDependencies(useMockNetworkClient: mockNetworkClient);

  await DIContainer.container.resolve<IConnectivity>().initialize();
  // ModuleResolver.registerResolver('app_account', AccountModuleResolver());

  // initialise dependencies
  DIContainer.container
      .resolve<GlobalControlNotifier>(NetworkManager.globalControlNotifierKey)
      .initialise(networkConfig);
  initializeGraphQLClient(networkConfig);
  ModuleResolver.registerResolver('app_account', LoginModuleResolver());
  ModuleResolver.registerResolver('widgets', LoginModuleResolver());
}
code snippet for initializeGraphQLClient():

Future initializeGraphQLClient(Config config) async {
  final header = {
    'x-channel': 'x-channel',
    'x-correlation-id': 'x-correlation-id',
  };
  DIContainer.container<INetworkClient>('network_client').initializeGraphQlClient(
    config: config,
    accessToken: 'accessToken',
    headers: header,
  );
}
Step6 - Create a class LoginModuleResolver() which will overrides the taskResolver. It will contain a switch case which will call LoginAPITaskResolver() when the TaskType is DATA_OPERATION.

Step7 - Now create a class LoginAPITaskResolver() which implements the taskResolver which contains the execute menthod (which takes String apiIdentifier, Map<String, dynamic> requestData as parameters). This execute menthod will be called with the required data when loginFromGraphQL button is pressed.

Code snippet below:

class LoginModuleResolver implements ModuleResolver {
  static const moduleIdentifier = 'app_account';

  @override
  TaskResolver taskResolver(TaskType type) {
    switch (type) {
      case TaskType.DATA_OPERATION:
        return LoginAPITaskResolver();

      case TaskType.PROGRESS_INDICATOR:
        return LoginAPITaskResolver();

      default:
        // TODO: implement taskResolver
        throw UnimplementedError();
    }
  }
}
class LoginAPITaskResolver implements TaskResolver {
  @override
  Future execute(String apiIdentifier, Map<String, dynamic> requestData) {
    switch (apiIdentifier) {
      case 'default':
        return Future.value(
          (GraphQLService()).getGraphQLRequest(
            requestData,
          ),
        );
      case 'busy_modal_show':
        return Future.value(
          (GraphQLService()).getGraphQLRequest(
            requestData,
          ),
        );
      case 'busy_modal_hide':
        return Future.value(
          (GraphQLService()).getGraphQLRequest(
            requestData,
          ),
        );
      
      default:
        throw TaskManagerException('apiIdentifier does not match!');
    }
  }
}
Step8 - Create a NetworkResponseDataModel class which will contain fromJson and toJson functions. These functions will get the data from the endpoint(API). The code for these function will be generated by adding @JsonSerializable() and running flutter packages pub run build_runner build.

code snippet below:

part 'responseDataModel.g.dart';

class NetworkResponseDataModel implements BaseDataModel {
  GetData? getAccounts;

  NetworkResponseDataModel({this.getAccounts});

  @override
  void fromJsonToModel(Map<String, dynamic> value) {
    getAccounts =
        (value['countries'] != null ? GetData.fromJson(value['countries'] as List<dynamic>) : null)!;
  }
}

@JsonSerializable()
class GetData {
  List<dynamic>? name;

  GetData({
    this.name
  });

  factory GetData.fromJson(List<dynamic> json) => _$GetDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataToJson(this);
}

Step9 - Create a class GraphQLService which will contain a function getGraphQLRequest. Inside this function create 2 variables graphQLNetworkDataModel and request. Request will contain the data coming from the getQuery method. This getQuery function will return a string which will contain the data which we want to fetch. For example, suppose an API contains the data of all the countries name and capital and we want only countries names to be returned not the capital names. So the query will contain on countries as a string not the capital. Now pass the request and graphQLNetworkDataModel in the return GraphQLRequest().

code snippet below:

class GraphQLService {
  GraphQLRequest getGraphQLRequest(Map<String, dynamic> parameters) {
    final graphQLNetworkDataModel = NetworkResponseDataModel();
    final request = GraphQLQuery.getQuery(parameters);
    return GraphQLRequest(
      graphQLNetworkDataModel,
      request,
      GraphQlRequestType.query,
      name: 'default',
      cachePolicy: CachePolicy.OnDemand,
    );
  }
}
class GraphQLQuery {
  static String getQuery(Map<String, dynamic> parameters) {
  return '''
  query{
    countries {
      name
    }
  }
''';
  }
}

Step10 - Create a function loginWithGraphQL which will be called when the loginFromGraphQL button is pressed.

Step11 - Create a instance of _taskManager (final _taskManager = DIContainer.container()) and call the execute method. Put the result in a var variable say result. Get the response as (result as NetworkGraphQLResponse).baseModel as NetworkResponseDataModel;

code snippet below:

  Future loginWithGraphQL() async {
    var result = await _taskManager.execute(Task(
      apiIdentifier: 'default',
      requestData: {},
      taskType: TaskType.DATA_OPERATION,
      moduleIdentifier: 'app_account',
    ));
    final response = (result as NetworkGraphQLResponse).baseModel as NetworkResponseDataModel;
    print(response);
  }
}
**** To Run Base App with GraphQl integeration(locally) *****

1)Follow 'https://github.com/apollographql/federation-demo' installation 2)Start the server locally 3)Change you local IP address and port in network_configuration_dev.json file (refer code snippet below)

code snippet below:

"gqlEnvironments": [
    {
      "name": "default",
      "host": "Your IP address/port",
      "headers": {}
    },
    {
      "name": "mock",
      "host": "",
      "headers": {}
    }
  ],
Response for Account Dashboard Other Account gql query (refer below response):

{
"data": {
"topProducts": [
{
"name": "Account 1"
},
{
"name": "Account 2"
},
{
"name": "Account 3"
}
]
}
}

Base App Login Credentials:

Email : test@yopmail.com Pw : 123456


