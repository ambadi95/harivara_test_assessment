abstract class TaskResolver {
  Future<dynamic> execute(
    String identifier,
    Map<String, dynamic> requestData,
  );
}
