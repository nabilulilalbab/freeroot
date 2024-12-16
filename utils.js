function generateRandomId() {
    return `${Math.round(Math.random() * 1_000_000)}-${Math.round(Math.random() * 1_000_000)}-${Math.round(Math.random() * 1_000_000)}-${Math.round(Math.random() * 1_000_000)}-${Math.round(Math.random() * 1_000_000)}`
}

module.exports = {
    generateRandomId
}