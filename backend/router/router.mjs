import express from 'express';
import { createUser } from '../user/createUser.mjs'; // Import ESM module
import { selectUser } from '../user/signup.mjs';

const router = express.Router();

router.post('/createUser',function(req,res) {
    if (req.body.name && req.body.email && req.body.password) {
        createUser(req, res);
    }else {
        res.status(404).send('Not Add User');
    }
});

router.post('/signup',function(req,res) {
    if(req.body.email && req.body.password) {
        selectUser(req,res);
    }else {
        res.status(404).send('Not SELECT USER');
    }
})

export default router;
