import Vue from 'vue'
import VueRouter, { RouteConfig } from 'vue-router'

Vue.use(VueRouter)

const routes: Array<RouteConfig> = [
  {
    path: '/',
    name: 'root',
    redirect: '/approval'
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: () => import('@/views/dashboard/Dashboard.vue')
  },
  {
    path: '/approval',
    name: 'approval',
    component: () => import('@/views/approval/Approval.vue')
  }
]

export const Routes = routes.reduce(
  (acc: { [key: string]: RouteConfig }, cur) => {
    const key = cur.name || ''
    if (!acc[key]) {
      acc[key] = cur
    }
    return acc
  },
  {}
)

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  scrollBehavior() {
    return { x: 0, y: 0 } // resetting scroll after route change
  },
  routes
})

export default router
