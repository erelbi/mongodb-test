
[Anasayfa](index.md) | [Operatörler](op.md) | [Yedek-Restore](backup.md)



## MongoDB replica set initialization hatası
Şayet şuna benzer bir hata görüldü ise;

```markdown
fastRs1:PRIMARY> rs.add("192.168.122.202:27017");
{
	"operationTime" : Timestamp(1620311271, 1),
	"ok" : 0,
	"errmsg" : "Quorum check failed because not enough voting nodes responded; required 2 but only the following 1 voting nodes responded: 192.168.122.200:27017; the following nodes did not respond affirmatively: 192.168.122.202:27017 failed with Error connecting to 192.168.122.202:27017 :: caused by :: No route to host",
	"code" : 74,
	"codeName" : "NodeNotFound",
	"$clusterTime" : {
		"clusterTime" : Timestamp(1620311271, 1),
		"signature" : {
			"hash" : BinData(0,"9lWhy7G0jH18i+iVGJZc77gscYI="),
			"keyId" : NumberLong("6959160918735323140")
		}
	}
}

```
-> 

```md
net:
  port: 27017
  bindIp: 0.0.0.0 # Burasına dikkat
```

->servisler restart edilir. Hata geliyorsa..
```sh
chown mongod:mongod /tmp/mongodb-27017.sock 
```
Şayet Aynı hata alınıyorsa fedora 34 server kullanılıyorsa
```sh
netstat -tlnp | grep mongo
tcp        0      0 0.0.0.0:27017           0.0.0.0:*               LISTEN      2120/mongod   
```
Bu şekilde gözükse bile bağlantı hatası alabilirsiniz. Test için ufw güvenlik duvarını yükleyin
```sh
 ufw allow from xxx.xxx.xxx.0/24 to any port 27017
 ```
 Güvenlik duvarı kurun ve telnet bağlantısı çekin bağlantı sağlandı ise tekrar deneyin.
 -----------------------------------------------------------------------------------------


