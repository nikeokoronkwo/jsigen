import { BaseNode, Type } from "./base";
export interface ParameterNode<T = any> extends BaseNode {
    name: string;
    type: Type;
    optional?: boolean;
    default?: T;
}
export interface FunctionNode extends BaseNode {
    parameters: ParameterNode[];
    type: Type;
    name: string;
}
