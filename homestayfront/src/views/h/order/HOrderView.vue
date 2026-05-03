<template>
  <div class="h-order-view">
    <el-card>
      <template #header><span class="title">所有订单</span></template>
      <el-table :data="tableData" stripe style="width:100%">
        <el-table-column prop="id" label="订单号" width="100" />
        <el-table-column prop="roomName" label="房源名称" />
        <el-table-column prop="guest" label="入住人" width="100" />
        <el-table-column prop="checkIn" label="入住日期" width="120" />
        <el-table-column prop="checkOut" label="退房日期" width="120" />
        <el-table-column prop="amount" label="金额" width="100">
          <template #default="{ row }">¥{{ row.amount }}</template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status==='已退房'?'info':'success'">{{ row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="120">
          <template #default>
            <el-button size="small" @click="handleEdit">编辑</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue'
const tableData = reactive([
  { id: '1001', roomName: '阳光大床房', guest: '张三', checkIn: '2024-05-01', checkOut: '2024-05-03', amount: 598, status: '已退房' },
  { id: '1002', roomName: '温馨双人房', guest: '李四', checkIn: '2024-05-10', checkOut: '2024-05-12', amount: 798, status: '已入住' },
])
const handleEdit = () => {}
</script>
