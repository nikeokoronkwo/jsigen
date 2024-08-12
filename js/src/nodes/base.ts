export interface BaseNode {
    kind: NodeType;
    exportKind: ExportKind
}

export type Type = string | PrimitiveType | InterfaceType

export type ExportKind = "NamedExport" | "DefaultExport" | "Export"

type PrimitiveType = "string" | "number" | "boolean"

interface InterfaceType<T = any> {
    [k: string] : T
}

type NodeType = "string" |
"number" |
"boolean" |
"bigint" |
"symbol" |
"null" |
"undefined" | "function" | "object"
