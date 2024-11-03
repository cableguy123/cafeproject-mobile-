import sqlite3 from 'sqlite3';
import crypto from 'crypto';
import util from 'util';

const db = new sqlite3.Database('/Users/sawauchiryouta/cafe-project-mobile-db/cafe-project-mobile-db.db');

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
  const { name, email, password, fomrSalt, created_at } = req.body;
  const createdAt = new Date().toISOString().split('T')[0];
  createHashPassword(password).then(({ hashedPassword, salt }) => {
    db.run('INSERT INTO users (name, email, password, created_at) VALUES (?, ?, ?, ?)', [name, email, hashedPassword, createdAt], function (err) {
      if (err) {
        return res.status(400).json({
          error: "登録済みのメール",
        });
      } else {
        return res.status(200).json({
          name: name,
          email: email,
          password: hashedPassword,
          fomrSalt: salt,
          created_at: createdAt
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
