import sqlite3 from 'sqlite3';


const db = new sqlite3.Database('/Users/sawauchiryouta/cafe-project-mobile-db/cafe-project-mobile-db.db');



export function getIdbyEmailandPassword(req) {
    return new Promise((resolve, reject) => {
        const { email, password } = req.body;
        console.log(email);
        console.log(password)
        db.get("SELECT id,name FROM USERS WHERE email = ? AND password = ? ", [email, password], (err, row) => {
            if (err) {
                console.error(err.message);
                return reject(new Error(err.message));
            } else {
                console.log(row);
                resolve({ id: row.id, name: row.name });

            }

        });
    });
}

export function deleteUser(id) {
    db.run('DELETE FROM USERS WHERE id = ? ', [id], (err) => {
        if (err) {
            console.error(err.message);
            res.status(500).send('Not DELETE USER');
        } else {
            res.status(200).send('DELETE USER');

        }
    });
}