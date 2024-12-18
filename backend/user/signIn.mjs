import sqlite3 from 'sqlite3';
import dotenv from 'dotenv/config';
import crypto from 'crypto';
import util from 'util';

const db = new sqlite3.Database(`/Users/${process.env.USERNAME}/cafe-project-mobile-db/test.db`);

const pbkdf2Promis = util.promisify(crypto.pbkdf2);

export function getUser(req, res) {
    const { user_id, email, password } = req.body;

    // console.log(`getUserの${user_id}`);
    // console.log(`getUserの${email}`);
    // console.log(`getUserの${password}`);

    db.get('SELECT user_id,name,salt,password FROM users WHERE user_id = ? and email = ? ', [user_id, email], async (err, row) => {
        if (!row) {
            // console.log(row);
            res.status(500).send('selectの結果を確認してください');
        } else {
            // console.log({ row: row });
            let salt = row.salt;
            const key = await pbkdf2Promis(password, salt, 104906, 64, "sha512");
            const hashedPassword = key.toString("base64");

            // console.log({
            //     dbpassword: row.password,
            //     hashedPassword: hashedPassword
            // });
            const isMatch = (row.password === hashedPassword);
            if (!isMatch) {
                return res.status(400).json([
                    {
                        msg: "パスワードが違います",
                    },
                ]);
            } else {
                res.status(200).json(
                    {

                        msg: "success login user",
                        autheticated_user: row.name,
                        autheticated_userid: row.user_id,
                    }
                );
            }

        }
    });
};