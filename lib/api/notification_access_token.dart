import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? _token;

  //to generate token only once for an app run
  static Future<String?> get getToken async => _token ?? await _getAccessToken();

  // to get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope =
          'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "chathub-593f3",
          "private_key_id": "d9fb565b6be6e3374c3c6279e38ccfdc1f312dd4",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC5JZCM6ru6lo88\nfFTkFihdwDJWotkSCAWuRFA1SkqSHQ6qX8xgNHEqkFnzTSoq+OJQo/VbF71g4rKn\nI1CCQst0Y80U3wbhMMUdDheAgeabpPVdsrjlimGURctT6OBqOjbJ2QfE6wTp3ayx\nbBJSs2OQEZAEK/22EoR0xDRqvZxW/DLYoXnbxnUoSVvas/GuAHnx84gCyw7b28l9\nBCaB1A76fuofuH535xYKQl8lMvJhLpZLwF/eKAuuxBxY/gr99fQjXcJ5SLf7yvsi\nuGue2KdNQEQeNcoNsRlA6cw8IFCJ+/NReMnJQPm2925uVc8Gyh7Grb0yX3fUWjT8\nkPFzKDBpAgMBAAECggEACjGNhRiqZ9JAxh+BTAKFS+4YR2lVYrcC2w6jTN/Pfb5w\nT4SRO82/WkzSywC5XN7RlQeF63NB57rrg6S/2sAjNAAHq0nBNvZIr/oV5KsiP3kE\nUlmT8P1etHtoP7EvY+HbIN9cXGTlIxwjlSwiUR/T0DuLTpN+dz8LQGOKEENqv2Yw\nug86PVCg2whca+9yxGcktZxUyn5RVXPlBFjrbf+KPMPTsVu5oUNohIGbU7hneNm9\nzy+XcXjpurrZqsyZhO/opXbqsXPNPU8mXtrqN1hnzT0efDRhUMUOdsGuTqGvHKmD\npeasnNyZVcnIx1TsdvaE6sj60Q2Av0c2Gaxf6L7ZFQKBgQDrLkGSxFKMx3cYWEpv\n7disrUs4Hq5PE/zQN/iSk1S+Px14eYMAc4SpO9MvK0T/sVqvqkcsztSl+NYqUynO\nT+L6JOzJW61Q734OR5cF//h3ZR8ZZ6EQQI7f8yQGR8f8QTSnljYJHOmHxqADJhAI\n842l2xyCZhIKHTcosCNIp4VCJQKBgQDJiWwaNP6VDjRDvJlh+en2VFEEU1oUIxg2\nrR0MCRrsmhnpwIBO7QWfRksD9wondFcJs8R3d6pv1BOyg2OVao3RZxFyjachgriu\n6uVwvbZDjJyQ37SG66saOU+13Mpuwk3ql1sNMEpykVCxJADlrEqCy8ETxikU50K8\nNLKmpAdn9QKBgAye7dvvdzKg3a5LxqrdC7ywjBHV66rIus99wXQ0Pd77yhwWAUa7\n7EmcsUedvdUu8lvs+mbYLqc9hFi/H8Y3mUmtQ5vGtLVcNNqVUvB6fR4DKjkVy5nw\nrPottSg1H/FUmnvH3tx8Vbf4m8uvdjrUvyxAZvZEfgFW8gfX8/zJKKiVAoGBAItu\nTOEQuvUqv5QBfmife3NVwDtq4049PXpOaGM0RXFd6AGlkd+I8jPQcQPMPTUwsyre\nOVWh78OwiPQfHJ15+6XdVd/YCsIPa3BwyM4oIlo3hPZiHsadc2IQNoqOt2rLeRaN\nIoxMVaVPzfDQBOLhQSeeifUBStjQaoZFOzg5EXqlAoGBAMCSs7HrK4+q+4/044lo\n3v0lN5bGBPl0GyKp8fgDLmOFnfAEmDTB+3BCQsAkFq9S0rHk7T2ZFlbJVqQXJ8vg\ndFTjcYtw7luScVvHzcM0BfJoQbWS7q2aOD9VfsQCajrRp109YMIeJTLz5VVouFS9\nzuDMQQ28K1rYiuxkzef2snwd\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-5odb9@chathub-593f3.iam.gserviceaccount.com",
          "client_id": "104801466858663652426",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-5odb9%40chathub-593f3.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
