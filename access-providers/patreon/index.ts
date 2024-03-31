import { db } from "@/drizzle";
import { accounts } from "@/drizzle/accounts";
import { and, eq } from "drizzle-orm";

export const PATREON_API_URL = 'https://www.patreon.com/api/oauth2/v2';

export async function getCampaigns(userId: string) {
  const [ result ] = await db
    .select({
      accessToken: accounts.access_token
    })
    .from(accounts)
    .where(
      and(
        eq(accounts.userId, userId),
        eq(accounts.provider, 'patreon')
      )
    );

  const { accessToken } = result;

  return fetch(`${PATREON_API_URL}/identity?include=memberships`, {
    headers: {
      'Authorization': `Bearer ${accessToken}`
    }
  }).then(res => res.json());
}
