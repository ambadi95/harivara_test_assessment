

import 'package:crayon_payment_customer/database/model/customer_data_model.dart';
import 'package:crayon_payment_customer/database/provider/database_provider.dart';

abstract class CustomerRepository {
  DatabaseProvider? databaseProvider;

  Future<CustomerData> insert(CustomerData customerData);

  Future<CustomerData> update(CustomerData customerData);

  Future<CustomerData> delete(CustomerData customerData);

  Future<List<CustomerData>> getCustomerDataList();

  Future<List<CustomerData>> getCustomerDataFromNIDANumber(String customerData);
}
