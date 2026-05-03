<template>
  <div class="h-order-check">
    <el-card>
      <template #header><span class="title">预订处理</span></template>
      <el-table :data="tableData" stripe style="width:100%">
        <el-table-column prop="id" label="订单号" width="100" />
        <el-table-column prop="roomName" label="房源名称" />
        <el-table-column prop="guest" label="预订人" width="100" />
        <el-table-column prop="checkIn" label="预计入住" width="120" />
        <el-table-column label="操作" width="200">
          <template #default>
            <el-button size="small" type="primary" @click="handleEdit">编辑</el-button>
            <el-button size="small" type="danger" @click="handleCancel">取消预订</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-empty v-if="tableData.length===0" description="暂无预订" />
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
const tableData = reactive([
  { id: '2001', roomName: '阳光大床房', guest: '王五', checkIn: '2024-06-01' },
])
const handleEdit = () => {}
const handleCancel = () => {
  ElMessageBox.confirm('确定取消该预订？', '提示', { type: 'warning' })
    .then(() => ElMessage.success('已取消'))
    .catch(() => {})
}
</script>
