import 'code_style/fix_absolute_import.dart' as fix_absolute_import;
import 'code_style/fix_import_order.dart' as fix_import_order;

void main() {
  final root = '../';
  fix_absolute_import.fixDirectory(root);
  fix_import_order.fixDirectory(root);
}
