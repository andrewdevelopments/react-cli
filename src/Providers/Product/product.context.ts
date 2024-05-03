import { IProductProvider } from "./product.provider.interface";
import { createContext, useContext } from "react";

const ProductContext = createContext<IProductProvider>({} as IProductProvider);

export const useProductContext = () => useContext(ProductContext);

export default ProductContext;

