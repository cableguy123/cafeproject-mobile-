import dotenv from 'dotenv/config';

export const jwt = {
    secret: process.env.SECRETKEY,
    options: {
        algorithm: "HS256",
        expiresIn: "1d", // 1 day
    },
};
