import { defineConfig } from 'drizzle-kit'

export default defineConfig({
  schema: "./drizzle/schema.ts",
  driver: 'pg',
  dbCredentials: {
    connectionString: `postgres://${process.env.POSTGRES_USER}:${process.env.POSTGRES_PASSWORD}@0.0.0.0:5432/${process.env.POSTGRES_DB}`
  },
  verbose: true,
  strict: true,
  out: "./migrations",
})