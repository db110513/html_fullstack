const app = require('./app');
const db = require('./config/db');
const UserModel = require('./models/user.model');

const port = 3009;

app.get('/', (req, res) => {
    res.send('Hello !');
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});