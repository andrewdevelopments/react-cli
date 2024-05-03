import { ReactNode } from "react";
import ProductContext from "./product.context";

const ProductProvider = ({ children }: { children: ReactNode }) => {
    return <ProductContext.Provider value={{}}>{children}</ProductContext.Provider>;
};

export default ProductProvider;

