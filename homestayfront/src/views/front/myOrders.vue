<template>
  <div class="my-orders">
    <FrontHeaderBar />
    <div style="padding:20px;max-width:1200px;margin:0 auto;">
      <h2>我的订单</h2>
      <el-table :data="tableData" style="width:100%;margin-top:16px;" stripe>
        <el-table-column prop="id" label="订单号" width="100" />
        <el-table-column prop="roomName" label="房源名称" />
        <el-table-column prop="checkIn" label="入住日期" width="120" />
        <el-table-column prop="checkOut" label="退房日期" width="120" />
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status==='已入住'?'success':'warning'">{{ row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180">
          <template #default>
            <el-button size="small" @click="handleCancel">取消订单</el-button>
            <el-button size="small" type="primary" @click="handleReview">评价</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-empty v-if="tableData.length===0" description="暂无订单" />
    </div>
  </div>
</template>

<script setup lang="ts">
import FrontHeaderBar from '@/components/front/FrontHeaderBar.vue'
import { reactive } from 'vue'
import { ElMessage } from 'element-plus'
const tableData = reactive([
  { id: '1001', roomName: '阳光大床房', checkIn: '2024-05-01', checkOut: '2024-05-03', status: '已入住' },
])
const handleCancel = () => ElMessage.info('请先登录')
const handleReview = () => ElMessage.info('请先登录')
</script>
