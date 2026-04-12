import { defineConfig } from 'vite'
import { tanstackStart } from '@tanstack/react-start/plugin/vite'
import tailwindcss from '@tailwindcss/vite'
import react from '@vitejs/plugin-react'
import { resolveMesherBackendOrigin } from './mesher-backend-origin.mjs'

const mesherBackendOrigin = resolveMesherBackendOrigin().toString()

export default defineConfig({
  server: {
    port: 3000,
    proxy: {
      '/api/v1': {
        target: mesherBackendOrigin,
        changeOrigin: true,
      },
    },
  },
  resolve: {
    tsconfigPaths: true,
  },
  plugins: [tanstackStart(), react(), tailwindcss()],
})
