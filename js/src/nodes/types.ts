import { TSType } from "@babel/types";

type JSIAny = "any"

type JSIType = "any" | "boolean" | "BigInt" | "intrinsic" | "never" | "null" | "number" | "object"

function babelTypeToType(t: TSType) {
    switch (t.type) {
        case "TSAnyKeyword":
            return "any"
        case "TSBooleanKeyword":
            return "boolean"
        case "TSBigIntKeyword":
            return "BigInt"
        case "TSIntrinsicKeyword":
            return "intrinsic"
        case "TSNeverKeyword":
            return "never"
        case "TSNullKeyword":
            return "null"
        case "TSNumberKeyword":
            return "number"
        case "TSObjectKeyword":
            return "object"
        case "TSStringKeyword":
        case "TSSymbolKeyword":
        case "TSUndefinedKeyword":
        case "TSUnknownKeyword":
        case "TSVoidKeyword":
        case "TSThisType":
        case "TSFunctionType":
        case "TSConstructorType":
        case "TSTypeReference":
        case "TSTypePredicate":
        case "TSTypeQuery":
        case "TSTypeLiteral":
        case "TSArrayType":
        case "TSTupleType":
        case "TSOptionalType":
        case "TSRestType":
        case "TSUnionType":
        case "TSIntersectionType":
        case "TSConditionalType":
        case "TSInferType":
        case "TSParenthesizedType":
        case "TSTypeOperator":
        case "TSIndexedAccessType":
        case "TSMappedType":
        case "TSLiteralType":
        case "TSExpressionWithTypeArguments":
        case "TSImportType":
    }
}
