[Anasayfa](index.md) | [Operatörler](op.md) | [Notlar](not.md)

### VeriTabanı Yedek Alma

```
sudo mongodump --db backupdb --out /path/to/`date +"%m-%d-%y"`
```

### VeriTabanı Restore

```
mongorestore --db newdb --drop /path/to/%date%/backupdb/
```

### Replica Set

Replica kümeleri: Yedeklemekte olduğunuz sunucu bir eşleme kümesinin parçasıysa,
yedeklenen veriler güncel olmayabileceğinden ikincil sorunlara neden olabilir.
Yedeklemenin işlemleri içermesini sağlamak için --oplog seçeneğini kullanabilirsiniz.

```
--host=<replica_set_name>/<primary_host_address>:<port>
````
#### Geri yüklemek için --nsInclude anahtarı
Geri yüklemenin daha kolay bir yolu --nsInclude anahtarını kullanmaktır. Bu, bir
joker karakter olarak bir yıldız işareti (*)  kullanmaktadır.

```
mongorestore --nsInclude backup.*
```
