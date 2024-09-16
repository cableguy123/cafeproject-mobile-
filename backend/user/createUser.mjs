import sqlite3 from 'sqlite3';
import crypto from 'crypto';
import util from 'util';
import { selectUser } from './signup.mjs';

const db = new sqlite3.Database('/Users/imseoghyeon/testDb1');

const randomBytesPromise = util.promisify(crypto.randomBytes);
const pbkdf2Promis = util.promisify(crypto.pbkdf2);

const createSalt = async () => {
  const buf = await randomBytesPromise(64);
  return buf.toString("base64");
}
const createHashPassword = async (password) => {
  const salt = await createSalt();
  const key = await pbkdf2Promis(password,salt, 104906, 64, "sha512");
  const hashedPassword = key.toString("base64");
  return { hashedPassword,salt };
}
export function createUser(req, res) {
  const email = req.body.email;
  const password = req.body.password;
  createHashPassword(password).then(({hashedPassword}) => {
    db.run('INSERT INTO USER (email, password) VALUES (?, ?)', [email, hashedPassword], function (err) {
      if (err) {
        return res.status(400).json({
          error: "登録済みのメール",
        });
      } else {
        return res.status(200).json({
          email: email,
          password: hashedPassword
        });
      }
    });
  }).catch(error => {
    return res.status(500).json({
      error: "例外",
    });
  });
}
