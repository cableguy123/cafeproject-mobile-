import { jwt } from '../config.mjs';
import JWT from 'jsonwebtoken';

export function checkAuth(req, res, next) {

    //   jwtトークンを取得
    const authHeader = req.headers.authorization;
    const token = authHeader.split(' ')[1];

    if (!authHeader) {
        return res.status(401).send('Access denied: No token provided');
    }

    try {

        const authUser = JWT.verify(token, jwt.secret);
        // console.log(authUser);
        req.body.user_id = authUser.user_id;
        req.body.email = authUser.email;
        req.body.role = authUser.role;

        next();
    } catch (error) {
        // トークンの有効期限が切れたときのフロー
        if (error.name === "TokenExpiredError") {
            return res.status(401).json({
                msg: "トークンの有効期限が切れています",
            });
        } else if (error.name === "JsonWebTokenError") {
            return res.status(401).json({
                msg: "トークンが無効です。",
            });
        } else {
            return res.status(500).json({
                msg: "サーバーエラーが発生しました。",
            });
        }
    }

};
