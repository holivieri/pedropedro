final Map<String, dynamic> aerosmith = {
  'id': '0c8f991c-2268-433d-a413-fb2e58966207',
  'name': 'Aerosmith',
  'bio': '',
  'pictureUrl': '',
  'createdDate': '2022-10-10',
  'followers': 200,
  'deleted': false,
  'sponsored': true,
  'coverPicture': '',
  'genres': [
    {'id': '1d752e67-d4f6-4d9f-b5af-d5731bb39b50', 'name': 'rock'}
  ],
  'albums': [],
  'posts': [],
  'users': [],
  'concerts': []
};

final Map<String, dynamic> theBeatles = {
  'id': '0c8f991c-2268-433d-a413-fb2e58966207',
  'name': 'The Beatles',
  'bio': '',
  'pictureUrl': '',
  'createdDate': '2022-09-02',
  'followers': 4000,
  'deleted': false,
  'sponsored': false,
  'coverPicture': '',
  'genres': [
    {'id': '1d752e67-d4f6-4d9f-b5af-d5731bb39b50', 'name': 'rock'}
  ],
  'albums': [],
  'posts': [],
  'users': [],
  'concerts': []
};

final List<Map<String, dynamic>> notifications = [
  {
    'id': '208fb0fe-cda7-4932-abd8-21f98874e005',
    'title': 'Ejemplo Notificacion',
    'category': 'Categoria 1',
    'message': 'esto es un ejemplo de una notificacion',
    'deleted': false,
    'createdDate': '2023-02-14T00:18:06.78Z'
  }
];

final List<Map<String, dynamic>> countries = [
  {'id': 'be52f650-bb3e-4e89-81d6-4b349e1fe627', 'name': 'Argentina'},
  {'id': '8626f476-88e6-4c0f-8616-b399fcaab771', 'name': 'Brasil'},
  {'id': 'f0acbca5-ef61-47af-9817-52d9c233cb3d', 'name': 'Colombia'},
];

final List<Map<String, dynamic>> places = [
  {
    'id': 'bd0f8686-2ac5-44e4-b1d8-86ec36be016c',
    'name': 'Arena Rock',
    'description': 'Un lugar de encuentro en el mundo del jazz.',
    'phoneNumber': '4544-7744',
    'createdDate': '2023-02-10T13:21:44.4736761Z',
    'totalCapacity': 45,
    'seats': 23,
    'standing': 22,
    'streetName': 'Talcahuano 1117',
    'city': 'Buenos Aires',
    'province': 'CABA',
    'country': {
      'id': '0c8f991c-2268-433d-a413-fb2e58966207',
      'name': 'Argentina'
    },
    'coverPicture':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIxrFA-ouzKIGOBdHVSGpX9mq67lHG3vnIrg&usqp=CAU',
    'likes': 88,
    'dislikes': 1,
    'latLng': {
      'coordinateSequence': {
        'dimension': 4,
        'measures': 1,
        'spatial': 3,
        'ordinates': 65543,
        'hasZ': true,
        'hasM': true,
        'zOrdinateIndex': 2,
        'mOrdinateIndex': 3,
        'count': 1
      },
      'coordinates': [
        {'m': 'NaN', 'z': 'NaN', 'x': -34.595245, 'y': -58.385755}
      ],
      'numPoints': 1,
      'isEmpty': false,
      'dimension': 0,
      'boundaryDimension': -1,
      'x': -34.595245,
      'y': -58.385755,
      'coordinate': {'m': 'NaN', 'z': 'NaN', 'x': -34.595245, 'y': -58.385755},
      'geometryType': 'Point',
      'ogcGeometryType': 1,
      'boundary': [],
      'z': 'NaN',
      'm': 'NaN',
      'factory': {
        'precisionModel': {
          'isFloating': true,
          'maximumSignificantDigits': 16,
          'scale': 0.0,
          'precisionModelType': 0
        },
        'coordinateSequenceFactory': {'ordinates': 65543},
        'srid': 4326,
        'geometryServices': {
          'geometryOverlay': {},
          'coordinateEqualityComparer': {},
          'defaultSRID': -1,
          'defaultCoordinateSequenceFactory': {'ordinates': 65543},
          'defaultPrecisionModel': {
            'isFloating': true,
            'maximumSignificantDigits': 16,
            'scale': 0.0,
            'precisionModelType': 0
          }
        }
      },
      'srid': 4326,
      'precisionModel': {
        'isFloating': true,
        'maximumSignificantDigits': 16,
        'scale': 0.0,
        'precisionModelType': 0
      },
      'numGeometries': 1,
      'isSimple': true,
      'isValid': true,
      'area': 0.0,
      'length': 0.0,
      'envelopeInternal': {
        'isNull': false,
        'width': 0.0,
        'height': 0.0,
        'diameter': 0.0,
        'minX': -34.595245,
        'maxX': -34.595245,
        'minY': -58.385755,
        'maxY': -58.385755,
        'area': 0.0,
        'minExtent': 0.0,
        'maxExtent': 0.0,
        'centre': {'x': -34.595245, 'y': -58.385755, 'z': 'NaN', 'm': 'NaN'}
      },
      'isRectangle': false
    },
    'deleted': false,
    'sponsored': true
  },
  {
    'id': 'f5ea7906-98f2-4569-8225-c4a397763ac4',
    'name': 'Club Nite',
    'description':
        'Club Nite es una parte fundamental del rock nacional. Por sus escenarios parasaron artistas de la talla de Gustavo Cerati, Pedro Aznar y Charly Garcia.',
    'phoneNumber': '4444-4888',
    'createdDate': '2023-02-10T13:21:44.4736721Z',
    'totalCapacity': 117,
    'seats': 77,
    'standing': 40,
    'streetName': 'Av Rivadavia 4222',
    'city': 'Buenos Aires',
    'province': 'CABA',
    'country': {
      'id': '0c8f991c-2268-433d-a413-fb2e58966207',
      'name': 'Argentina'
    },
    'coverPicture':
        'https://images.unsplash.com/photo-1572116469696-31de0f17cc34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmFyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'likes': 199,
    'dislikes': 3,
    'latLng': {
      'coordinateSequence': {
        'dimension': 4,
        'measures': 1,
        'spatial': 3,
        'ordinates': 65543,
        'hasZ': true,
        'hasM': true,
        'zOrdinateIndex': 2,
        'mOrdinateIndex': 3,
        'count': 1
      },
      'coordinates': [
        {'m': 'NaN', 'z': 'NaN', 'x': -58.425269, 'y': -34.613315}
      ],
      'numPoints': 1,
      'isEmpty': false,
      'dimension': 0,
      'boundaryDimension': -1,
      'x': -58.425269,
      'y': -34.613315,
      'coordinate': {'m': 'NaN', 'z': 'NaN', 'x': -58.425269, 'y': -34.613315},
      'geometryType': 'Point',
      'ogcGeometryType': 1,
      'boundary': [],
      'z': 'NaN',
      'm': 'NaN',
      'factory': {
        'precisionModel': {
          'isFloating': true,
          'maximumSignificantDigits': 16,
          'scale': 0.0,
          'precisionModelType': 0
        },
        'coordinateSequenceFactory': {'ordinates': 65543},
        'srid': 4326,
        'geometryServices': {
          'geometryOverlay': {},
          'coordinateEqualityComparer': {},
          'defaultSRID': -1,
          'defaultCoordinateSequenceFactory': {'ordinates': 65543},
          'defaultPrecisionModel': {
            'isFloating': true,
            'maximumSignificantDigits': 16,
            'scale': 0.0,
            'precisionModelType': 0
          }
        }
      },
      'srid': 4326,
      'precisionModel': {
        'isFloating': true,
        'maximumSignificantDigits': 16,
        'scale': 0.0,
        'precisionModelType': 0
      },
      'numGeometries': 1,
      'isSimple': true,
      'isValid': true,
      'area': 0.0,
      'length': 0.0,
      'envelopeInternal': {
        'isNull': false,
        'width': 0.0,
        'height': 0.0,
        'diameter': 0.0,
        'minX': -58.425269,
        'maxX': -58.425269,
        'minY': -34.613315,
        'maxY': -34.613315,
        'area': 0.0,
        'minExtent': 0.0,
        'maxExtent': 0.0,
        'centre': {'x': -58.425269, 'y': -34.613315, 'z': 'NaN', 'm': 'NaN'}
      },
      'isRectangle': false
    },
    'deleted': false,
    'sponsored': true
  }
];

final List<Map<String, dynamic>> genres = [
  {
    'id': 'c1cc2ea1-f081-499c-9044-2249833b6576',
    'name': 'Alternativa',
    'coverPicture': ''
  },
  {
    'id': '2d7d39fe-7b45-49aa-aab4-995944f8bb34',
    'name': 'Blues',
    'coverPicture':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNACXxp-dtGyFNXE78JGaFwJWZEx64GZuSpg&usqp=CAU'
  }
];

final List<Map<String, dynamic>> concertsList = [
  {
    'id': 'c5893795-186a-437c-ae4d-8b3e3fec9fcb',
    'date': '2023-03-17T00:00:00Z',
    'place': {
      'id': 'bd0f8686-2ac5-44e4-b1d8-86ec36be016c',
      'name': 'Arena Rock',
      'description': 'Un lugar de encuentro en el mundo del blues.',
      'phoneNumber': '4544-7744',
      'createdDate': '2023-02-10T13:21:44.4736761Z',
      'totalCapacity': 45,
      'seats': 23,
      'standing': 22,
      'streetName': 'Talcahuano 1117',
      'city': 'Buenos Aires',
      'province': 'CABA',
      'country': {
        'id': '0c8f991c-2268-433d-a413-fb2e58966207',
        'name': 'Argentina'
      },
      'coverPicture':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIxrFA-ouzKIGOBdHVSGpX9mq67lHG3vnIrg&usqp=CAU',
      'likes': 88,
      'dislikes': 1,
      'latLng': {
        'coordinateSequence': {
          'dimension': 4,
          'measures': 1,
          'spatial': 3,
          'ordinates': 65543,
          'hasZ': true,
          'hasM': true,
          'zOrdinateIndex': 2,
          'mOrdinateIndex': 3,
          'count': 1
        },
        'coordinates': [
          {'m': 'NaN', 'z': 'NaN', 'x': -34.595245, 'y': -58.385755}
        ],
        'numPoints': 1,
        'isEmpty': false,
        'dimension': 0,
        'boundaryDimension': -1,
        'x': -34.595245,
        'y': -58.385755,
        'coordinate': {
          'm': 'NaN',
          'z': 'NaN',
          'x': -34.595245,
          'y': -58.385755
        },
        'geometryType': 'Point',
        'ogcGeometryType': 1,
        'boundary': [],
        'z': 'NaN',
        'm': 'NaN',
        'factory': {
          'precisionModel': {
            'isFloating': true,
            'maximumSignificantDigits': 16,
            'scale': 0.0,
            'precisionModelType': 0
          },
          'coordinateSequenceFactory': {'ordinates': 65543},
          'srid': 4326,
          'geometryServices': {
            'geometryOverlay': {},
            'coordinateEqualityComparer': {},
            'defaultSRID': -1,
            'defaultCoordinateSequenceFactory': {'ordinates': 65543},
            'defaultPrecisionModel': {
              'isFloating': true,
              'maximumSignificantDigits': 16,
              'scale': 0.0,
              'precisionModelType': 0
            }
          }
        },
        'srid': 4326,
        'precisionModel': {
          'isFloating': true,
          'maximumSignificantDigits': 16,
          'scale': 0.0,
          'precisionModelType': 0
        },
        'numGeometries': 1,
        'isSimple': true,
        'isValid': true,
        'area': 0.0,
        'length': 0.0,
        'envelopeInternal': {
          'isNull': false,
          'width': 0.0,
          'height': 0.0,
          'diameter': 0.0,
          'minX': -34.595245,
          'maxX': -34.595245,
          'minY': -58.385755,
          'maxY': -58.385755,
          'area': 0.0,
          'minExtent': 0.0,
          'maxExtent': 0.0,
          'centre': {'x': -34.595245, 'y': -58.385755, 'z': 'NaN', 'm': 'NaN'}
        },
        'isRectangle': false
      },
      'deleted': false,
      'sponsored': true
    },
    'artist': {
      'id': 'c5c81a4b-b994-45f1-8169-50e867ab62c4',
      'createdDate': '2023-02-10T21:21:44.4736879Z',
      'name': 'Cadena Perpetua',
      'bio':
          'Banda que surge en los sotanos del bajo Flores, cuando un grupo de amigos se junta a celebrar la prision domiciliaria de un entrañable del rock barrial.',
      'pictureUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOWx6qhLanoAcmkfVaSS2aGF1AHPhadAWp_iBX84YTTlPG0e2DreIcykftE_5rWCfwAN4&usqp=CAU',
      'genres': [
        {
          'id': 'b76845a8-2294-418c-8fc4-530912d1f891',
          'name': 'Metal',
          'coverPicture': '',
          'artists': []
        }
      ],
      'concerts': [],
      'albums': [],
      'posts': [],
      'followers': 121,
      'twitterAccount': '@cadenaperpetua',
      'facebookAccount': 'cadenaperpetua',
      'youTubeAccount': 'CadenaPerpetua',
      'spotifyAccount': '@cadenaPerpetua',
      'managerName': 'Ariel Sanchez',
      'managerContact': '15-4444-5555',
      'deleted': false,
      'sponsored': true
    },
    'attendants': []
  }
];
