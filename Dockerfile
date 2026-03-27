FROM denoland/deno:1.41.0

WORKDIR /app

# Cache dependencies
COPY deno.json .
RUN deno cache --import-map=deno.json https://deno.land/x/fresh@1.6.8/server.ts

# Copy project files and build
COPY . .
RUN deno task build

EXPOSE 8000

CMD ["run", "-A", "main.ts"]
