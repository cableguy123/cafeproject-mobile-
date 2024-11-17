import sqlite3 from 'sqlite3';
import crypto from 'crypto';
import util from 'util';
import { jwt } from '../config.mjs';
import JWT from 'jsonwebtoken';

const db = new sqlite3.Database(`/Users/${process.env.USERNAME}/cafe-project-mobile-db/test.db`);

const randomBytesPromise = util.promisify(crypto.randomBytes);
const pbkdf2Promis = util.promisify(crypto.pbkdf2);

const createSalt = async () => {
  const buf = await randomBytesPromise(64);
  return buf.toString("base64");
}

const createHashPassword = async (password) => {
  const salt = await createSalt();
  const key = await pbkdf2Promis(password, salt, 104906, 64, "sha512");
  const hashedPassword = key.toString("base64");
  return { hashedPassword, salt };
}

export function createUser(req, res) {
  const { user_id, name, email, password, fomrSalt, created_at } = req.body;


  const createdAt = new Date().toISOString().split('T')[0];
  createHashPassword(password).then(({ hashedPassword, salt }) => {
    db.run('INSERT INTO users (user_id, name, email, password, salt, created_at) VALUES (?,?,?, ?, ?, ?)', [user_id, name, email, hashedPassword, salt, createdAt], function (err) {
      if (err) {
        return res.status(400).json({
          errors: err
        });
      } else {
        // console.log("登録成功");

        //要相談　tokenに何を返すか 
        const payload = {
          user_id: user_id,
          email: email,
        };

        const token = JWT.sign(payload, jwt.secret, jwt.options);


        return res.status(200).json({
          mig: "success create user",
          token: token,
        });
      }
    }
    );
  }).catch(error => {
    return res.status(500).json({
      error: "例外",
    });
  });
}
