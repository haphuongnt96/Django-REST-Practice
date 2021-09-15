import { NavigationGuardNext, Route } from 'vue-router'

type Context = {
  to: Route
  from: Route
  next: NavigationGuardNext
}

export function nextFactory(
  context: Context,
  middleware: any[],
  index: number
) {
  const subsequentMiddleware = middleware[index]
  // If no subsequent Middleware exists,
  // the default `next()` callback is returned.
  if (!subsequentMiddleware) return context.next

  return (...parameters: any) => {
    // Run the default Vue Router `next()` callback first.
    context.next(...parameters)
    // Then run the subsequent Middleware with a new
    // `nextMiddleware()` callback.
    const nextMiddleware = nextFactory(context, middleware, index + 1)
    subsequentMiddleware({ ...context, next: nextMiddleware })
  }
}
