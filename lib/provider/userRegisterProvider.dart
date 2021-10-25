import 'dart:convert';
import 'dart:math';
import 'package:bravo/exceptions/http_exception.dart';
import 'package:http/http.dart' as http;
import 'package:bravo/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:bravo/models/userRegister.dart';
import 'package:flutter/material.dart';

class UserRegisterProvider with ChangeNotifier {
  late final String _token;
  late final String _userId;
  List<UserRegister> _items = [];

  List<UserRegister> get items => [..._items];

  UserRegisterProvider([
    this._token = '',
    this._userId = '',
    this._items = const [],
  ]);

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    _items.clear();

    final response = await http.get(
      Uri.parse('${Constants.PRODUCT_BASE_URL}.json?auth=$_token'),
    );
    if (response.body == 'null') return;

    final favResponse = await http.get(
      Uri.parse(
        '${Constants.USER_FAVORITES_URL}.json?auth=$_token',
      ),
    );

    Map<String, dynamic> favData =
        favResponse.body == 'null' ? {} : jsonDecode(favResponse.body);

    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((userId, userData) {
      final isFavorite = favData[userId] ?? false;
      _items.add(
        UserRegister(
          id: userId,
          name: userData['name'],
          sex: userData['sex'],
          birthDay: userData['birthDay'],
          naturalidade: userData['naturalidade'],
          escolaridade: userData['escolaridade'],
          nameMother: userData['nameMother'],
          nameFather: userData['nameFather'],
          cep: userData['cep'],
          endereco: userData['endereco'],
          complemento: userData['complemento'],
          bairro: userData['bairro'],
          cidade: userData['cidade'],
          unidadefederativa: userData['unidadefederativa'],
          cpf: userData['cpf'],
          identidade: userData['identidade'],
          emissor: userData['emissor'],
          dateEmissao: userData['dateEmissao'],
          ddd: userData['ddd'],
          numbertelephone: userData['numbertelephone'],
          email: userData['email'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> saveUser(Map<String, Object> userData) {
    bool hasId = userData['id'] != null;

    final product = UserRegister(
      id: hasId ? userData['id'] as String : Random().nextDouble().toString(),
      name: userData['name'] as String,
      sex: userData['sex'] as String,
      birthDay: userData['birthDay'] as DateTime,
      naturalidade: userData['naturalidade'] as String,
      escolaridade: userData['escolaridade'] as String,
      nameMother: userData['nameMother'] as String,
      nameFather: userData['nameFather'] as String,
      cep: userData['cep'] as String,
      endereco: userData['endereco'] as String,
      complemento: userData['complemento'] as String,
      bairro: userData['bairro'] as String,
      cidade: userData['cidade'] as String,
      unidadefederativa: userData['unidadefederativa'] as String,
      cpf: userData['cpf'] as String,
      identidade: userData['identidade'] as String,
      emissor: userData['emissor'] as String,
      dateEmissao: userData['dateEmissao'] as DateTime,
      ddd: userData['ddd'] as String,
      numbertelephone: userData['numbertelephone'] as String,
      email: userData['email'] as String,
    );

    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> addProduct(UserRegister users) async {
    final response = await http.post(
      Uri.parse('${Constants.PRODUCT_BASE_URL}.json?auth=$_token'),
      body: jsonEncode(
        {
          "name": users.name,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(UserRegister(
      id: id,
      name: users.name,
    ));
    notifyListeners();
  }

  Future<void> updateProduct(UserRegister product) async {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      await http.patch(
        Uri.parse(
          '${Constants.PRODUCT_BASE_URL}/${product.id}.json?auth=$_token',
        ),
        body: jsonEncode(
          {
            "name": product.name,
          },
        ),
      );

      _items[index] = product;
      notifyListeners();
    }
  }

  Future<void> removeProduct(UserRegister product) async {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      final product = _items[index];
      _items.remove(product);
      notifyListeners();

      final response = await http.delete(
        Uri.parse(
          '${Constants.PRODUCT_BASE_URL}/${product.id}.json?auth=$_token',
        ),
      );

      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException(
          msg: 'Não foi possível excluir o produto.',
          statusCode: response.statusCode,
        );
      }
    }
  }
}
