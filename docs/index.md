# MongoDB Hızlı Eğitim
Operatörler(op.md)
## _MongoDb nedir?_
<head>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-5L17LQ14YC"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-5L17LQ14YC');
</script>
</head>


MongoDB; MongoDB Inc. tarafından ölçeklenebilir, doküman tabanlı, C++ ile geliştirilmiş açık kaynak, NoSQL veritabanı uygulamasıdır. 

<table class="nice">
	<th>RDBMS</th>
	<th>MongoDB</th>
	<tr>
		<td>Database</td>
		<td>Database</td>
	</tr>
	<tr>
		<td>Table</td>
		<td>Collection</td>
	</tr>
	<tr>
		<td>Tuple/Row</td>
		<td>Document</td>
	</tr>
	<tr>
		<td>column</td>
		<td>Field</td>
	</tr>
        <tr>
                <td>Table Join</td>
	        <td>Embedded Documents</td>
        </tr>
        <tr>
                <td>Primary Key</td>
                <td>Primary Key (Default key _id provided by MongoDB itself)</td>
        </tr>
	
</table>



- Mongodb Kurulumu

     ```sh
    docker pull erelbi/mongodb-test
    ```


- Container ayağa kaldırılması

    ```sh
    docker run --name mongodb-test -dp 27017:27017 erelbi/mongodb-test
    docker exec -it mongodb-test  /bin/bash
    ```
- Örnek Veritabanının Yüklenmesi

    ```sh
        bash /tmp/testdb_create.sh 
            >>connected to: mongodb://localhost/
            >>25359 document(s) imported successfully. 0 document(s) failed to import.
    ```
    
## MongoDB Konsoluna Bağlantı

Mongo Kabuğuna Bağlantı

  ```sh
    mongo
  ```
Beklenen Çıktı:
```
MongoDB server version: 4.4.5
---
The server generated these startup warnings when booting: 
        2021-04-24T14:56:28.563+00:00: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem
        2021-04-24T14:56:29.286+00:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
        2021-04-24T14:56:29.286+00:00: You are running this process as the root user, which is not recommended
        2021-04-24T14:56:29.286+00:00: This server is bound to localhost. Remote systems will be unable to connect to this server. Start the server with --bind_ip <address> to specify which IP addresses it should serve responses from, or with --bind_ip_all to bind to all interfaces. If this behavior is desired, start the server with --bind_ip 127.0.0.1 to disable this warning
---
---
        Enable MongoDB's free cloud-based monitoring service, which will then receive and display
        metrics about your deployment (disk utilization, CPU, operation statistics, etc).

        The monitoring data will be available on a MongoDB website with a unique URL accessible to you
        and anyone you share the URL with. MongoDB may use this information to make product
        improvements and to suggest MongoDB products and deployment options to you.

        To enable free monitoring, run the following command: db.enableFreeMonitoring()
        To permanently disable this reminder, run the following command: db.disableFreeMonitoring()
---
> 
```
### Mevcut Veri Tabanları
```sh
show dbs;
```
Beklenen Çıktı:
```
admin   0.000GB
config  0.000GB
local   0.000GB
testdb  0.009GB
```

### Collection Bağlantı

```sh
use testdb
```
### Document Oluşturma
```sh
db.test.insert({"name":"test","surname":"eğitim"})
```
### Mevcut Collectionları Göster
```
db.getCollectionNames()
```
### Document Güncelleme
```
db.test.updateOne({"name":"test"},{$set:{"surname":"öğretim"}} )
```
Beklenen Çıktı:
```
WriteResult({ "nInserted" : 1 })
```
Test:
```
db.test.findOne({})
{
        "_id" : ObjectId("6084364599678331093b0684"),
        "name" : "test",
        "surname" : "öğretim"
}
```
### Document'a yeni bir field ekleme
```
db.test.update({},{$set: {"new_field*":1}},false,true)
```
Beklenen Çıktı:
```
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
```
Test:
```
db.test.findOne({})
{
        "_id" : ObjectId("6084364599678331093b0684"),
        "name" : "test",
        "surname" : "öğretim",
        "new_field*" : 1
}
```

### Document'dan field çıkarma
```
db.test.update( { _id: ObjectId("6084364599678331093b0684") },{ $unset: {"new_field*": ""}})
```
!!! id değerine bakınız. İd değerinin eşleşmesi gerekmektedir.

Beklenen Çıktı:
```
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
```
Test:
```
db.test.findOne({})
{
        "_id" : ObjectId("6084364599678331093b0684"),
        "name" : "test",
        "surname" : "öğretim"
}
```
### Veri Tabanı Silme

```
use veritabanı
db.dropDatabase()
````
