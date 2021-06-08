import 'package:stat_dhimas/models/item.dart';

class CatalogModel {
  static List<String> itemNames = [
    'Buku Bergambar',
    'Buku Panduan Makan Lengkap',
    'Buku Dongeng Tidur Lengkap',
    'Buku Hantam Lengkap',
  ];

  ItemModel getById(int id) => ItemModel(id, itemNames[id % itemNames.length]);

  ItemModel getByPosition(int position) {
    return getById(position);
  }
}
