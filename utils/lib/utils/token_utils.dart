
import 'package:models/model/models.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenUtils{

  static JwtTokenDecodeDTO decodeToken(String token){
    Map<String, dynamic> map = JwtDecoder.decode(token);
    return JwtTokenDecodeDTO.fromJson(map);
  }

}