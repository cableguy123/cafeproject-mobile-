import express from 'express';
import userRouter from '../backend/router/router.mjs';
import bodyParser from 'body-parser';

const app = express();
app.use(bodyParser.json()); // Transfer to JSON Data
app.use('/', userRouter); // Route Path

const port = 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
