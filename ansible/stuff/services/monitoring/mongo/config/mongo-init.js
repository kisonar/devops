db.createUser({
    user: 'rocco',
    pwd: 'rocco',
    roles: [
        {
            role: 'dbOwner',
            db: 'graylog',
        },
    ],
});