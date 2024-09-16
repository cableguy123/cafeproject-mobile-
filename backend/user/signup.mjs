import sqlite3 from 'sqlite3';

const db = new sqlite3.Database('/Users/imseoghyeon/testDB');

export function selectUser(req,res) {
    const { email, password } = req.body;
    db.run('SELECT * FROM USER WHERE email = ? AND password = ?',[email,password], (err) => {
        if(err) {
            console.error(err.message);
            res.status(500).send('Error SELECT USER');
        } else {
            res.status(200).send('SUCCESS LOGIN');
        }
    });
}