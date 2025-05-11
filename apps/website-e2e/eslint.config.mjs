import playwright from 'eslint-plugin-playwright';
import baseConfig from '../../eslint.config.mjs';

globalThis.structuredClone ||= (obj) => JSON.parse(JSON.stringify(obj));

export default [
  playwright.configs['flat/recommended'],
  ...baseConfig,
  {
    files: ['**/*.ts', '**/*.js'],
    // Override or add rules here
    rules: {},
  },
];
