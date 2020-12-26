# HaveFunWithRealm
In this project i wanna build an useful DataBase with realm, nevertheless i'm a GRDB fan 😄, but whatever let's give it a shot 😉
# Usage
It's pretty simple, just follow these instructions and you have it 🙂
### Create
```Swift
let object = RealmObject()
Cruder<RealmObject>().connect(actionType: .create, item: object)
```
### Get items
```Swift     
let items = Cruder<RealmObject>().getItems()
```
### Get item with id
```Swift
let item = Cruder<RealmObject>().getItem(with: "your object id")
```
### Update Item
```Swift
Cruder<RealmObject>().connect(actionType: .update, item: RealmObject(), newItem: AnotherRealmObject()) { (success, error) in }
```
### Delete Item
```Swift
Cruder<RealmObject>().connect(actionType: .delete, item: RealmObject()) { (success, error) in }
```

Author
=======
sahandraeisi1994@gmail.com, sahandraeisi@yahoo.com, [shndrs](https://linkedin.com/in/shndrs)

License
=======
EZProgressHUD is available under the MIBSL-1.0 license. See the LICENSE file for more info.
