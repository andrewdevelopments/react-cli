import { IUserProvider } from "./user.provider.interface";
import { createContext, useContext } from "react";

const UserContext = createContext<IUserProvider>({} as IUserProvider);

export const useUserContext = () => useContext(UserContext);

export default UserContext;

