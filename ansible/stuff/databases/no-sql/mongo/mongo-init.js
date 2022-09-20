db.auth('admin', 'password')

db = db.getSiblingDB('admin')

db.createUser({
    user: 'my-user',
    pwd: 'my-password',
    roles: [
        {
            role: 'readWrite',
            db: 'my-database',
        },
    ],
});