export const server = 'https://localhost:44359';

export const webAPIUrl = `${server}/api`;

export const authSettings = {
  domain: 'jmfloreszazo.us.auth0.com',
  client_id: 'Daz5HOz14SvpjLXrGBNBonvXI6na3hit',
  redirect_uri: window.location.origin + '/signin-callback',
  scope: 'openid profile QandAAPI email',
  audience: 'https://jmfloreszazo',
};
