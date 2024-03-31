import { pgTable } from "drizzle-orm/pg-core";
import { hasLinkToUser } from "../users";
import { hasLinkToPermission } from "../permissions";

export const userPermissionToSystem = pgTable('userPermissionToSystem', {
  ...hasLinkToUser(),
  ...hasLinkToPermission(),
});