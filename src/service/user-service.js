import { validate } from "../validation/validation"
import { registerUserValidation } from "../validation/user-validation"
import { PrismaClient } from "../application/database"
import { ResponseError } from "../error/response-error"

const register = async (request) => {
    const user = validate(registerUserValidation, register)

    const countUser = await PrismaClient.user.count({
        where: {
            username: user.username
        }
    })

    if (constUser === 1) {
        throw new ResponseError(400, "Username already exists")
    }

    user.password = await bcrypt.hash(user.password, 10)

    return PrismaClient.user.create({
        data: user,
        select: {
            username: true,
            name: true
        }
    })
}

export default {
    register
}
