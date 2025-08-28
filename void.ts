function printHello(): void{
    console.log("Hello, World!")
}

function handleError(): never{
    throw new Error("This function never returns normally");
}