<template>
  <div class="room-detail">
    <FrontHeaderBar />
    <div style="padding: 20px; max-width: 1200px; margin: 0 auto;">
      <el-button text @click="$router.back()">← 返回列表</el-button>
      <el-row :gutter="30" style="margin-top: 20px;">
        <el-col :span="14">
          <el-carousel height="400px">
            <el-carousel-item v-for="i in 4" :key="i">
              <div style="height:100%;background:#f5f5f5;display:flex;align-items:center;justify-content:center;color:#999;font-size:20px;">
                房源图片 {{ i }}
              </div>
            </el-carousel-item>
          </el-carousel>
        </el-col>
        <el-col :span="10">
          <h2>民宿名称 {{ $route.params.id }}</h2>
          <p style="color:#666;margin:12px 0;">温馨舒适的大床房，配备全套家具家电，采光极佳。</p>
          <div style="font-size:24px;color:#f56c6c;font-weight:bold;margin:16px 0;">
            ¥299 <span style="font-size:14px;color:#999;font-weight:normal;">/晚</span>
          </div>
          <el-form label-width="80px">
            <el-form-item label="入住日期">
              <el-date-picker type="daterange" range-separator="至" start-placeholder="开始日期" end-placeholder="结束日期" style="width:100%" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" style="width:100%;" @click="handleOrder">立即预订</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
      <el-divider />
      <div>
        <h3>评价</h3>
        <el-empty description="暂无评价" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import FrontHeaderBar from '@/components/front/FrontHeaderBar.vue'
import { useRoute } from 'vue-router'
import { ElMessage } from 'element-plus'
const route = useRoute()
const handleOrder = () => {
  ElMessage.info('请先登录后再预订')
}
</script>
