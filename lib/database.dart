import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_booble_translator/copyright_text_model.dart';

class DatabaseWithCopyrightTexts {
  static late Future<Database> database;

  static createInstance() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'copyrightTexts.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE copyright_text(copyright_text TEXT)',
        );
      },
      version: 1,
    );

    // deleteDatabase(join(await getDatabasesPath(), 'copyrightTexts.db'));

    // await deleteAllCopyrightTexts();
    // var db = await database;
    // var texts_with_copyright = [
    //   CopyrightText(
    //     copyrightText:
    //         'ТОВАР-УЧАСТНИК АКЦИИ «ФИНАЛЬНАЯ ЦЕНА» — ДОПОЛНИТЕЛЬНЫЕ СКИДКИ НЕ ПРИМЕНЯЮТСЯ. Является источником необходимых Омега-6 жирных кислот с правильным сочетанием минеральных веществ и витаминов. 100% сбалансированный рацион. Баланс минералов. Содержит витамины Д и Е.',
    //   ),
    //   CopyrightText(
    //     copyrightText:
    //         'Любимый нежный вкус для вашего кота! После обеда с новыми силами можно продолжать домашние приключения! Влажный корм для кошек Kitekat с сочными кусочками курицы в соусе — это порция сочных кусочков с курицей, приготовленных по особому рецепту. В его основе — формула сбалансированного питания, которая содержит белки, минералы, витамины, таурин и животные жиры. Kitekat — это идеальный источник жизненных сил для кошки.',
    //   ),
    //   CopyrightText(
    //     copyrightText:
    //         'ТОВАР-УЧАСТНИК АКЦИИ «ФИНАЛЬНАЯ ЦЕНА» — ДОПОЛНИТЕЛЬНЫЕ СКИДКИ НЕ ПРИМЕНЯЮТСЯ. Влажный корм для кошек Perfect Fit с курицей в соусе Для стерилизованных кошек разработан по специальной рецептуре для контроля здоровья кошек, прошедших стерилизацию. Поддерживает здоровье мочевыводящей системы у стерилизованных кошек, подверженных повышенному риску развития мочекаменной болезни. Поддержание здорового веса. Специальный ингредиент L-карнитин способствует сжиганию жиров, помогая поддерживать здоровый вес.',
    //   ),
    //   CopyrightText(
    //     copyrightText:
    //         'ТОВАР-УЧАСТНИК АКЦИИ «ФИНАЛЬНАЯ ЦЕНА» — ДОПОЛНИТЕЛЬНЫЕ СКИДКИ НЕ ПРИМЕНЯЮТСЯ. Влажный корм для котят Whiskas полнорационный от 1 до 12 месяцев Рагу с курицей — это сбалансированный рацион для здорового роста вашего малыша. Котенок с удовольствием попробует маленькие нежные кусочки с курицей в ароматном соусе. Все для замурррчательной жизни! Рационы Whiskas для котят позаботятся об иммунитете, поддержат здоровое пищеварение и обеспечат здоровый рост и развитие. Котята активно растут и с первых дней нуждаются в правильном питании. Корм Whiskas для котят создан с учетом всех особенностей развития организма котенка. Для здорового роста и правильного развития корм Whiskas для котят содержит оптимальное сочетание питательных веществ, витаминов и минералов. Содержит 100% натуральные высококачественные ингредиенты: мясо и субпродукты без добавления ароматизаторов, искусственных красителей и консервантов, кальций для здоровья костей, омега-6 и цинк для здоровья кожи и шерсти, витамин А и таурин для хорошего зрения, витамины D, E и минералы. Ваш котенок будет мурчать от удовольствия!',
    //   ),
    //   CopyrightText(
    //     copyrightText:
    //         'Влажный корм для стерилизованных кошек Purina One с курицей и фасолью в соусе помогает поддерживать здоровую мочевыделительную систему, уменьшая концентрацию минералов, которые могут привести к образованию камней в почках. Разработан специально для поддержания здорового обмена веществ после стерилизации. Помогает поддерживать естественную защиту организма благодаря антиоксидантам, таким как витамин Е. С клетчаткой, которая доказанно улучшает здоровье пищеварительной системы. Курица высокого качества — источник белка и отличного вкуса. Без добавления искусственных красителей, консервантов и ароматизаторов.',
    //   ),
    // ];

    // for (var text in texts_with_copyright) {
    //   await insertCopyrightText(text);
    // }

    // var texts = await copyrightTexts();
    // for(var text in texts) {
    //   print(text);
    // }
  }

  static Future<void> insertCopyrightText(CopyrightText copyrightText) async {
    final db = await database;
    await db.insert(
      'copyright_text',
      copyrightText.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<String>> get copyrightTexts async {
    final db = await database;

    final List<Map<String, Object?>> copyrightTextMaps =
        await db.query('copyright_text');

    var texts = <String>[];

    for (var map in copyrightTextMaps) {
      texts.add(map['copyright_text'] as String);
    }
    return texts;
  }

  static Future<void> updateCopyrightText(CopyrightText copyrightText) async {
    final db = await database;
    await db.update(
      'copyright_text',
      copyrightText.toMap(),
      where: 'copyright_text = ?',
      whereArgs: [copyrightText.copyrightText],
    );
  }

  static Future<void> deleteAllCopyrightTexts() async {
    final db = await database;
    db.delete('copyright_text');
  }

  static Future<void> deleteCopyrightText(String copyrightText) async {
    final db = await database;
    await db.delete(
      'copyright_text',
      where: 'copyright_text = ?',
      whereArgs: [copyrightText],
    );
  }

  static Future<bool> isCopyrightText(String text) async {
    
    List<String> texts = await copyrightTexts;
    for(int i = 0; i  < texts.length; i++) {
      texts[i] = texts[i].toLowerCase();
    }
    
    return texts.contains(text);
  }
}
