import 'package:prectice_blog/data/dataSurses/user_remote_datasource.dart';
import 'package:prectice_blog/data/dataSurses/user_remote_datasource_impl.dart';
import 'package:prectice_blog/usecases/getdata.dart';
import '../repository/user_repository.dart';
import '../repository/user_repository_impl.dart';

class Injection {

  static UserRemoteDataSource userRemoteDataSource() {
    return UserRemoteDataSourceImpl();
  }

  static UserRepository userRepository() {
    return UserRepositoryImpl(
      userRemoteDataSource(),
    );
  }

  static GetUser getUser() {
    return GetUser(
      userRepository(),
    );
  }
}