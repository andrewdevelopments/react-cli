import { ReactNode } from "react";
import UserContext from "./user.context";

const UserProvider = ({ children }: { children: ReactNode }) => {
    return <UserContext.Provider value={{}}>{children}</UserContext.Provider>;
};

export default UserProvider;

