class ResponseError extends Error {
    constructor(statu, message) {
        super(message)
        this.status = status
    }
}

export { ResponseError }