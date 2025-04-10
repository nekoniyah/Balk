import { serve } from "bun";
import { join } from "path";

const port = process.env.PORT || 3000;
const staticDir = process.env.STATIC_DIR || "public";

const server = serve({
    port,
    async fetch(req) {
        const url = new URL(req.url);
        const path = url.pathname === "/" ? "/index.html" : url.pathname;

        try {
            // Try to serve the requested file
            const file = Bun.file(join(staticDir, path));
            if (await file.exists()) {
                return new Response(file);
            }

            // If file not found, try serving index.html
            const indexFile = Bun.file(join(staticDir, "index.html"));
            if (await indexFile.exists()) {
                return new Response(indexFile);
            }

            // If no index.html, return 404
            return new Response("Not Found", { status: 404 });
        } catch (error) {
            return new Response("Internal Server Error", { status: 500 });
        }
    },
});

console.log(`Static file server running at http://localhost:${port}`);
