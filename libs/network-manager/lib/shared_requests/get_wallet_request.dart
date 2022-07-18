import 'package:core/exceptions/exceptions.dart';
import 'package:shared_data_models/wallet/wallet.dart';
import 'package:network_manager/shared_services/get_wallets_service.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';

abstract class GetUsersWallet extends BaseDataProvider {
  GetUsersWallet(TaskManager taskManager) : super(taskManager);

  Future<Wallet?> getUsersWallet(String moduleIdentifier);
}

class GetUsersWalletImpl extends GetUsersWallet {
  GetUsersWalletImpl(TaskManager taskManager) : super(taskManager);

  @override
  Future<Wallet?> getUsersWallet(String moduleIdentifier) async {
    final result = await executeApiRequest<Wallet>(
      taskType: TaskType.DATA_OPERATION,
      taskSubType: TaskSubType.GRAPHQL,
      moduleIdentifier: moduleIdentifier,
      serviceIdentifier: IGetWalletService.getWalletsApiIdentifier,
      onError: (error) => GetGraphQlErrorException(error),
      modelBuilderCallback: (responseData) {
        return Wallet.fromJson(
          responseData[IGetWalletService.getWalletsApiIdentifier]
              as Map<String, dynamic>,
        );
      },
    );
    return result;
  }
}
