import { pgTable } from "drizzle-orm/pg-core";
import { hasLinkToPermission } from "../permissions";
import { hasLinkToGroup } from "../groups";

export const groupPermissionToSystem = pgTable('groupPermissionToSystem', {
  ...hasLinkToGroup(),
  ...hasLinkToPermission(),
});