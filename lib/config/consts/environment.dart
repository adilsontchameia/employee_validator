import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static String docID = dotenv.env['DOC_ID'] ?? 'ID not found';

  //! This credential comes from Google Console Credential in json format
  static String googleConsoleCredential = r'''
{
  "type": "service_account",
  "project_id": "flutter-419310",
  "private_key_id": "c0ddcd1b53a4c7a9667cbef6559b7c87df34bce2",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDncxEVjVJiPpM5\nt2hn6HkfmjVH4OzE7NFLRNPI0RQRkfoZuG6sgfwAYvekQON+wrDBpEZ309vIDctq\nbj9DvO9DTY/UkPjWXgcDiw9t4NyYMe2YnbkkjHbCWueF4iFBh95R5lxRsc8PvHPJ\n5JR+CKvH/37JMsUnBxqxP+pwGQV5HxMNV9X6W4/b0t6FfaO0fuLpoEJvZbyE9Liq\nPQ3rKBjYQycpwEiFKAJhE3hIBQx5yO1Uf8/W1nk4kK/HX3hahECLU8vv8r//t6BQ\ndb8KMm1BZ9E0EixDScqwfDlgWGLEaUjj0jDqitNsRA1VouDo529CYcsC44SC80pg\nDqtWGYbdAgMBAAECggEAMx+LioMoy2KfCoSkny8OchiR5EqegfD9We7eCOGF2Uux\nPrUqXRhpHXy+zp02ou1GNb+fgSBez5WcdOndN40oHGmpd35+OHuUeQfiZJbiowuE\nO82684PDR7LkqQIF7n+gb96+TZ1E62jo+pNu6Vfo+chJrQ911OUQ1E4V7qTYPKRg\n5iGSFq5fqjhl8TbGZyydhHDJVeBs3tU2fNgnYAarYHnt/hEclhmu+F47ez+jc0J/\nxCuIltfgp8dcNz6CNiKkNJ+GVAr5toJL+CUnwRdxSGB+eJXntGSMZm21qTmCMIQf\nGJYabbTtLt7z3bFmQtOD73f0JP6Sj0xan6iaOxpy0QKBgQD9W8ePbH4B7ag3bOkt\nlFJX2xFUJbP6Yj12aM3ToBd72poe4gQVnw4yb0iLHPg/VEDhapHarkdGycvYIvmu\nk1f2Vh4ZlOR/An9hy0Ytg6CP1nONSvGqeK6yqKDZnr4FoQsRMdQ00yPjTqcHrTlA\nJ6uimt6Kw7i5j+AXJJzAGegI/wKBgQDp3M+5NzQYkNzEfpI0YDWDwJCGwFx4gr2s\nLzVKIqMxRbgOSwFDQNE3ZcgHYrx3XHXQPBGGe4bJvzKOhiT3dpZtBhppFDlfc2wf\nNgKm2UbFKG3iRf/AEh4D9ZG8BGTlfBpjC4Zic8wKt3czIX5IwMcaoBZSVr7a1Rn0\n+5Uc5fO0IwKBgGMISgP843A7hkJL9wVS8bDXt3lN14Dqf53WL4YmEKff9dhWfkQ5\nTOJX72I5K6wNceLqtiJldwTrght06GXdwEdQuClFst8WidYfD8pgphUzPS2gesAo\nthito1oNG7e1kE7jTFBtq5yBNPbiNfumxgckRBK3mHAoFe7V59OLDNDfAoGBAIOI\nCdzmS4q1jzWE6r5Cjla365Geh2PQRNWfB53WtWp1B/wh+2fUANfjiwl8YvvPKQQh\nhMnamAjIXKsEj64PKLPRBvGqykoBJQK44eztr3wcLRFixWFFz1PyvjC9V/IqRr0G\nMmMVNeGhJo2/fMN2iYVUHLnayCVUTfEXvtouC095AoGBAOrz0BAmGDUrssUMm3Yy\nKD6RQwFVwGLPevOn4aH8UVKSwFb2pTfCWTo3PLgv/uwwU8euvZfgk9pCdLPA8ScV\nAGVSiCr1xhtv4Y3VrTAzzXmd6jpT1iZiPRKVwnTkv9bJuSBCadaaW/YZwFz9+ng3\nKhAk2wHo+hkNF1F9nn+6ukjQ\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-sheets@flutter-419310.iam.gserviceaccount.com",
  "client_id": "108415065712998453966",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-sheets%40flutter-419310.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
}
