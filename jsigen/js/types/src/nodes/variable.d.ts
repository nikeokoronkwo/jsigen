import { BaseNode } from "./base";
export interface VariableNode<T = any> extends BaseNode {
    name: string;
    type: T;
}
