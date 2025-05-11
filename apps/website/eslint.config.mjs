import nx from '@nx/eslint-plugin';
import baseConfig from '../../eslint.config.mjs';


globalThis.structuredClone = globalThis.structuredClone || ((obj) => JSON.parse(JSON.stringify(obj)));

export default [
  ...baseConfig,
  ...nx.configs['flat/react'],
  {
    files: ['**/*.ts', '**/*.tsx', '**/*.js', '**/*.jsx'],
    // Override or add rules here
    rules: {},
  },
];
