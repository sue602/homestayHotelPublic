<template>
  <div class="h-order-checkout">
    <el-card>
      <template #header><span class="title">入住管理 / 退房</span></template>
      <el-table :data="tableData" stripe style="width:100%">
        <el-table-column prop="id" label="订单号" width="100" />
        <el-table-column prop="roomName" label="入住房源" />
        <el-table-column prop="guest" label="入住人" width="100" />
        <el-table-column prop="checkIn" label="入住日期" width="120" />
        <el-table-column label="操作" width="200">
          <template #default>
            <el-button size="small" @click="handleExtend">续住</el-button>
            <el-button size="small" type="danger" @click="handleCheckOut">退房</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-empty v-if="tableData.length===0" description="暂无入住中订单" />
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
const tableData = reactive([
  { id: '1002', roomName: '温馨双人房', guest: '李四', checkIn: '2024-05-10' },
])
const handleExtend = () => ElMessage.info('续住功能开发中')
const handleCheckOut = () => {
  ElMessageBox.confirm('确认办理退房？', '提示', { type: 'warning' })
    .then(() => { ElMessage.success('退房成功'); tableData.length = 0 })
    .catch(() => {})
}
</script>
