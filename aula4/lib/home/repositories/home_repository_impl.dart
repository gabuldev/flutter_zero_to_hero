import 'package:aula4/shared/constants.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _client = HasuraConnect(HASURA_URL);

  @override
  Future<List<Map>> getTarefas() async {
    final response = await _client.query('''
    query {
        posts {
          id
          name
          photo
        }
    }
    ''');
    return (response['data']['posts'] as List)
        .map((e) => {"name": e['name']})
        .toList();
    //{"name": e.data['name']}
  }

  @override
  Stream<List<Map>> streamTarefas() {
    return _client.subscription('''
      subscription{
  posts {
    id
    name
    photo
  }
}
''').map((e) => (e['data']['posts']
            as List)
        .map((e) => {"name": e['name']})
        .toList());
  }
}
