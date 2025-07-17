abstract class InterfaceTodoRepositories {
  Future getData();
  Future updateData({required Map<String, dynamic> data});
  Future createData({required Map<String, dynamic> data});
  Future deleteData({required int id});
}
