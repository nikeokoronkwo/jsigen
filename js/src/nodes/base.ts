export interface BaseNode {}

export type Type = string | PrimitiveType | InterfaceType

export type ExportKind = "NamedExport" | "DefaultExport" | "Export"

type PrimitiveType = "string" | "number" | "boolean"

interface InterfaceType<T = any> {
    [k: string] : T
}
