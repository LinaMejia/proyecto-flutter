const String DATABASE_NAME = 'rym_space.db';

const String CREATE_RYM_TABLE = '''
    create table rym_characters (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      status TEXT,
      gender TEXT,
      location TEXT,
      URL TEXT
      

    )
''';

const String CREATE_RYM_EPISODES_TABLE = '''
    create table rym_episodes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      air_date TEXT,
      episode TEXT,
      characters TEXT,
      URL TEXT,
      created TEXT    

    )
''';


Insert episode List

Get Episode List