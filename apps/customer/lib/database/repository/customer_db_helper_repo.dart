
import 'package:crayon_payment_customer/database/model/customer_data_model.dart';
import 'package:crayon_payment_customer/database/provider/dao/customer_dao.dart';
import 'package:crayon_payment_customer/database/provider/database_provider.dart';
import 'package:crayon_payment_customer/database/repository/customer_repo.dart';

class CustomerDBHelperRepo implements CustomerRepository {
  final customerDao = CustomerDao();
  static final _instance = CustomerDBHelperRepo._internal();
  static CustomerDBHelperRepo customerDBRepositoryInstance = _instance;

  @override
  DatabaseProvider? databaseProvider = DatabaseProvider.get;

  CustomerDBHelperRepo._internal();

  @override
  Future<CustomerData> insert(CustomerData customerData) async {
    final db = await databaseProvider!.db();
    List<CustomerData> customerDataList= await getCustomerDataFromNIDANumber(customerData.nidaNumber!);
    if(customerDataList.isNotEmpty==true){
      return customerDataList.first;
    }else{
      customerData.id = await db.insert(customerDao.tableName, customerDao.toMap(customerData));
      return customerData;

    }
  }

  @override
  Future<CustomerData> delete(CustomerData customerData) async {
    final db = await databaseProvider!.db();
    await db.delete(customerDao.tableName,
        where: '${customerDao.nidaNumber} = ?',
        whereArgs: [customerData.nidaNumber],);
    return customerData;
  }

  @override
  Future<CustomerData> update(CustomerData customerData) async {
    final db = await databaseProvider!.db();
    await db.update(customerDao.tableName, customerDao.toMap(customerData),
        where: '${customerDao.id} = ?', whereArgs: [customerData.id],);
    return customerData;
  }

  @override
  Future<List<CustomerData>> getCustomerDataList() async {
    final db = await databaseProvider!.db();
    List<Map<String, dynamic>> maps = await db.query(customerDao.tableName);
    return customerDao.fromList(maps);
  }

  @override
  Future<List<CustomerData>> getCustomerDataFromNIDANumber(
      String nidaNumber) async {
    final db = await databaseProvider!.db();
    List<Map<String, dynamic>> maps = await db.query(customerDao.tableName,
        where: '${customerDao.nidaNumber} = ?',
        whereArgs: [nidaNumber],);
    return customerDao.fromList(maps);
  }
}
