// lib/services/firestore_service.dart
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final _fire = FirebaseFirestore.instance;

  /// Call this once during development (after Firebase init).
  /// It checks whether collections have data and seeds them if empty.
  static Future<void> seedInitialData() async {
    final usersCol = _fire.collection('users');
    final usersSnap = await usersCol.limit(1).get();
    if (usersSnap.docs.isEmpty) {
      await usersCol.doc('demo_user').set({
        'uid': 'demo_user',
        'displayName': 'John Doe',
        'email': 'john@example.com',
        'balance': 34321000,
        'photoUrl': 'https://i.pravatar.cc/150?img=3',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }

    final friendsCol = _fire.collection('friends');
    final friendsSnap = await friendsCol.limit(1).get();
    if (friendsSnap.docs.isEmpty) {
      final sampleFriends = [
        {
          'uid': 'friend_1',
          'name': 'Natasha',
          'photoUrl': 'https://i.pravatar.cc/150?img=5',
          'phone': '0300-1111111',
        },
        {
          'uid': 'friend_2',
          'name': 'Yoseph',
          'photoUrl': 'https://i.pravatar.cc/150?img=6',
          'phone': '0300-2222222',
        },
        {
          'uid': 'friend_3',
          'name': 'Ali',
          'photoUrl': 'https://i.pravatar.cc/150?img=7',
          'phone': '0300-3333333',
        },
        {
          'uid': 'friend_4',
          'name': 'Aisha',
          'photoUrl': 'https://i.pravatar.cc/150?img=8',
          'phone': '0300-4444444',
        },
      ];

      for (final f in sampleFriends) {
        await friendsCol.doc(f['uid']).set({
          ...f,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    }

    final banksCol = _fire.collection('banks');
    final banksSnap = await banksCol.limit(1).get();
    if (banksSnap.docs.isEmpty) {
      final sampleBanks = [
        {'code': 'ABL', 'name': 'Allied Bank', 'logoUrl': '', 'ifsc': ''},
        {'code': 'HBL', 'name': 'Habib Bank', 'logoUrl': '', 'ifsc': ''},
        {'code': 'MCB', 'name': 'MCB Bank', 'logoUrl': '', 'ifsc': ''},
      ];
      for (final b in sampleBanks) {
        await banksCol.doc(b['code']).set({
          ...b,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    }

    final txCol = _fire.collection('transactions');
    final txSnap = await txCol
        .where('userId', isEqualTo: 'demo_user')
        .limit(1)
        .get();
    if (txSnap.docs.isEmpty) {
      final sampleTx = [
        {
          'userId': 'demo_user',
          'type': 'sent',
          'counterparty': 'Natasha',
          'amount': 250000.0, //
          'currency': 'Rs',
          'note': 'Dinner split',
          'date': Timestamp.fromDate(
            DateTime.now().subtract(const Duration(days: 2)),
          ),
          'direction': 'out',
        },
        {
          'userId': 'demo_user',
          'type': 'received',
          'counterparty': 'Yoseph',
          'amount': 100000.0,
          'currency': 'Rs',
          'note': 'Refund',
          'date': Timestamp.fromDate(
            DateTime.now().subtract(const Duration(days: 4)),
          ),
          'direction': 'in',
        },
        {
          'userId': 'demo_user',
          'type': 'sent',
          'counterparty': 'Mike',
          'amount': 30000.0,
          'currency': 'Rs',
          'note': 'Groceries',
          'date': Timestamp.fromDate(
            DateTime.now().subtract(const Duration(days: 7)),
          ),
          'direction': 'out',
        },
      ];

      for (final t in sampleTx) {
        await txCol.add({...t, 'createdAt': FieldValue.serverTimestamp()});
      }
    }

    print('Firestore seed complete (if empty collections were found).');
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> friendsStream() {
    return _fire.collection('friends').orderBy('name').snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> banksStream() {
    return _fire.collection('banks').orderBy('name').snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> transactionsForUserStream(
    String userId,
  ) {
    return _fire
        .collection('transactions')
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .snapshots();
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> userDocStream(
    String uid,
  ) {
    return _fire.collection('users').doc(uid).snapshots();
  }
}
