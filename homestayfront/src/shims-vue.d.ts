/* eslint-disable */
declare module '*.vue' {
  import type { DefineComponent } from 'vue'
  const component: DefineComponent<{}, {}, any>
  export default component
}

// @element-plus/icons-vue 类型声明
declare module '@element-plus/icons-vue' {
  import type { Component } from 'vue'
  export const User: Component
  export const Unlock: Component
  export const Key: Component
  export const ArrowRight: Component
  export const ArrowDown: Component
  export const Moon: Component
  export const Sunny: Component
  export const House: Component
  export const Tools: Component
  export const Operation: Component
  export const Menu: Component
  export const Avatar: Component
  export const Document: Component
  export const Notebook: Component
  export const Picture: Component
  export const Promotion: Component
  export const Postcard: Component
  const _default: Record<string, Component>
  export default _default
}

// vue-router 类型补充（修复 .d.mts 文件在某些情况下无法被 TypeScript 识别的问题）
declare module 'vue-router' {
  import type { Component } from 'vue'
  import type { RouteLocationNormalized, NavigationGuardNext } from 'vue-router'
  export function createRouter(options: any): any
  export function createWebHistory(base?: string): any
  export type RouteRecordRaw = any
  export function useRoute(): RouteLocationNormalized
  export function useRouter(): any
  export const createWebHashHistory: any
  export const createMemoryHistory: any
}
