db = db.getSiblingDB('newDB');  // ����һ����Ϊ"newDB"��DB
db.createUser(  // ����һ����Ϊ"chendaye666"���û������������Ȩ��
  {
    user: "chendaye666",
    pwd: "long",
    roles: [
      { role: "dbOwner", db: "newDB"}
    ]
  }
);
db.createCollection("newCollection");  // ��"newDB"�д���һ����Ϊ"newCollection"��Collection
