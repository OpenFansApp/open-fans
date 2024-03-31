// https://stackoverflow.com/a/51851844
export type ArgumentTypes<F extends Function> = F extends (...args: infer A) => any ? A : never;
