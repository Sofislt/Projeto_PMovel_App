interface IUser {
    id: number;
    name: string;
    password: string;
    email?: string; //"?" diz que o atributo é opcional
}
const usuario: IUser = {
    id: 1,
    name: "Alice",
    password: "securepassword123",
    email: "alice@gmail.com"
}