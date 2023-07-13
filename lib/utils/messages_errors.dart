import 'package:notebook/data/models/model_message_error.dart';

class ApppMessage {
// ignore: non_constant_identifier_names

  static final message_no_account = MessageError(
      title: 'Message erreur',
      content:
          '''Vous n'avez jamais une compte \n\nEssayez-vous créer une compte ? ''');
  static final message_have_account = MessageError(
      title: 'Message erreur',
      content:
          '''Vous avez une compte avec cet nom d'utilisateur \n\nEssayez-vous créer une compte pas avec cet d'utilisateur ? ''');
  static final message_auth = MessageError(
      title: "Message erreur", content: "Verfier votre  mot de passe");

  static final message_added_account =
      MessageError(title: "Valider", content: "Vous avez créé une compte !");
}
