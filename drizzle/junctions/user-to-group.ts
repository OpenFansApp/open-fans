import { pgTable } from "drizzle-orm/pg-core";
import { hasLinkToUser } from "../users";
import { hasLinkToGroup } from "../groups";

export const userToGroup = pgTable('userToGroup', {
  ...hasLinkToUser(),
  ...hasLinkToGroup(),
});