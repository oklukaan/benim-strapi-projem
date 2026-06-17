import type { Core } from '@strapi/strapi';

const config = ({ env }: Core.Config.Shared.ConfigParams): Core.Config.Server => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: env('PUBLIC_URL', 'http://70.40.138.3'), // Canlıdaki IP adresini buraya çaktık
  app: {
    keys: env.array('APP_KEYS'),
  },
});

export default config;