import express from 'express';
import { createUser } from '../user/createUser.mjs'; // Import ESM module
import { getUser } from '../user/signIn.mjs';
import { getIdbyEmailandPassword, deleteUser } from '../user/deleteUser.mjs';
import { checkAuth } from '../middleware/checkAuth.mjs';


const router = express.Router();

router.post('/signUp', function (req, res) {
    if (req.body.user_id && req.body.name && req.body.email && req.body.password) {
        createUser(req, res);
    } else {
        res.status(404).send('Not Add User');
    }
});

router.post('/signIn', checkAuth, function (req, res) {
    if (req.body.email && req.body.password) {
        getUser(req, res);
    } else {
        res.status(404).send('ログインに失敗しました。e-mailまたはパスワードが違う可能性があります');
    }
})

router.post('/deleteUser', async function (req, res) {

    if (req.body.email && req.body.password) {
        try {
            const result = await getIdbyEmailandPassword(req);
            console.log(result.id);
            deleteUser(result.id);
            res.status(200).send(`${result.id}のユーザーをdeleteしました`);
        } catch (error) {
            console.error(error.message); // エラーメッセージをコンソールに出力
            res.status(401).send(error.message); // 認証失敗時のレスポンスを送
        }
    } else {
        res.status(404).send('Not DELETE USER');
    }
})


export default router;
