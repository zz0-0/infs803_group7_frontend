import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';

class Data extends ConsumerWidget {
  const Data({
    super.key,
    required this.data,
  });

  final List<User> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(
            label: Expanded(
              child: Text(
                'ID',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Created At',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Updated At',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: data
            .map(
              (e) => DataRow(
                cells: [
                  DataCell(
                    Text(e.id as String),
                  ),
                  DataCell(
                    Text(e.name),
                  ),
                  DataCell(
                    Text(e.createdAt! as String),
                  ),
                  DataCell(
                    Text(e.updatedAt! as String),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
