const UserServices = require('../services/user.service');

exports.regUser = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { name, surname, email, birthdate, pic, password } = req.body;
        const duplicate = await UserServices.getUserByEmail(email);

        if (duplicate) {
            throw new Error(`User Already Extists`)
        }
        const response = await UserServices.registerUser(name, surname, email, birthdate, pic, password);

        res.json({ status: true, success: 'User registered successfully' });


    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
}

exports.login = async (req, res, next) => {
    try {

        const { email, password } = req.body;

        if (!email || !password) {
            throw new Error('Parameters are not correct');
        }
        let user = await UserServices.checkUser(email);
        if (!user) {
            throw new Error('User does not exist');
        }

        const isPasswordCorrect = await user.comparePassword(password);

        if (isPasswordCorrect === false) {
            throw new Error(`Username or Password does not match`);
        }

        // Creating Token

        let tokenData = { _id: user._id, email: user.email };
    

        const token = await UserServices.generateAccessToken(tokenData,"secret","1h")

        res.status(200).json({ status: true, success: "sendData", token: token });
    } 
    
    catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}