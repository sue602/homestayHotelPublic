import router from "@/router/index"
import store from "@/store"
import type { RouteLocationNormalized, NavigationGuardNext } from 'vue-router'

/**路由守卫，每次请求都要先在这里进行判断 */
router.beforeEach((to: RouteLocationNormalized, from: RouteLocationNormalized, next: NavigationGuardNext) => {
    const whiteList = ['/', '/index', '/login', '/front/forget'] // 白名单
    // 正则匹配 /detail/*
    const path1 = /^\/detail\//

    const token = store.getters.GET_TOKEN;
    const hasRoutes = store.state.hasRoutes;
    if (token) {
        if (!hasRoutes) {
            store.commit("SET_ROUTES_STATE", true);
        }
        next();
    } else {
        if (whiteList.includes(to.path) || path1.test(to.path)) {
            next();
        } else {
            next("/login")
        }
    }
})
