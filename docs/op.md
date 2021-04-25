[Anasayfa](index.md) | [Yedek-Restore](backup.md) | [Notlar](not.md)

## Karşılaştırma Sorgusu Operatörleri
### $in 
$ İn operatörü, bir alanın değerinin belirtilen dizideki herhangi bir değere eşit olduğu belgeleri seçer.

```
db.test.find( { kredi: { $in: [ 100, 200 ] } } )
```
Bu sorgu, kredi miktarı alanı değerinin 100 ve 200 mikratı olan tüm document'leri seçer.

### $eq

Eşitlik koşulunu belirtir. $ Eq operatörü, bir alanın değerinin belirtilen değere eşit olduğu document'lerle eşleşir.

```
db.test.find( { kredi: { $eq:100 } } )
```
Bu sorgu kredi mikratı 100 olan değerleri döndürür.

### $gt
$ gt, alanın değerinin belirtilen değerden büyük olduğu (>) document'leri seçer.
### $gte
$ gte, alanın değerinin belirli bir değerden (ör. değer) büyük veya ona eşit (> =) olduğu document'leri seçer.
### $lt
$ lt, alanın değerinin belirtilen değerden küçük olduğu ( <) document'leri seçer.
### $lte
$ lte, alanın değerinin belirtilen değerden küçük veya ona eşit (<=) olduğu document'leri seçer.
### $ne
$ ne, alanın değerinin belirtilen değere eşit olmadığı belgeleri seçer. Bu, alanı içermeyen document'leri  içerir.
### $nin
Alan değerlerinde belirtilmemiş değerlerden oluşan document'leri seçer.

## Mantıksal Sorgu Operatörleri
### $and
$and bir veya daha fazla ifadeden oluşan bir dizi üzerinde mantıksal bir AND işlemi gerçekleştirir.

```
db.test.find(
{
"$and" : [
{"ülke" : { "$in": TR }},
{"doğum" : {"$lt":"1968-01-01"}}
]
}).count();
````
Document içersinde ülkesi TR ve Yaşı 1968 doğumlulardan yaşlı olan  kişileri bulmaktadır.

### $not
$not belirtilen üzerinde mantıksal bir DEĞİL işlemi gerçekleştirmez. Operatör deki  eşleşmeyen document'leri seçer.
```
db.inventory.find( { fiyat: { $not: { $gt: 500 } } } )
```
fiyat alanı değeri 500'den küçük veya ona eşit veya alan mevcut değil


### $nor
$ nor, bir veya daha fazla sorgu ifadesi dizisi üzerinde mantıksal bir not-or işlemi gerçekleştirir ve dizideki tüm sorgu ifadelerinde başarısız olan document'leri seçer.

### $or
$or operatörü, iki veya daha fazla sorgudan oluşan bir dizi üzerinde mantıksal bir OR işlemi gerçekleştirir.
```
db.test.find( { $or: [ { miktar: { $lt: 20 } }, { fiyat: 10 } ] } )
```
Bu sorgu, test collection'da ki miktar alanı değerinin 20'den küçük veya fiyat alanı değerinin 10'a eşit olduğu tüm documentleri seçecektir.
