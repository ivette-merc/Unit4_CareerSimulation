const jwt = require("jsonwebtoken");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const JWT_SECRET = "helloworld";

const findUserWithToken = async (token) => {
  let id;
  try {
    const payload = await jwt.verify(token, JWT_SECRET);
    id = payload.id;
    console.log("payload is:", payload);
  } catch (error) {
    console.error("Error verifying JWT:", error);
    throw new Error("Not authorized");
  }

  try {
    const user = await prisma.users.findUnique({
      where: {
        id: id,
      },
      select: {
        id: true,
        username: true,
      },
    });

    if (!user) {
      throw new Error("User not found");
    }

    return user;
  } catch (error) {
    console.error("Error querying database:", error);
    throw new Error("Internal Server Error");
  }
};

const isLoggedIn = async (req, res, next) => {
  try {
    // Extracting the token from the authorization header
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];

    if (!token) {
      throw new Error("Authorization token not provided");
    }

    // Finding user with the provided token
    req.user = await findUserWithToken(token);
    next();
  } catch (error) {
    next(error);
  }
};

module.exports = isLoggedIn;
