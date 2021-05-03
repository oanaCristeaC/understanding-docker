docker run -dp 3000:3000 \
> -v todo-db:/etc/todos \
>   -w /app -v "$(pwd):/app" \
>      node:12-alpine \
>      sh -c "yarn install && yarn run dev"
