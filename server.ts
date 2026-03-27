const server = Bun.serve({
  port: 3000,
  static: {
    "/": new Response(await Bun.file("public/index.html").bytes(), {
      headers: { "Content-Type": "text/html" },
    }),
  },
  async fetch(req) {
    let path = new URL(req.url).pathname;
    if (path.endsWith("/")) path += "index.html";
    const file = Bun.file(`public${path}`);
    if (await file.exists()) return new Response(file);
    return new Response("Not Found", { status: 404 });
  },
});

console.log(`Listening on http://localhost:${server.port}`);
