import { defineConfig } from "astro/config"

export default defineConfig({
    vite: {
        server: {
            watch: {
                usePolling: true,
            },
            host: '0.0.0.0',
        }
    }
})