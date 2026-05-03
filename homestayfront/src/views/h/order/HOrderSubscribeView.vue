<template>
  <div class="h-order-subscribe">
    <el-card>
      <template #header><span class="title">民宿预订/入住</span></template>
      <el-table :data="tableData" stripe style="width:100%">
        <el-table-column prop="roomName" label="空闲房源" />
        <el-table-column prop="price" label="价格/晚" width="100">
          <template #default="{ row }">¥{{ row.price }}</template>
        </el-table-column>
        <el-table-column label="操作" width="200">
          <template #default>
            <el-button size="small" type="primary" @click="handleSubscribe">预订</el-button>
            <el-button size="small" type="success" @click="handleCheckIn">直接入住</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-dialog v-model="dialogVisible" :title="dialogType==='subscribe'?'预订':'入住'" width="500px">
      <el-form :model="form" label-width="80px">
        <el-form-item label="客户姓名"><el-input v-model="form.name" /></el-form-item>
        <el-form-item label="手机号"><el-input v-model="form.phone" /></el-form-item>
        <el-form-item label="入住日期"><el-date-picker type="daterange" style="width:100%" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible=false">取消</el-button>
        <el-button type="primary" @click="handleConfirm">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { ElMessage } from 'element-plus'
const dialogVisible = ref(false)
const dialogType = ref<'subscribe'|'checkin'>('subscribe')
const form = reactive({ name: '', phone: '' })
const tableData = reactive([
  { roomName: '阳光大床房', price: 299 },
  { roomName: '温馨双人房', price: 399 },
])
const handleSubscribe = () => { dialogType.value = 'subscribe'; dialogVisible.value = true }
const handleCheckIn = () => { dialogType.value = 'checkin'; dialogVisible.value = true }
const handleConfirm = () => { ElMessage.success('操作成功'); dialogVisible.value = false }
</script>
