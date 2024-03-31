
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import * as schema from './schema';

const queryClient = postgres(
  `postgres://${process.env.POSTGRES_USER}:${process.env.POSTGRES_PASSWORD}@0.0.0.0:5432/${process.env.POSTGRES_DB}`
);

export const db = drizzle(queryClient, {
  schema,
});