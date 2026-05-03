<template>
  <div class="room-list">
    <FrontHeaderBar />
    <div style="padding: 20px; max-width: 1200px; margin: 0 auto;">
      <h2>房源列表</h2>
      <el-row :gutter="20">
        <el-col :span="8" v-for="i in 12" :key="i" style="margin-bottom: 20px;">
          <el-card shadow="hover" @click="$router.push('/detail/' + i)">
            <div style="height: 180px; background: #f5f5f5; display: flex; align-items: center; justify-content: center; color: #999;">
              房源图片 {{ i }}
            </div>
            <div style="padding: 14px;">
              <span>精选民宿 {{ i }}</span>
              <div class="bottom" style="margin-top: 8px; color: #f56c6c; font-weight: bold;">
                ¥{{ 200 + i * 50 }}/晚
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script setup lang="ts">
import FrontHeaderBar from '@/components/front/FrontHeaderBar.vue'
</script>
