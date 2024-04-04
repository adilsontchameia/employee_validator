import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import 'domain/domain.dart';

class GoogleSheetApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "vernal-verve-374913",
  "private_key_id": "65d5d9a7274bb3980f15e2cbd4f458c6b52a0bcd",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDqXQlepElErZrM\nI9HCuc9vWYIR9WbNbm0G2L1QkMh7f6uXQ0I9Y/e9bgT2Ssb67PxeJqMd94pJosRB\nZ6nVjLxGuM1tb+pRVYVq6+bKQIj+uhwbe5FwXZu3rYClxG3Q4rtmvwHJrwiBUyRZ\nSXaii/8Q0tRHJ5mJrr/NTGOLJ6wM2+LwxLyyDfQjfSFtBnBAgUffU9nuWZtVeT4J\nEteD6KT6crB6lWkleSJoqyNFfuIEZ6c3xPXe0wVYJUEygi3zciFkDxxRYVKG7PFd\nrK+NQQRJEas1ePNyzUl9r26T0pSwUfcRgW9ZVsTg/gziRSsLtQTYIRaa5/MEZjpP\ngPZsvSidAgMBAAECggEAEyCcPOfqHeuQTHRo8HxTQHp86ePOK9qFFe+3Bb4HSsMI\n+VuxKor/42s5BvPj6QNR9oovOmkjVW6uF0tzWj01+YyoIXQmmtRAwxD1QVECjU2Z\nsSmE3XeaV6OWshDFyKxUkKZqqi/5oPps50eeYdZMry4Ryqvh9VF4kHQZVLhca6EX\nmL1PTqspifD+zvDpFsF7EB3n6KnjcvirB20ThEO7ZDARAQrxJYiOeDvKkb3Ovxck\n9iTfieei6JedvI93xAFrlHY8DzsDydwK2oFyAyQES8OAS+cHIFjm8It61N3Tw+lO\nz+9uLLp5AbUCOY/2K/zEYs3pRWYQ7QikAOWZ9XxsuQKBgQD3gfxdRBQPo1mwfZnN\nKop83ZAGDkGkAkfcA2xCi2jJjSUKMhPgtW2000aUt9nVmd4MMbK6GLS5iZa9lfFt\nNrRB03zb9Pbf/ZA1OZ6NbCVLX8hc8Rxp924gLsm4f1XTTuB9XVsKQErQ1nultGx6\nIyRSrN5p4jSpRqvK9V2gGaZAiQKBgQDyZ5iRlvJ53y2WfFq/UPM/eTqnqOs416Hn\n1reip6ASkULrWrU9CGcI/QljzJ/kWVADd8xlBHAToVmlqy1pkg1a/lzieFbrP+on\n6TgMG921Z2lYojoA5AglqUmzPVdz8Oex59Q2EPBlzLIBNNlo5B30J6H2sFUUroRc\nimnYJSXadQKBgANO7XyhqFL9L/m39BJV+zvoCkDKd/4lOairMwtAqcnn5RLZ0II0\nap78I/lg67x7LgijsWvjYKcKO8WU94EqNgabORQHljUwQnkzp/bj9yumwBrd7i9M\na2Bqv6+DpDYK291RHiJo8ZcRBt4UJ08KoTWpsd9gcqvAkhNIbFPzg9FhAoGAL8fH\nxPrR9L/PBpigcpGMQPiuXRnos52dZktmiwMrhD1pyWZpzwv280idLzTIV4RbRzO3\n8Dl9tgDZ4NPq8aI+S69Ts7gwudIxX4iS6aAchYNKupPPhxlrmbDSvCfdMxdLNEAU\nDkwsdoRwmdhG+mvsk5G0VSHQw3Da2jrWPiqkWXkCgYEAzrbjyAxJkFof1ivCZ4De\nISVCoQAESpVOXl9RSMg3mMS3YxVejGhmVCaEFfY5vIq73TH846hrk6ysKKtLQmIW\n9Uv0RQA/eQTkCsxwaSRbtm7b9/HIgkEBd3gFutjyHbsDE9rKouQVnu78onasGzOX\nhKpg2iKcsL2w8ZFzcxKUxKg=\n-----END PRIVATE KEY-----\n",
  "client_email": "haloinssvalidator@vernal-verve-374913.iam.gserviceaccount.com",
  "client_id": "101174925561001918001",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/haloinssvalidator%40vernal-verve-374913.iam.gserviceaccount.com"
}
''';
  static const _spreadsheetid = '1JmRJIaYtWgB--qSA9oeaMPahGcPKs8YoFOV6vDE1QFA';
  static final _gsheet = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheet.spreadsheet(_spreadsheetid);
      _userSheet = await _getWorkSheet(
        spreadsheet,
        title: 'Halo Master Insurance List',
      );
    } catch (e) {
      debugPrint('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      //Will create the spreadsheet if it does not exists.
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      //If it's created will shall work normally.
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  //Method to the information byId
  static Future<Staff?> getById(int id) async {
    if (_userSheet == null) return null;
    final json = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
    //Convert the json data to employee data
    return json == null ? null : Staff.fromJson(json);
  }

  //Retrieve Staff List - All Master Insurance
  static Future<List<Staff>> getAll() async {
    if (_userSheet == null) return <Staff>[];
    final staff = await _userSheet!.values.map.allRows();
    return staff == null ? <Staff>[] : staff.map(Staff.fromJson).toList();
  }
}
