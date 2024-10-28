import js from "@eslint/js";
import globals from "globals";
import tseslint from "@typescript-eslint/eslint-plugin"; // プラグインを直接インポート
import tsParser from "@typescript-eslint/parser"; // TypeScript 用パーサーをインポート
import eslintConfigPrettier from "eslint-config-prettier";
import jsdoc from "eslint-plugin-jsdoc";

export default [
    {
        files: ["**/*.{js,mjs,cjs,ts}"],
        ignores: ["./dist"],
        languageOptions: {
            globals: {
                ...globals.node,
                ...globals.es2020,
            },
            parser: tsParser, // TypeScript パーサーを設定
            parserOptions: {
                ecmaVersion: "latest",
            },
        },
        plugins: {
            jsdoc: jsdoc,
            "@typescript-eslint": tseslint, // TypeScript ESLint プラグインを追加
        },
        rules: {
            ...js.rules,
            ...jsdoc.configs["recommended-typescript-error"].rules, // JSDoc ルールを直接追加
            ...tseslint.configs.recommended.rules, // TypeScript ESLint の推奨ルールを直接追加
            ...eslintConfigPrettier.rules, // Prettier のルールを直接追加
            "jsdoc/require-description": "error",
            "jsdoc/check-values": "error",
            'no-console': 'error'
        },
    },
];
