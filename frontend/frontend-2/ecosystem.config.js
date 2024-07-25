module.exports = {
  apps: [
    {
      name: 'react-app-3000',
      script: 'npm',
      args: 'start',
      env: {
        NODE_ENV: 'development',
        PORT: 3000
      },
      env_production: {
        NODE_ENV: 'production',
        PORT: 3000
      }
    },
    {
      name: 'react-app-3001',
      script: 'npm',
      args: 'start',
      env: {
        NODE_ENV: 'development',
        PORT: 3001
      },
      env_production: {
        NODE_ENV: 'production',
        PORT: 3001
      }
    }
  ]
};
