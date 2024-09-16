import 'package:flutter_boilerplate/data/models/base_error_response.dart';
import 'package:flutter_boilerplate/data/models/base_list_response.dart';
import 'package:flutter_boilerplate/data/models/error_detail_response.dart';
import 'package:flutter_boilerplate/data/models/meta_response.dart';
import 'package:flutter_boilerplate/data/models/token_model.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';
import 'package:flutter_boilerplate/data/models/user_payload.dart';
import 'package:flutter_boilerplate/data/models/user_type.dart';

const tTokenJson = {
  'accessToken': 'accessToken',
  'refreshToken': 'refreshToken',
};

const tTokenModel = TokenModel(
  accessToken: 'accessToken',
  refreshToken: 'refreshToken',
);

const tUserPayloadJson = {
  'username': 'username',
  'firstName': 'firstName',
  'lastName': 'lastName',
  'password': 'password',
};

const tUserPayload = UserPayload(
  username: 'username',
  firstName: 'firstName',
  lastName: 'lastName',
  password: 'password',
);

const tUserJson = {
  'id': 1,
  'username': 'username',
  'firstName': 'firstName',
  'lastName': 'lastName',
};

const tUserModel = UserModel(
  id: 1,
  username: 'username',
  firstName: 'firstName',
  lastName: 'lastName',
);

final tUserModels = [tUserModel];

const tUserSessionModel = UserModel(
  id: 1,
  username: 'username',
  firstName: 'firstName',
  lastName: 'lastName',
);

final tUserSessionModels = [tUserSessionModel];

const tUserType = UserType(
  id: 1,
  username: 'username',
  firstName: 'firstName',
  lastName: 'lastName',
);

final tUserAdapters = [tUserType];

const tMetaJson = {
  'page': 1,
  'totalData': 1,
  'totalPage': 1,
};

const tMetaResponse = MetaResponse(
  page: 1,
  totalData: 1,
  totalPage: 1,
);

const tErrorDetailJson = {
  'code': 'code',
  'detail': 'detail',
  'attr': 'attr',
};

const tErrorDetailResponse = ErrorDetailResponse(
  code: 'code',
  detail: 'detail',
  attr: 'attr',
);

const tBaseErrorJson = {
  'type': 'type',
  'errors': [tErrorDetailJson],
};

const tBaseErrorResponse = BaseErrorResponse(
  type: 'type',
  errors: [tErrorDetailResponse],
);

final tBaseListJson = {
  'meta': tMetaJson,
  'data': [tUserJson],
};

const tBaseListResponse = BaseListResponse<UserModel>(
  meta: tMetaResponse,
  data: [tUserModel],
);
