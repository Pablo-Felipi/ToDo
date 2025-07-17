abstract class InterfaceClientHttp {
  Future getData({required String url});
  Future updateData({required String url, required Map<String, dynamic> data});
  Future createData({required String url, required Map<String, dynamic> data});
  Future deleteData({required String url, required int id});
}
