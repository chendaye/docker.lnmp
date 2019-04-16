db = db.getSiblingDB('newDB');  // 创建一个名为"newDB"的DB
db.createUser(  // 创建一个名为"chendaye666"的用户，设置密码和权限
  {
    user: "chendaye666",
    pwd: "long",
    roles: [
      { role: "dbOwner", db: "newDB"}
    ]
  }
);
db.createCollection("newCollection");  // 在"newDB"中创建一个名为"newCollection"的Collection
